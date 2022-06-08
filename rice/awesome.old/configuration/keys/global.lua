local awful = require('awful')
local beautiful = require('beautiful')

require('awful.autofocus')

local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = require('configuration.keys.mod').mod_key
local altkey = require('configuration.keys.mod').alt_key
local apps = require('configuration.apps')

-- Key bindings
local globalKeys = awful.util.table.join(

    -- Hotkeys
    awful.key(
        {modkey},
        'F1',
        hotkeys_popup.show_help,
        {description = 'show help', group = 'awesome'}
    ),
    awful.key({modkey, 'Control'},
        'r',
        awesome.restart,
        {description = 'reload awesome', group = 'awesome'}
    ),
    awful.key(
        {altkey, 'Shift'},
        'm',
        function()
            awful.tag.incmwfact(0.05)
        end,
        {description = 'increase master width factor', group = 'layout'}
    ),
    awful.key(
        {altkey, 'Shift'},
        'k',
        function()
            awful.tag.incmwfact(-0.05)
        end,
        {description = 'decrease master width factor', group = 'layout'}
    ),
    awful.key(
        {modkey, 'Shift'},
        'm',
        function()
            awful.tag.incnmaster(1, nil, true)
        end,
        {description = 'increase the number of master clients', group = 'layout'}
    ),
    awful.key(
        {modkey, 'Shift'},
        'k',
        function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {description = 'decrease the number of master clients', group = 'layout'}
    ),
    awful.key(
        {modkey, 'Control'},
        'm',
        function()
            awful.tag.incncol(1, nil, true)
        end,
        {description = 'increase the number of columns', group = 'layout'}
    ),
    awful.key(
        {modkey, 'Control'},
        'k',
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        {description = 'decrease the number of columns', group = 'layout'}
    ),
    awful.key(
        {modkey},
        'space',
        function()
            awful.layout.inc(1)
        end,
        {description = 'select next layout', group = 'layout'}
    ),
    awful.key(
        {modkey, 'Shift'},
        'space',
        function()
            awful.layout.inc(-1)
        end,
        {description = 'select previous layout', group = 'layout'}
    ),
    awful.key(
        {modkey},
        'w',
        awful.tag.viewprev,
        {description = 'view previous tag', group = 'tag'}
    ),

    awful.key(
        {modkey},
        'r',
        awful.tag.viewnext,
        {description = 'view next tag', group = 'tag'}
    ),
    awful.key(
        {modkey, 'Control'},
        'n',
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                client.focus = c
                c:raise()
            end
        end,
        {description = 'restore minimized', group = 'screen'}
    ),
    awful.key(
        {},
        'XF86MonBrightnessUp',
        function()
            awful.spawn('light -A 10', false)
            awesome.emit_signal('widget::brightness')
            awesome.emit_signal('module::brightness_osd:show', true)
        end,
        {description = 'increase brightness by 10%', group = 'hotkeys'}
    ),
    awful.key(
        {},
        'XF86MonBrightnessDown',
        function()
            awful.spawn('light -U 10', false)
            awesome.emit_signal('widget::brightness')
            awesome.emit_signal('module::brightness_osd:show', true)
        end,
        {description = 'decrease brightness by 10%', group = 'hotkeys'}
    ),
    -- ALSA volume control
    awful.key(
                {},
                'XF86AudioRaiseVolume',
                function()
                        awful.spawn('amixer -D pulse sset Master 2%+', false)
                        awesome.emit_signal('widget::volume')
                        awesome.emit_signal('module::volume_osd:show', true)
                end,
                {description = 'increase volume by 2%', group = 'hotkeys'}
        ),
        awful.key(
                {},
                'XF86AudioLowerVolume',
                function()
                        awful.spawn('amixer -D pulse sset Master 2%-', false)
                        awesome.emit_signal('widget::volume')
                        awesome.emit_signal('module::volume_osd:show', true)
                end,
                {description = 'decrease volume by 2%', group = 'hotkeys'}
        ),
        awful.key(
                {},
        'XF86AudioMute',
        function()
            awful.spawn('amixer -D pulse set Master 1+ toggle', false)
        end,
        {description = 'toggle mute', group = 'hotkeys'}
    ),
    awful.key(
        { modkey, 'Control' },
        'c',
        function()
            awful.spawn('setxkbmap "jp (faelch)"', false)
        end,
        {description = 'Switch keyboard layout', group = 'hotkeys'}
    ),
    awful.key(
        { modkey, 'Control' },
        'ẋ',
        function()
            awful.spawn('setxkbmap "jp (latin)"', false)
        end,
        {description = 'Switch keyboard layout', group = 'hotkeys'}
    ),
    awful.key(
        {},
        'XF86AudioMicMute',
        function()
            awful.spawn('amixer set Capture toggle', false)
        end,
        {description = 'mute microphone', group = 'hotkeys'}
    ),
    awful.key(
        {},
        'XF86PowerOff',
        function()
            awesome.emit_signal('module::exit_screen_show')
        end,
        {description = 'toggle exit screen', group = 'hotkeys'}
    ),
    awful.key(
        {},
        'XF86Display',
        function()
            awful.spawn.single_instance('arandr', false)
        end,
        {description = 'arandr', group = 'hotkeys'}
    ),
    awful.key(
        {modkey, 'Shift'},
        'q',
        function()
            awesome.emit_signal('module::exit_screen_show')
        end,
        {description = 'toggle exit screen', group = 'hotkeys'}
    ),
    awful.key(
        { 'Control' },
        'Escape',
        function ()
            if screen.primary.systray then
                if not screen.primary.tray_toggler then
                    local systray = screen.primary.systray
                    systray.visible = not systray.visible
                else
                    awesome.emit_signal('widget::systray:toggle')
                end
            end
        end,
        {description = 'toggle systray visibility', group = 'Utility'}
    ),
    awful.key(
        {modkey},
        'l',
        function()
            awful.spawn(apps.default.lock, false)
        end,
        {description = 'lock the screen', group = 'Utility'}
    ),
    awful.key(
        {modkey},
        'Return',
        function()
            awful.spawn(apps.default.terminal)
        end,
        {description = 'open default terminal', group = 'launcher'}
    ),
    awful.key(
        {modkey, 'Shift'},
        'e',
        function()
            awful.spawn(apps.default.file_manager)
        end,
        {description = 'open default file manager', group = 'launcher'}
    ),
    awful.key(
        {modkey, 'Shift'},
        'f',
        function()
            awful.spawn(apps.default.web_browser)
        end,
        {description = 'open default web browser', group = 'launcher'}
    ),
    awful.key(
        {'Control', 'Shift'},
        'Escape',
        function()
            awful.spawn(apps.default.terminal .. ' ' .. 'htop')
        end,
        {description = 'open system monitor', group = 'launcher'}
    ),
    awful.key(
        {modkey},
        'e',
        function()
            local focused = awful.screen.focused()

            if focused.control_center then
                focused.control_center:hide_dashboard()
                focused.control_center.opened = false
            end
            if focused.info_center then
                focused.info_center:hide_dashboard()
                focused.info_center.opened = false
            end
            awful.spawn(apps.default.rofi_appmenu, false)
        end,
        {description = 'open application drawer', group = 'launcher'}
    ),
    awful.key(
        {},
        'XF86Launch1',
        function()
            local focused = awful.screen.focused()

            if focused.control_center then
                focused.control_center:hide_dashboard()
                focused.control_center.opened = false
            end
            if focused.info_center then
                focused.info_center:hide_dashboard()
                focused.info_center.opened = false
            end
            awful.spawn(apps.default.rofi_appmenu, false)
        end,
        {description = 'open application drawer', group = 'launcher'}
    ),
    awful.key(
        {modkey, 'Shift'},
        'x',
        function()
            awful.spawn(apps.default.rofi_global, false)
        end,
        {description = 'open global search', group = 'launcher'}
    ),
    awful.key(
        {modkey},
        'r',
        function()
            local focused = awful.screen.focused()
            if focused.info_center and focused.info_center.visible then
                focused.info_center:toggle()
            end
            focused.control_center:toggle()
        end,
        {description = 'open control center', group = 'launcher'}
    ),
    awful.key(
        {modkey, 'Shift'},
        'r',
        function()
            local focused = awful.screen.focused()
            if focused.control_center and focused.control_center.visible then
                focused.control_center:toggle()
            end
            focused.info_center:toggle()
        end,
        {description = 'open info center', group = 'launcher'}
    )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = 'view tag #', group = 'tag'}
        descr_toggle = {description = 'toggle tag #', group = 'tag'}
        descr_move = {description = 'move focused client to tag #', group = 'tag'}
        descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
    end
    globalKeys =
        awful.util.table.join(
        globalKeys,
        -- View tag only.
        awful.key(
            {modkey},
            '#' .. i + 9,
            function()
                local focused = awful.screen.focused()
                local tag = focused.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            descr_view
        ),
        -- Toggle tag display.
        awful.key(
            {modkey, 'Control'},
            '#' .. i + 9,
            function()
                local focused = awful.screen.focused()
                local tag = focused.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            descr_toggle
        ),
        -- Move client to tag.
        awful.key(
            {modkey, 'Shift'},
            '#' .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            descr_move
        ),
        -- Toggle tag on focused client.
        awful.key(
            {modkey, 'Control', 'Shift'},
            '#' .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            descr_toggle_focus
        )
    )
end

return globalKeys
