local beautiful = require("beautiful")
local wibox = require("wibox")
local vicious = require("vicious")
batwidget = wibox.widget.progressbar()

-- Create wibox with batwidget
batbox = wibox.widget {
  {
    max_value     = 1,
    widget        = batwidget,
    border_width  = 0.5,
    border_color  = "#000000",
    color         = {
      type = "linear",
      from = { 0, 0 },
      to = { 0, 30 },
      stops = {
        { 0, "#AECF96" },
        { 1, "#FF5656" }
      }
   }
  },
  forced_height = 10,
  forced_width  = 8,
  direction     = 'east',
  color         = beautiful.fg_widget,
  layout        = wibox.container.rotate,
}
batbox = wibox.layout.margin(batbox, 1, 1, 3, 3)
-- Register battery widget
vicious.register(batwidget, vicious.widgets.bat, "$2", 61, "BAT0")
