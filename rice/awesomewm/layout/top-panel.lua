local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local icons = require('theme.icons')
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('widget.clickable-container')
local task_list = require('widget.task-list')
local tag_list = require('widget.tag-list')

local top_panel = function(s)
    local panel = wibox {
        ontop = true,
        screen = s,
        type = 'dock',
        height = dpi(24),
        width = s.geometry.width,
        x = s.geometry.x,
        y = s.geometry.y,
        stretch = false,
        bg = beautiful.background,
        fg = beautiful.fg_normal
    }

    panel:struts
    {
        top = dpi(24)
    }
--    panel:connect_signal("mouse::enter", function(h)
--        h:geometry({ height = dpi(24) })
--    end)

--    panel:connect_signal("mouse::leave", function(h)
--        h:geometry({ height = 1 })
--    end)

    panel:connect_signal(
            'mouse::enter', function()
        local w = mouse.current_wibox
        if w then
            w.cursor = 'left_ptr'
        end
    end)

    s.systray = wibox.widget {
        visible = false,
        base_size = dpi(20),
        horizontal = true,
        screen = 'primary',
        widget = wibox.widget.systray
    }

    local clock             = require('widget.clock')(s)
    local layout_box        = require('widget.layoutbox')(s)
    local add_button        = require('widget.open-default-app')(s)
    s.search                = require('widget.search-apps')()
    s.tray_toggler          = require('widget.tray-toggle')
    s.updater               = require('widget.package-updater')()
    s.screen_rec            = require('widget.screen-recorder')()
    s.bluetooth             = require('widget.bluetooth')()
    s.battery               = require('widget.battery')()
    s.network               = require('widget.network')()
    s.control_center_toggle = require('widget.control-center-toggle')()
    s.info_center_toggle    = require('widget.info-center-toggle')()
    s.stop                  = require('widget.end-session')()

    local separator =  wibox.widget {
        orientation = 'vertical',
        forced_height = dpi(1),
        forced_width = dpi(1),
        span_ratio = 0.6,
        widget = wibox.widget.separator
    }

    panel:setup {
        layout = wibox.layout.align.horizontal,
            expand = 'none',
            {
            layout = wibox.layout.fixed.horizontal,
            s.search,
            tag_list(s),
            separator,
            task_list(s)
            },
                clock,
            {
            layout = wibox.layout.fixed.horizontal,
            {
                s.systray,
                margins = dpi(5),
                widget = wibox.container.margin
            },
            s.tray_toggler,
            s.updater,
            s.screen_rec,
            s.network,
            s.bluetooth,
            s.battery,
            separator,
            s.control_center_toggle,
            separator,
            layout_box,
            s.info_center_toggle,
            separator,
            s.stop
                }
        }

    return panel
end

return top_panel
