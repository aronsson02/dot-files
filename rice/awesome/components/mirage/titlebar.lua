--      ████████╗██╗████████╗██╗     ███████╗██████╗  █████╗ ██████╗
--      ╚══██╔══╝██║╚══██╔══╝██║     ██╔════╝██╔══██╗██╔══██╗██╔══██╗
--         ██║   ██║   ██║   ██║     █████╗  ██████╔╝███████║██████╔╝
--         ██║   ██║   ██║   ██║     ██╔══╝  ██╔══██╗██╔══██║██╔══██╗
--         ██║   ██║   ██║   ███████╗███████╗██████╔╝██║  ██║██║  ██║
--         ╚═╝   ╚═╝   ╚═╝   ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝

-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful").xresources.apply_dpi


-- ===================================================================
-- Titlebar Creation
-- ===================================================================


-- Add a titlebar
client.connect_signal("request::titlebars", function(c)
   local titlebar = awful.titlebar(c, {position = "left", size = dpi(18) } )

   titlebar: setup {
      {
         -- AwesomeWM native buttons (images loaded from theme)
         wibox.container.margin(awful.titlebar.widget.closebutton(c), dpi(4), dpi(1), dpi(4), dpi(4)),
         wibox.container.margin(awful.titlebar.widget.maximizedbutton(c), dpi(4), dpi(1), dpi(4), dpi(4)),
         wibox.container.margin(awful.titlebar.widget.minimizebutton(c), dpi(4), dpi(1), dpi(4), dpi(4)),
         layout = wibox.layout.fixed.vertical
      },
      nil,
      wibox.container.margin(awful.titlebar.widget.floatingbutton (c), dpi(4), dpi(1), dpi(4), dpi(4)),
      layout = wibox.layout.align.vertical
   }
end)
