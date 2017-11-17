local beautiful = require("beautiful")
local wibox = require("wibox")
local vicious = require("vicious")

wifibox = wibox.widget.textbox()
vicious.register(wifibox, vicious.widgets.wifi, "${ssid}", 10, "wlp3s0")
