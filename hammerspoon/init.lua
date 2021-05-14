amphetamine = require "amphetamine"
require "string"

hyper = {"cmd", "alt", "ctrl", 'shift'}
hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})

hs.hotkey.bind(hyper, "W", function()
  caffeineClicked()
end)

hs.hotkey.bind(hyper, "R", function()
  hs.alert.show("Config loaded")
  hs.reload()
end)

hs.hotkey.bind(hyper, 'L', function()
  hs.caffeinate.startScreensaver()
end)

hs.hotkey.bind(hyper, 'T', function()
  hs.application.launchOrFocus("iTerm")
end)

function setBluetoothStatus(rc, stdout, stderr)
  if (stdout:sub(1, 1) == "0") then btStatus = "on" else btStatus = "off" end
  local t = hs.task.new("/usr/local/bin/blueutil", checkBluetoothResult, {"--power", btStatus})
  hs.alert.show("Bluetooth " .. btStatus)
  t:start()
end

function checkBluetoothResult(rc, stderr, stderr)
  if rc ~= 0 then
    print(string.format("Unexpected result executing `blueutil`: rc=%d stderr=%s stdout=%s", rc, stderr, stdout))
  end
end

hs.hotkey.bind(hyper, 'B', function()
  local r = hs.task.new("/usr/local/bin/blueutil", setBluetoothStatus, {"--power"})
  r:start()
end)

