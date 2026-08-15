(function ($) {
    function pad(n) {
        return n < 10 ? '0' + n : String(n);
    }

    function minuteOptions(selected) {
        var html = '';
        for (var i = 0; i <= 59; i++) {
            html += '<option value="' + i + '"' + (String(selected) === String(i) ? ' selected' : '') + '>' + pad(i) + '</option>';
        }
        return html;
    }

    function hourOptions(selected) {
        var html = '';
        for (var i = 0; i <= 23; i++) {
            html += '<option value="' + i + '"' + (String(selected) === String(i) ? ' selected' : '') + '>' + pad(i) + '</option>';
        }
        return html;
    }

    function rowHtml(minute, hour) {
        return (
            '<div class="cron-time-row" style="margin-bottom: 8px;">' +
                '<select class="form-control cron-minute" style="width: 90px; display: inline-block;">' + minuteOptions(minute) + '</select> ' +
                '<select class="form-control cron-hour" style="width: 90px; display: inline-block;">' + hourOptions(hour) + '</select> ' +
                '<button type="button" class="btn btn-default cron-remove" title="Remove time">&times;</button>' +
            '</div>'
        );
    }

    function updateCronTextarea($container, $textarea) {
        var lines = [];
        $container.find('.cron-time-row').each(function () {
            var minute = $(this).find('.cron-minute').val();
            var hour = $(this).find('.cron-hour').val();
            lines.push(minute + ' ' + hour + ' * * *');
        });
        $textarea.val(lines.join('\n'));
    }

    function parseCronLines(text) {
        var rows = [];
        var lines = (text || '').split(/\r\n|\r|\n/);
        for (var i = 0; i < lines.length; i++) {
            var line = $.trim(lines[i]);
            if (!line) {
                continue;
            }
            var parts = line.split(/\s+/);
            if (parts.length >= 2) {
                rows.push({ minute: parts[0], hour: parts[1] });
            }
        }
        return rows;
    }

    $.fn.cronTimeBuilder = function (options) {
        var settings = $.extend({
            textarea: '#cron_schedule',
            addButton: '#add_cron_time'
        }, options);

        return this.each(function () {
            var $container = $(this);
            var $textarea = $(settings.textarea);
            var $addButton = $(settings.addButton);

            function refresh() {
                updateCronTextarea($container, $textarea);
            }

            function addRow(minute, hour) {
                $container.append(rowHtml(minute || 0, hour || 0));
                refresh();
            }

            var existing = parseCronLines($textarea.val());
            if (existing.length) {
                for (var i = 0; i < existing.length; i++) {
                    addRow(existing[i].minute, existing[i].hour);
                }
            } else {
                addRow(0, 8);
            }

            $addButton.on('click', function () {
                addRow(0, 8);
            });

            $container.on('change', '.cron-minute, .cron-hour', refresh);

            $container.on('click', '.cron-remove', function () {
                if ($container.find('.cron-time-row').length <= 1) {
                    return;
                }
                $(this).closest('.cron-time-row').remove();
                refresh();
            });
        });
    };
})(jQuery);
