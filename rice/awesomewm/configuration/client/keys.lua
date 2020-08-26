local awful = require('awful')
local gears = require('gears')

require('awful.autofocus')

local modkey = require('configuration.keys.mod').mod_key
local altkey = require('configuration.keys.mod').alt_key

local dpi = require('beautiful').xresources.apply_dpi

local clientKeys =
    awful.util.table.join(

    -- close client
    awful.key(
        {modkey},
        'q',
        function(c)
            c:kill()
        end,
        {description = 'close', group = 'client'}
    ),
    -- move floating client to center
    awful.key(
        { modkey, 'Shift' },
        'c',
        function(c)
            local focused = awful.screen.focused()

            awful.placement.centered(c, {
                honor_workarea = true
            })
        end,
        {description = 'align a client to the center of the focused screen.', group = 'client'}
    ),

    -- toggle client floating mode
    awful.key(
        {modkey},
        'c',
        function(c)
            c.fullscreen = false
            c.maximized = false
            c.floating = not c.floating
            c:raise()
        end,
        {description = 'toggle floating', group = 'client'}
    )
)

return clientKeys
