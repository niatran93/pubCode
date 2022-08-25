#Persistent ; This keeps the script running permanently.
#SingleInstance ; Only allows one instance of the script to run.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

setTitleMatchMode, Regex

; https://vim.fandom.com/wiki/Map_caps_lock_to_escape_in_Windows
; LShift + RShift = CapsLock
; CapsLock = LCtrl when pressed
; CapsLock = ESC when pressed and released in under 1 sec

#IfWinNotActive ahk_exe (vmware.exe|dota2.exe)

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

#IfWinNotActive

#IfWinNotActive ahk_exe dota2.exe

~Esc::
    CoordMode, Mouse
    MouseMove, A_ScreenWidth, A_ScreenHeight
return

#IfWinNotActive

; AutoHotkey Media Keys
<!<#Space::Send  {Media_Play_Pause} ; LWin + LAlt + Space : Pause
<!<#j::Send      {Media_Prev}
<!<#k::Send      {Media_Next}
<!<#d::Send      {Volume_Mute}
<!<#s::Send      {Volume_Up}
<!<#a::Send      {Volume_Down}
