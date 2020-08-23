local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local naughty = require('naughty')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local apps = require('configuration.apps')
local clickable_container = require('widget.clickable-container')
local config_dir = gears.filesystem.get_configuration_dir()
local widget_icon_dir = config_dir .. 'configuration/user-profile/'
local user_icon_dir = '/var/lib/AccountsService/icons/'

title_table = {
        'Hei, jeg har en melding til deg',
        'Hør her lille kjeft!',
        'la meg fortelle deg en hemmelighet',
        'jeg lyver aldri',
        'Melding mottatt fra sjefen din'
}

message_table = {
        'La meg vurdere ansiktet ditt! Ups ... Det ser ut som om jeg ikke kan beregne negative tall. Du er stygg som faen, beklager',
        'Ser bra ut i dag, nå faen!',
        'Det siste jeg vil gjøre er å skade deg. Men den er fremdeles på listen.',
        'Hvis jeg var enig med deg, ville vi begge tatt feil.',
        'Jeg har tenkt å leve for alltid. Så langt så bra.',
        'Jesus elsker deg, men alle andre tror at du er en drittsekk.',
        'Hvis hjernen din var dynamitt, ville det ikke være nok til å blåse hatten av deg.',
        'Du er mer skuffende enn en usaltet kringle.',
        'Barnet ditt er så stygt, han får sitt happy meal til å gråte.',
        'Hemmelighetene dine er alltid trygge hos meg. Jeg hører aldri engang når du forteller dem det.',
        'Jeg tar deg bare overalt slik at jeg ikke trenger å kysse deg farvel.',
        'Du ser så pen ut. Slett ikke grovt i dag.',
        'Det er umulig å undervurdere deg.',
        'Jeg fornærmer deg ikke, jeg beskriver deg.',
        'Fortsett å rulle øynene, kan du etter hvert finne en hjerne.',
        'Du bringer alle så mye glede når du forlater rommet.',
        'Jeg tenkte på deg i dag. Det minnet meg om å ta ut søpla.',
        'Du er grunnen til at Gud skapte langfingeren.'
}

local create_profile = function()
    local profile_imagebox = wibox.widget {
        {
            id = 'icon',
            image = widget_icon_dir .. 'default.svg',
            widget = wibox.widget.imagebox,
            resize = true,
            forced_height = dpi(28),
            clip_shape = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, beautiful.groups_radius)
            end
        },
        layout = wibox.layout.align.horizontal
    }

    profile_imagebox:buttons(
        gears.table.join(
            awful.button(
                {},
                1,
                nil,
                function()
                    awful.spawn.single_instance('mugshot')
                end
            ),
            awful.button(
                {},
                3,
                nil,
                function()
                    naughty.notification({
                        app_name = 'FBI\'s ChatBot v69',
                        title = title_table[math.random(#title_table)],
                        message = message_table[math.random(#message_table)] ..
                        '\n\n- xXChatBOT69Xx',
                        urgency = 'normal'
                    })
                end
            )
        )
        )

        local profile_name = wibox.widget {
                font = 'SF Pro 12',
                markup = 'Bruker',
                align = 'left',
                valign = 'center',
                widget = wibox.widget.textbox
    }

    local update_profile_image = function()
        awful.spawn.easy_async_with_shell(
            apps.bins.update_profile,
            function(stdout)
                stdout = stdout:gsub('%\n','')
                if not stdout:match('default') then
                    profile_imagebox.icon:set_image(stdout)
                else
                    profile_imagebox.icon:set_image(widget_icon_dir .. 'default.svg')
                end
            end
        )
    end

    update_profile_image()

    awful.spawn.easy_async_with_shell(
        [[
        sh -c '
        fullname="$(getent passwd `whoami` | cut -d ':' -f 5 | cut -d ',' -f 1 | tr -d "\n")"
        if [ -z "$fullname" ];
        then
            printf "$(whoami)@$(hostname)"
        else
            printf "$fullname"
        fi
        '
        ]],
        function(stdout)
            local stdout = stdout:gsub('%\n', '')
            profile_name:set_markup(stdout)
        end
    )

    local user_profile = wibox.widget {
        layout = wibox.layout.fixed.horizontal,
        spacing = dpi(5),
        {
            layout = wibox.layout.align.vertical,
            expand = 'none',
            nil,
            profile_imagebox,
            nil
        },
        profile_name
    }

    return user_profile
end

return create_profile
