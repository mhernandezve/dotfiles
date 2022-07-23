    amphetamine = require "amphetamine"

require 'battery'

hyper = {"ctrl", "alt", "cmd", "shift"}

hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})

hs.hotkey.bind(hyper, "W", function()
  caffeineClicked()
end)

hs.hotkey.bind(hyper, "R", function()
  hs.reload()
end)

hs.hotkey.bind(hyper, 'L', function() 
  hs.caffeinate.lockScreen() 
end)

hs.hotkey.bind(hyper, 'T', function() 
  hs.application.launchOrFocus("iTerm") 
end)
