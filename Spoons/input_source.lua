local inputSource = {
    english = "com.apple.keylayout.ABC",
    korean = "com.apple.inputmethod.Korean.2SetKorean",
}

local customStyle = hs.alert.defaultStyle

customStyle.fillColor = { white = 0, alpha = 0.75 }
customStyle.strokeColor = { alpha = 0 }

customStyle.textColor = { white = 0.75, alpha = 0.75 }
customStyle.textSize = 40

customStyle.fadeOutDuration = 1

function IM_alert()

    local current = hs.keycodes.currentSourceID()
    local language = nil


    if current == inputSource.korean then
    language = ' 🇰🇷 가나다 '    
    elseif current == inputSource.english then
    language = ' 🇺🇸 ABC '
    else
    language = current
    end

    if hs.keycodes.currentSourceID() == last_alerted_IM_ID then return end

    print(current)

    hs.alert.closeSpecific(last_IM_alert_uuid)
    last_IM_alert_uuid = hs.alert.show(language, customStyle, 0.5)
    last_alerted_IM_ID = hs.keycodes.currentSourceID()
end


hs.keycodes.inputSourceChanged(IM_alert)