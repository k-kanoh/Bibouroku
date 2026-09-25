#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook
SetIme(o) {
    i := Buffer(A_PtrSize = 8 ? 72 : 48, 0), NumPut("UInt", i.Size, i)
    h := DllCall("GetGUIThreadInfo", "UInt", 0, "Ptr", i) ? NumGet(i, A_PtrSize = 8 ? 16 : 12, "Ptr") : 0
    DllCall("SendMessageW", "Ptr", DllCall("imm32\ImmGetDefaultIMEWnd", "Ptr", h || WinExist("A"), "Ptr"), "UInt", 0x283, "Ptr", 6, "Ptr", o)
}
~LAlt::Send("{Blind}{vk07}")
~RAlt::Send("{Blind}{vk07}")
~LAlt up::(A_PriorKey = "LAlt") && SetIme(0)
~RAlt up::(A_PriorKey = "RAlt") && SetIme(1)
#HotIf WinActive("ahk_exe EXCEL.EXE")
+Enter::Send("!{Enter}")
#HotIf
;SetTimer(() => Send("{F15}"), 60000)
