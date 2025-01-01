local FRemap = require('foundation_remapping')
local remapper = FRemap.new()

remapper:remap('rcmd', 'f19')
remapper:register()

require('Spoons/input_source')
require('Spoons/app_watcher')

-- Arc 브라우저의 앱 번들 ID
local arcApp = "company.thebrowser.Browser"

-- Command + T 단축키 재정의
hs.hotkey.bind({"cmd"}, "T", function()
    local focusedApp = hs.application.frontmostApplication()
    if focusedApp:bundleID() == arcApp then
        -- Control + Option + Command + G 키 입력 실행
        hs.eventtap.keyStroke({"ctrl", "alt", "cmd"}, "G")
    else
        -- Arc의 기본 동작 실행
        hs.eventtap.keyStroke({"cmd"}, "T")
    end
end)