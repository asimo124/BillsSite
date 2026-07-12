<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<title>Trip ETA</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<script src="https://unpkg.com/vue@3/dist/vue.global.prod.js"></script>
<style>
  :root{
    --ink:#10141a;
    --surface:#1a2029;
    --surface-2:#212836;
    --hairline:#2a313c;
    --text:#edeff2;
    --muted:#79828f;
    --amber:#ff8a4c;
    --teal:#4fd1c5;
    --danger:#ff6b6b;
  }
  *{box-sizing:border-box;}
  html,body{margin:0;padding:0;}
  body{
    background:var(--ink);
    color:var(--text);
    font-family:'Inter',system-ui,sans-serif;
    min-height:100vh;
    display:flex;
    justify-content:center;
    padding:24px 16px 48px;
    -webkit-font-smoothing:antialiased;
  }
  #app{width:100%;max-width:440px;}

  .eyebrow{
    font-size:12px;
    letter-spacing:.14em;
    text-transform:uppercase;
    color:var(--muted);
    margin:0 0 6px;
    font-weight:600;
  }
  h1{
    font-size:26px;
    margin:0 0 28px;
    font-weight:700;
    letter-spacing:-0.01em;
  }

  .card{
    background:var(--surface);
    border:1px solid var(--hairline);
    border-radius:16px;
    padding:20px;
    margin-bottom:16px;
  }

  label{
    display:block;
    font-size:12px;
    color:var(--muted);
    margin-bottom:6px;
    font-weight:600;
    letter-spacing:.02em;
  }

  input[type="text"], input[type="datetime-local"], select{
    width:100%;
    background:var(--surface-2);
    border:1px solid var(--hairline);
    border-radius:10px;
    padding:12px 14px;
    color:var(--text);
    font-family:inherit;
    font-size:15px;
    margin-bottom:16px;
    outline:none;
    transition:border-color .15s ease;
  }
  input[type="text"]:focus, input[type="datetime-local"]:focus, select:focus{
    border-color:var(--amber);
  }
  input::placeholder{color:var(--muted);}

  /* route signature: origin dot -- dashed line -- destination dot */
  .route-sig{
    display:flex;
    align-items:center;
    gap:10px;
    margin:4px 0 20px;
  }
  .dot{
    width:10px;height:10px;border-radius:50%;flex-shrink:0;
  }
  .dot.origin{background:var(--teal);}
  .dot.dest{background:var(--amber);}
  .route-sig .line{
    flex:1;
    height:0;
    border-top:2px dashed var(--hairline);
    position:relative;
    overflow:hidden;
  }
  .route-sig .line::after{
    content:'';
    position:absolute;
    top:-2px;left:0;
    height:2px;
    width:0%;
    border-top:2px dashed var(--amber);
    transition:width 1.1s cubic-bezier(.2,.8,.2,1);
  }
  .route-sig.animate .line::after{ width:100%; }

  .toggle-row{
    display:flex;
    gap:8px;
    margin-bottom:16px;
  }
  .toggle-row button{
    flex:1;
    padding:10px;
    border-radius:10px;
    border:1px solid var(--hairline);
    background:var(--surface-2);
    color:var(--muted);
    font-family:inherit;
    font-size:13px;
    font-weight:600;
    cursor:pointer;
  }
  .toggle-row button.active{
    border-color:var(--amber);
    color:var(--amber);
    background:rgba(255,138,76,0.08);
  }

  button.submit{
    width:100%;
    padding:14px;
    border-radius:10px;
    border:none;
    background:var(--amber);
    color:#1a0f06;
    font-family:inherit;
    font-size:15px;
    font-weight:700;
    cursor:pointer;
    transition:opacity .15s ease;
  }
  button.submit:disabled{opacity:.5;cursor:default;}
  button.submit:not(:disabled):active{opacity:.85;}

  .result{
    text-align:center;
    padding:8px 0 4px;
  }
  .result .duration{
    font-family:'JetBrains Mono',monospace;
    font-size:44px;
    font-weight:700;
    color:var(--amber);
    line-height:1;
    margin-bottom:6px;
  }
  .result .sub{
    font-family:'JetBrains Mono',monospace;
    font-size:13px;
    color:var(--muted);
  }
  .result .distance{
    margin-top:14px;
    font-size:13px;
    color:var(--muted);
  }

  .error{
    color:var(--danger);
    font-size:13px;
    margin-top:4px;
  }
  .hint{
    font-size:12px;
    color:var(--muted);
    line-height:1.5;
    margin-top:20px;
  }
  .hint code{
    background:var(--surface-2);
    padding:1px 5px;
    border-radius:4px;
    font-family:'JetBrains Mono',monospace;
  }
</style>
</head>
<body>
<div id="app">
  <p class="eyebrow">Route Planner</p>
  <h1>How long will it take?</h1>

  <div class="card">
    <div class="route-sig" :class="{animate: result}">
      <div class="dot origin"></div>
      <div class="line"></div>
      <div class="dot dest"></div>
    </div>

    <label>From</label>
    <input type="text" v-model="origin" placeholder="Starting address">

    <label>To</label>
    <input type="text" v-model="destination" placeholder="Destination address">

    <div class="toggle-row">
      <button :class="{active: timeMode==='departure'}" @click="timeMode='departure'">Leave at</button>
      <button :class="{active: timeMode==='arrival'}" @click="timeMode='arrival'">Arrive by</button>
    </div>

    <label>{{ timeMode === 'departure' ? 'Departure time' : 'Arrival time' }}</label>
    <input type="datetime-local" v-model="localDateTime">

    <button class="submit" @click="estimate" :disabled="loading || !canSubmit">
      {{ loading ? 'Calculating…' : 'Estimate trip time' }}
    </button>

    <p class="error" v-if="error">{{ error }}</p>
  </div>

  <div class="card result" v-if="result">
    <div class="duration">{{ result.durationLabel }}</div>
    <div class="sub">{{ result.whenLabel }}</div>
    <div class="distance">{{ result.distanceLabel }}</div>
  </div>

  <p class="hint">
    Calls your own backend at <code>/api/route.php</code>, which proxies Google's Routes API using a server-side key. Update <code>API_ENDPOINT</code> in this file if your backend lives elsewhere.
  </p>
</div>

<script>
const { createApp, ref, computed } = Vue;

// Point this at wherever route.php is deployed, e.g. "https://yourdomain.com/api/route.php"
const API_ENDPOINT = '/api/request_google_maps_trip_duration.php';

createApp({
  setup() {
    const origin = ref('');
    const destination = ref('');
    const timeMode = ref('departure');

    // default to "now" in the format datetime-local expects
    const toLocalInputValue = (d) => {
      const pad = (n) => String(n).padStart(2, '0');
      return `${d.getFullYear()}-${pad(d.getMonth()+1)}-${pad(d.getDate())}T${pad(d.getHours())}:${pad(d.getMinutes())}`;
    };
    const localDateTime = ref(toLocalInputValue(new Date()));

    const loading = ref(false);
    const error = ref('');
    const result = ref(null);

    const canSubmit = computed(() =>
      origin.value.trim() && destination.value.trim() && localDateTime.value
    );

    function formatDuration(totalSeconds) {
      const h = Math.floor(totalSeconds / 3600);
      const m = Math.round((totalSeconds % 3600) / 60);
      if (h > 0) return `${h} hr ${m} min`;
      return `${m} min`;
    }

    function formatWhen(date) {
      return date.toLocaleString(undefined, {
        weekday: 'short', month: 'short', day: 'numeric', hour: 'numeric', minute: '2-digit'
      });
    }

    // Parses "1234s" style strings the Routes API returns for duration fields
    function parseSeconds(durationStr) {
      if (!durationStr) return 0;
      const match = String(durationStr).match(/(\d+)/);
      return match ? parseInt(match[1], 10) : 0;
    }

    async function estimate() {
      error.value = '';
      result.value = null;
      loading.value = true;
      try {
        const anchor = new Date(localDateTime.value);
        const isoTimestamp = anchor.toISOString();

        const res = await fetch(API_ENDPOINT, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            origin: origin.value.trim(),
            destination: destination.value.trim(),
            timeMode: timeMode.value,
            timestamp: isoTimestamp,
          }),
        });

        const data = await res.json();

        if (!res.ok) {
          throw new Error(data?.error?.message || data?.error || 'Request failed');
        }

        if (!data.minDuration || !data.maxDuration) throw new Error('No route found between those addresses.');

        const minSeconds = parseSeconds(data.minDuration);
        const maxSeconds = parseSeconds(data.maxDuration);
        const meters = data.distanceMeters || 0;
        const miles = (meters / 1609.34).toFixed(1);

        // OPTIMISTIC and PESSIMISTIC can occasionally return the same value
        // on very short or uncongested routes - show a single figure then.
        const durationLabel = minSeconds === maxSeconds
          ? formatDuration(minSeconds)
          : `${formatDuration(minSeconds)} – ${formatDuration(maxSeconds)}`;

        let whenLabel;
        if (timeMode.value === 'departure') {
          const earliestArrival = new Date(anchor.getTime() + minSeconds * 1000);
          const latestArrival = new Date(anchor.getTime() + maxSeconds * 1000);
          whenLabel = minSeconds === maxSeconds
            ? `arriving ${formatWhen(earliestArrival)}`
            : `arriving ${formatWhen(earliestArrival)} – ${formatWhen(latestArrival)}`;
        } else {
          // For arrive-by, leave earlier for the pessimistic (longer) duration
          const latestLeave = new Date(anchor.getTime() - minSeconds * 1000);
          const earliestLeave = new Date(anchor.getTime() - maxSeconds * 1000);
          whenLabel = minSeconds === maxSeconds
            ? `leave by ${formatWhen(latestLeave)}`
            : `leave ${formatWhen(earliestLeave)} – ${formatWhen(latestLeave)}`;
        }

        result.value = {
          durationLabel,
          distanceLabel: `${miles} mi`,
          whenLabel,
        };
      } catch (e) {
        error.value = e.message || 'Something went wrong.';
      } finally {
        loading.value = false;
      }
    }

    return { origin, destination, timeMode, localDateTime, loading, error, result, canSubmit, estimate };
  }
}).mount('#app');
</script>
</body>
</html>
