local FRemap = require('Modules/foundation_remapping')
local remapper = FRemap.new()

remapper:remap('rcmd', 'f18')
remapper:register()

do  -- input sorce changer
    local inputSource = {
        english = "com.apple.keylayout.ABC",
        korean = "org.youknowone.inputmethod.Gureum.han2",
    }

    local changeInput = function()
        local current = hs.keycodes.currentSourceID()
        local nextInput = nil
        print(current)
        
        if current == inputSource.english then
            nextInput = inputSource.korean
        else
            nextInput = inputSource.english
        end
        hs.keycodes.currentSourceID(nextInput)
    end

    hs.hotkey.bind({}, 'F18', changeInput)
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R",
    function()
        hs.reload()
    end
)

HCalendar = hs.loadSpoon("HCalendar")
HCalendar:start()

hs.alert.closeAll()
hs.alert.show("Config loaded", {
    strokeColor = { white = 1, alpha = 0 }
})
