#Persistent ; This keeps the script running permanently.
#SingleInstance ; Only allows one instance of the script to run.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

I_Icon = keyB.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%
;return

setTitleMatchMode, Regex

; https://vim.fandom.com/wiki/Map_caps_lock_to_escape_in_Windows
; LShift + RShift = CapsLock
; CapsLock = LCtrl when pressed
; CapsLock = ESC when pressed and released in under 1 sec

#IfWinActive ahk_exe (firefox.exe|chrome.exe|notepad.exe|putty.exe)

SetCapsLockState Off
state:=false
LShift & RShift::
    state:= not state
    if (state) {
        SetCapsLockState On
    } else {
        SetCapsLockState Off
    }
return

*CapsLock::
    Send {LControl down}
return
*CapsLock up::
    Send {LControl Up}
    if (A_PriorKey=="CapsLock"){
        if (A_TimeSincePriorHotkey < 1000)
            Suspend On
            Send, {Esc}
            Suspend Off
    }
return

LControl::`

~Esc::
    CoordMode, Mouse
    MouseMove, A_ScreenWidth, A_ScreenHeight
return

#IfWinActive

; AutoHotkey Media Keys
<!<#Space::Send  {Media_Play_Pause} ; LWin + LAlt + Space : Pause
<!<#j::Send      {Media_Prev}
<!<#k::Send      {Media_Next}
<!<#d::Send      {Volume_Mute}
<!<#s::Send      {Volume_Up}
<!<#a::Send      {Volume_Down}

~ScrollLock::Suspend
