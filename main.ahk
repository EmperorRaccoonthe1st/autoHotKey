!x::Send "!{F4}" ; alt+x => alt+f4


; alt + z => open cli 
!z:: Run '"c:\Windows\system32\cmd.exe."'


; direct encoding of emojis => ":" + name of emoji
:::cool::😎
:::sob::😭
:::skull::💀
:::ha::😹
:::fire::🔥
:::heart::💓
:::face::🤦
:::mark::‼️
:::mask::👹
:::yawn::🥱
:::hmm::🤨🧐🤨
:::think::🤔🤔🤔
:::zzz::😴
:::flex::💪
:::pray::🙏
:::smile::😊
:::sad::😢
:::scared::😨
:::celebrate::🥳


emojiTermArray := [
    "cool",
    "sob",
    "skull",
    "ha",
    "fire",
    "heart",
    "face",
    "mark",
    "mask",
    "yawn",
    "hmm",
    "think",
    "zzz",
    "flex",
    "pray",
    "smile",
    "sad",
    "scared",
    "celebrate"
]

:::
{
    SendText ":"
    colonInputHook := InputHook("V", "{End}{Enter}{Space}{Escape}{Tab}")
    emoji := ""
    finalText := ""

    ;allowing repeats of ":"
    onCharHandler(inputHookObj, char) {
        if char == ":"
            SendText ":"
    }
    colonInputHook.OnChar :=  onCharHandler

    colonInputHook.Start()
    colonInputHook.Wait()

    term := SubStr(colonInputHook.Input, 1, -1)
    num := SubStr(colonInputHook.Input, -1, 1)
    ; MsgBox(Format("{}, {}, num: {}", colonInputHook.Input, term, num, "InputTest"))
    for i, emojiTerm in emojiTermArray
        if term == emojiTerm 
        {
            switch term
                {   ;choose emoji
                    case "cool": emoji := "😎"
                    case "sob": emoji := "😭"
                    case "skull": emoji := "💀"
                    case "ha": emoji := "😹"
                    case "fire": emoji := "🔥"
                    case "heart": emoji := "💓"
                    case "face": emoji := "🤦"
                    case "mark": emoji := "‼️"
                    case "mask": emoji := "👹"
                    case "yawn": emoji := "🥱"
                    case "hmm": emoji := "🤨🧐🤨"
                    case "think": emoji := "🤔🤔🤔"
                    case "zzz": emoji := "😴"
                    case "flex": emoji := "💪"
                    case "pray": emoji := "🙏"
                    case "smile": emoji := "😊"
                    case "sad": emoji := "😢"
                    case "scared": emoji := "😨"
                    case "celebrate:": emoji := "🥳"
                }


            Loop num {    ;add emoji to text
                finalText .= emoji
            }
            
            Loop StrLen(colonInputHook.Input)+2 {   ;remove typed words
                Send "{Backspace}"
            }

            SendText finalText
        }
    
}




