amphetamine = require "amphetamine"

hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})

hs.hotkey.bind({"cmd", "alt", "ctrl", 'shift'}, "W", function()
  amphetamine()
  hs.alert.show("Anphetamine")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", 'shift'}, "R", function()
  hs.alert.show("Config loaded")
  hs.reload()
end)

hs.hotkey.bind({'ctrl', 'alt', 'cmd', 'shift'}, 'L', function() 
  hs.caffeinate.startScreensaver() 
end)

  hs.hotkey.bind({'ctrl', 'alt', 'cmd', 'shift'}, 'T', function() 
  hs.application.launchOrFocus("iTerm") 

end)