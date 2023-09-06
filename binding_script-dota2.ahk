#Persistent ; This keeps the script running permanently.
#SingleInstance Force ; Only allows one instance of the script to run.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

I_Icon = binding_script-dota2.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%
;return

setTitleMatchMode, Regex

setKeyDelay, 50, 50
setMouseDelay, 50

#maxThreadsPerHotkey, 2
toggle:=0

#IfWinActive ahk_exe dota2.exe

LWin::F1
LShift & RShift::Capslock
Capslock::\
LAlt::\

~ScrollLock::
    toggle:=!toggle

    while (toggle=1)
    {
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