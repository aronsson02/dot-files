local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

local create_clock = function(s)

    local clock_format = '<span font="SF Nodo Pro 14">%A %d %B %I:%M;%S %p</span>'

    s.clock_widget = wibox.widget.textclock(
        clock_format,
        1
    )

    s.clock_widget = wibox.widget {
        s.clock_widget,
        margins = dpi(2),
        widget = wibox.container.margin
    }

    s.clock_widget:connect_signal(
        'mouse::enter',
        function()
            local w = mouse.current_wibox
            if w then
                old_cursor, old_wibox = w.cursor, w
                w.cursor = 'hand1'
            end
        end
    )

    s.clock_widget:connect_signal(
        'mouse::leave',
        function()
            if old_wibox then
                old_wibox.cursor = old_cursor
                old_wibox = nil
            end
        end
    )

    return s.clock_widget
end

return create_clock
