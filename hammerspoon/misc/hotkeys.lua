Hyper = {"ctrl", "alt", "cmd", "shift"}

hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})

hs.hotkey.bind(Hyper, "W", function()
  caffeineClicked()
end)

hs.hotkey.bind(Hyper, "R", function()
  hs.reload()
end)

hs.hotkey.bind(Hyper, 'L', function() 
  hs.caffeinate.lockScreen()
end)

hs.hotkey.bind(Hyper, 'T', function()
  hs.application.launchOrFocus("wezterm")
end)

