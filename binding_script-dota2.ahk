#Persistent ; This keeps the script running permanently.
#SingleInstance Force ; Only allows one instance of the script to run.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

setKeyDelay, 50, 50
setMouseDelay, 50

#maxThreadsPerHotkey, 2
toggle:=0

#IfWinActive ahk_exe dota2.exe

LWin::\
LShift & RShift::Capslock
Capslock::Alt   ; make Caps Lock the alt button

$Pause::
    toggle:=!toggle

    while (toggle=1)
    {
        ToolTip, ...........Auto-Accepting!!!
        sleep, 1000
        ToolTip
        sleep, 1000
    send,  {Enter}
    }
return

$~Space::
    while (getKeyState("Space", "P"))
    {
        send, {Space}
        sleep, 100
    }
return