--      ██╗     ███████╗███████╗████████╗    ██████╗  █████╗ ███╗   ██╗███████╗██╗
--      ██║     ██╔════╝██╔════╝╚══██╔══╝    ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║
--      ██║     █████╗  █████╗     ██║       ██████╔╝███████║██╔██╗ ██║█████╗  ██║
--      ██║     ██╔══╝  ██╔══╝     ██║       ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║
--      ███████╗███████╗██║        ██║       ██║     ██║  ██║██║ ╚████║███████╗███████╗
--      ╚══════╝╚══════╝╚═╝        ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


local beautiful = require("beautiful")
local wibox = require("wibox")
local dpi = beautiful.xresources.apply_dpi
local awful = require("awful")
local gears = require("gears")

local tag_list = require("widgets.tag-list")
local separator = require("widgets.horizontal-separator")
local folder = require("widgets.folder")

local home_dir = os.getenv("HOME")

-- define module table
local left_panel = {}


-- ===================================================================
-- Bar Creation
-- ===================================================================


left_panel.create = function(s)

   local panel_shape = function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width, height, false, true, false, false, 256)
   end
   local maximized_panel_shape = function(cr, width, height)
      gears.shape.rectangle(cr, width, height)
   end

   panel = wibox({
      screen = s,
      position = "left",
      y = beautiful.top_panel_height + dpi(2),
      height = s.geometry.height - beautiful.top_panel_height - dpi(4),
      width = beautiful.left_panel_width,
      ontop = true,
      visible = true,
      bg = beautiful.bg_dark,
      type = 'dock',
      shape = panel_shape
   })

   panel:struts({
      left = beautiful.left_panel_width
   })

   panel:setup {
      expand = "none",
      layout = wibox.layout.align.vertical,
      wibox.container.margin(require("widgets.layout-box"), dpi(11), dpi(11), dpi(11), dpi(11)),
      {
         layout = wibox.layout.fixed.vertical,
         wibox.container.margin(tag_list.create(s), dpi(3), dpi(3), 0, 0)
      },
      nil
   }


   -- ===================================================================
   -- Functionality
   -- ===================================================================

   -- hide panel when client is fullscreen
   local function change_panel_visibility(client)
      if client.screen == s then
         panel.ontop = not client.fullscreen
      end
   end

   -- connect panel visibility function to relevant signals
   client.connect_signal("property::fullscreen", change_panel_visibility)
   client.connect_signal("focus", change_panel_visibility)

   -- maximize panel if client is maximized
   local function toggle_maximize_left_panel(is_maximized)
      if s == awful.screen.focused() then
         if is_maximized then
            panel.shape = maximized_panel_shape
         else
            panel.shape = panel_shape
         end
      end
   end

   -- maximize if a client is maximized
   client.connect_signal("property::maximized", function(c)
      toggle_maximize_left_panel(c.maximized)
   end)

   client.connect_signal("manage", function(c)
      if awful.tag.getproperty(c.first_tag, "layout") == awful.layout.suit.max then
         toggle_maximize_left_panel(true)
      end
   end)

   -- unmaximize if a client is removed and there are no maximized clients left
   client.connect_signal("unmanage", function(c)
      local t = awful.screen.focused().selected_tag
      -- if client was maximized
      if c.maximized then
         -- check if any clients that are open are maximized
         for _, c in pairs(t:clients()) do
            if c.maximized then
               return
            end
         end
         toggle_maximize_left_panel(false)

      -- if tag was maximized
      elseif awful.tag.getproperty(t, "layout") == awful.layout.suit.max then
         -- check if any clients are open (and therefore maximized)
         for _ in pairs(t:clients()) do
            return
         end
         toggle_maximize_left_panel(false)
      end
   end)

   -- maximize if layout is maximized and a client is in the layout
   tag.connect_signal("property::layout", function(t)
      -- check if layout is maximized
      if (awful.tag.getproperty(t, "layout") == awful.layout.suit.max) then
         -- check if clients are open
         for _ in pairs(t:clients()) do
            toggle_maximize_left_panel(true)
            return
         end
         toggle_maximize_left_panel(false)
      else
         toggle_maximize_left_panel(false)
      end
   end)

   -- maximize if a tag is swapped to with a maximized client
   tag.connect_signal("property::selected", function(t)
      -- check if layout is maximized
      if (awful.tag.getproperty(t, "layout") == awful.layout.suit.max) then
         -- check if clients are open
         for _ in pairs(t:clients()) do
            toggle_maximize_left_panel(true)
            return
         end
         toggle_maximize_left_panel(false)
      else
         -- check if any clients that are open are maximized
         for _, c in pairs(t:clients()) do
            if c.maximized then
               toggle_maximize_left_panel(true)
               return
            end
         end
         toggle_maximize_left_panel(false)
      end
   end)

end

return left_panel
