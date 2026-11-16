# Spec: Weekly bills by day of week (Java bill-date generator)

Hand this file to Claude Code on the Debian server, from the Java project's directory:

```bash
claude "Implement the spec in /path/to/java-weekly-bills-day-of-week.md. Follow its safety rules exactly."
```

## Background

The Java CLI (run by cron on this server) reads bills from `vnd_bills` and writes the
individual due dates for each bill into `vnd_bill_dates`. It runs against the MySQL
databases `asimo124_bills` (live) and `asimo124_bills_test` (test).

The bill admin UI (MyBudgetLP → BillsSite `api/bills_admin/create.php` / `update.php`)
has changed how **weekly** bills are stored. The Java generator must be updated to match.
The PHP and Vue sides are already done; **do not change them, and do not change the
database schema.**

## Data contract

`vnd_bills` columns that matter (all `varchar` unless noted):

| Column | Meaning |
|---|---|
| `vnd_id` (int) | Bill id |
| `vnd_frequency` | `Once Per Month`, `Every 4 Weeks`, `Every 2 Weeks`, `Every 1 Week`, `Once` |
| `vnd_frequency_type` | `Day of Month`, `Starting From`, `Once`, and now **`Day of Week`** |
| `vnd_frequency_value` | Meaning depends on type (see below) |
| `start_date` (date, nullable) | Bill is not due before this date |
| `end_date` (date, nullable) | Bill is not due after this date |

### Old weekly format (still accept it; no rows currently use it)

- `vnd_frequency = 'Every 1 Week'`, `vnd_frequency_type = 'Starting From'`
- `vnd_frequency_value` = a seed date `YYYY-MM-DD`; a due date every 7 days after that seed.

### New weekly format (what the UI now writes)

- `vnd_frequency = 'Every 1 Week'`, `vnd_frequency_type = 'Day of Week'`
- `vnd_frequency_value` = a single digit `"0"` to `"6"`, using **PHP `date('w')` numbering**:
  `0 = Sunday, 1 = Monday, 2 = Tuesday, 3 = Wednesday, 4 = Thursday, 5 = Friday, 6 = Saturday`.
- The bill is due on **every** occurrence of that weekday.

Java numbering differs, so convert explicitly and add a unit test for it:

- `java.time.DayOfWeek`: MONDAY=1 … SUNDAY=7. The mapping is `DayOfWeek.of(v == 0 ? 7 : v)`.
- `java.util.Calendar.DAY_OF_WEEK`: SUNDAY=1 … SATURDAY=7. The mapping is `v + 1`.

## Required behavior

1. **Find the existing weekly logic first.** Locate where the generator handles
   `Every 1 Week` / `Starting From` and how it decides the date range it generates
   (window/horizon, "many weeks forth"), how it avoids duplicate rows in
   `vnd_bill_dates`, and what columns it writes. Reuse all of that. Only the way the
   **first** due date is chosen changes.
2. For bills with `vnd_frequency_type = 'Day of Week'`:
   - Begin from the same generation start the existing weekly code uses. If `start_date`
     is set and later, begin from `start_date` instead.
   - First due date = the first date **on or after** that start whose weekday equals the
     stored value (`TemporalAdjusters.nextOrSame(dayOfWeek)`).
   - Then repeat every 7 days through the existing horizon.
   - Stop at `end_date` (inclusive) when it is set.
   - Write rows to `vnd_bill_dates` exactly like other weekly rows: same columns, same
     amount and multiplier handling, same duplicate check.
3. Keep the old `Starting From` weekly path working unchanged.
4. Match `vnd_frequency_type` exactly but tolerate surrounding whitespace. Treat
   `vnd_frequency_value` as a string and trim it before parsing.
5. **Invalid value** for a `Day of Week` bill (empty, not 0–6, or a date): log a warning
   with `vnd_id`, skip that bill, and keep processing the others. Never crash the run
   because of one bill.
6. Don't change how any other frequency (`Once Per Month`, `Every 2 Weeks`,
   `Every 4 Weeks`, `Once`) is handled.

## Safety rules (must follow)

- **Before any run that writes data**, back up both databases into a timestamped folder
  outside the project:
  ```bash
  mkdir -p ~/backups/bills && ts=$(date +%Y%m%d_%H%M%S)
  mysqldump --single-transaction asimo124_bills      | gzip > ~/backups/bills/asimo124_bills_$ts.sql.gz
  mysqldump --single-transaction asimo124_bills_test | gzip > ~/backups/bills/asimo124_bills_test_$ts.sql.gz
  ```
  Use whatever MySQL credentials the Java app already uses. Never print or copy
  passwords into files, logs or commit messages.
- Develop and test against **`asimo124_bills_test` only**. Find how the app picks its
  database (config file, args or env) and point it at the test DB. Don't run the
  generator against `asimo124_bills` until the owner says so.
- Don't edit the crontab and don't replace the jar or binary the cron uses. Build the new
  version next to it and report the exact deploy command for the owner to run.
- Don't change the database schema, the PHP code, or rows of bills you didn't create
  for testing.

## Testing

1. **Unit tests** (use the project's existing test framework; if there is none, add a
   small JUnit 5 test with the build tool already in use):
   - Weekday mapping: all of 0–6 map to SUNDAY … SATURDAY.
   - First occurrence: start on a Wednesday with value `3` gives the same day; value `4`
     gives the next day; value `2` gives the following Tuesday (6 days later).
   - Respects `start_date` later than the generation start.
   - Stops at `end_date` (inclusive) and generates nothing if `end_date` is before the
     first occurrence.
   - Invalid values (`""`, `"7"`, `"-1"`, `"2026-11-20"`, `"Tue"`) are skipped without an
     exception.
   - The old `Starting From` weekly path gives the same output as before the change.
2. **Integration test on `asimo124_bills_test`:**
   - Insert two temporary bills with `vnd_bill` starting `ZZ_SPEC_TEST`: one
     `Every 1 Week` / `Day of Week` / `"2"` (Tuesday), and one with an invalid value `"9"`.
   - Run the generator against the test DB.
   - Check that every generated `vnd_bill_dates` row for the Tuesday bill falls on a
     Tuesday (`DAYOFWEEK(date) = 3` in MySQL, where Sunday = 1), 7 days apart, inside the
     horizon. Check that the invalid bill has no rows and a warning was logged.
   - Run the generator a second time and confirm no duplicate rows were added.
   - Delete the `ZZ_SPEC_TEST` bills and their `vnd_bill_dates` rows.

## Done when

- [ ] All unit tests pass, including the existing ones.
- [ ] The integration test on `asimo124_bills_test` passed and its test rows are cleaned up.
- [ ] The old weekly (`Starting From`) and all other frequencies behave exactly as before.
- [ ] Changes are committed on a new branch (not the default branch) with a clear message.
- [ ] A short report for the owner covering: files changed, how the weekday is
      calculated, test results, the backup file paths, and the exact command(s) to build
      and deploy the new version for the cron.
