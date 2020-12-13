local awful = require('awful')
local gears = require('gears')
local ruled = require('ruled')
local beautiful = require('beautiful')

local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

ruled.client.connect_signal(
    'request::rules',
    function()

-- All clients will match this rule.
ruled.client.append_rule {
    id = 'global',
    rule = { },
    properties = {
        focus = awful.client.focus.filter,
        raise = true,
        floating = false,
        maximized = false,
        above = false,
        below = false,
        ontop = false,
        sticky = false,
        maximized_horizontal = false,
        maximized_vertical = false,
        round_corners = true,
        keys = client_keys,
        buttons = client_buttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
}

-- Dialogs
ruled.client.append_rule {
    id = 'dialog',
    rule_any = {
        type  = { 'dialog' },
        class = { 'Wicd-client.py', 'calendar.google.com' }
    },
    properties = {
        titlebars_enabled = true,
        floating = true,
        above = true,
        draw_backdrop = false,
        skip_decoration = true,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
        end,
        placement = awful.placement.centered
    }
}

-- Modals
ruled.client.append_rule {
    id = 'dialog',
    rule_any = {
        type = { 'modal' }
    },
    properties = {
        titlebars_enabled = true,
        floating = true,
        above = true,
        draw_backdrop = false,
        skip_decoration = true,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
        end,
        placement = awful.placement.centered
    }
}

-- Utilities
ruled.client.append_rule {
    id = 'utility',
    rule_any = {
        type = { 'utility' }
    },
    properties = {
        titlebars_enabled = false,
        floating = true,
        hide_titlebars = true,
        draw_backdrop = false,
        skip_decoration = true,
        placement = awful.placement.centered
    }
}

-- Splash
ruled.client.append_rule {
    id = 'splash',
    rule_any = {
        type = { 'splash' }
    },
    properties = {
        titlebars_enabled = false,
        floating = true,
        above = true,
        hide_titlebars = true,
        draw_backdrop = false,
        skip_decoration = true,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
        end,
        placement = awful.placement.centered
    }
}

-- terminal emulators
ruled.client.append_rule {
    id = 'terminals',
    rule_any   = {
        class = {
            'URxvt',
            'konsole',
            'XTerm',
            'UXTerm',
            'kitty',
            'K3rmit'
        }
    },
    except_any = {
        instance = { 'QuakeTerminal' }
    },
    properties = {
        tag = '1',
        switchtotag = true,
        draw_backdrop = false,
        size_hints_honor = false
    }
}

-- Browsers and chats
ruled.client.append_rule {
    id = 'web_browsers',
    rule_any = {
        class = {
            'firefox',
            'firefox-developer-edition',
            'Tor Browser',
            'discord',
            'Chromium',
            'Google-chrome'
        }
    },
    properties = {
        tag = '2',
        switchtotag = true
    }
}

-- Text editors and word processing
ruled.client.append_rule {
    id = 'text_editors',
    rule_any = {
        class = {
            'Geany',
            'Atom',
            'kate',
            'Subl3',
            'code-oss'
        },
        name  = {
            'LibreOffice',
            'libreoffice'
        }
    },
    properties = {
        tag = '3',
        switchtotag = true
    }
}

-- File managers
ruled.client.append_rule {
    id = 'file_managers',
    rule_any   = {
        class = {
            'dolphin',
            'ark',
            'Nemo',
            'File-roller'
        }
    },
    properties = {
        tag = '4',
        switchtotag = true
    }
}

-- Gaming
ruled.client.append_rule {
    id = 'gaming',
    rule_any   = {
        class = {
            'Wine',
            'dolphin-emu',
            'Steam',
            'Citra'
        },
        name = { 'Steam' }
    },
    properties = {
        tag = '5',
        switchtotag = true
    }
}

-- Multimedia Editing
ruled.client.append_rule {
    id = 'graphics_editors',
    rule_any = {
        class = {
            'Gimp-2.10',
            'Inkscape',
            'Flowblade'
        }
    },
    properties = {
        tag = '6',
        switchtotag = true
    }
}

-- Splash-like but with titlebars enabled
ruled.client.append_rule {
    id = 'instances',
    rule_any = {
        instance    = {
            'file_progress',
            'Popup',
            'nm-connection-editor',
        },
        class = {
            'scrcpy' ,
            'Mugshot',
            'Pulseeffects'
        }
    },
    properties = {
        skip_decoration = true,
        round_corners = true,
        ontop = true,
        floating = true,
        draw_backdrop = false,
        focus = awful.client.focus.filter,
        raise = true,
        keys = client_keys,
        buttons = client_buttons,
        placement = awful.placement.centered
    }
}

end
)
