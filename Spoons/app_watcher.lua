local function appWatcherCallback(appName, eventType, appObject)
    if eventType == hs.application.watcher.activated then
        if appName == "iTerm2" then
            hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
        end
    end
end

-- 앱 감지 시작
local appWatcher = hs.application.watcher.new(appWatcherCallback)
appWatcher:start()