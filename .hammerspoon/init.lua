function spectacleCenter()
  hs.osascript.applescript([[
      tell application "System Events"
          keystroke "c" using {option down, command down}
      end tell
  ]])
end

-- Fullscreen mpv on activation
mpvWatcher = hs.application.watcher.new(function (name, event, app)
    if (event == hs.application.watcher.activated) then
      if (name == "mpv") then
        hs.layout.apply({
            {"mpv", nil, nil, hs.layout.maximized, nil, nil}
        })
      end
    end
end)
mpvWatcher:start()
