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
   local titlebar = awful.titlebar(c, {
      size = dpi(26)
   })

   titlebar: setup {
      {
         -- AwesomeWM native buttons (images loaded from theme)
         wibox.container.margin(awful.titlebar.widget.closebutton(c), dpi(10), dpi(5), dpi(5), dpi(5)),
         wibox.container.margin(awful.titlebar.widget.maximizedbutton(c), dpi(5), dpi(5), dpi(5), dpi(5)),
         wibox.container.margin(awful.titlebar.widget.minimizebutton(c), dpi(5), dpi(5), dpi(5), dpi(5)),
         wibox.container.margin(awful.titlebar.widget.floatingbutton (c), dpi(5), dpi(5), dpi(5), dpi(5)),
         layout = wibox.layout.fixed.horizontal
      },
      nil,
      nil,
      layout = wibox.layout.align.horizontal
   }
end)
