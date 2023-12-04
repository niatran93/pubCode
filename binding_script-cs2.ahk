#Persistent ; This keeps the script running permanently.
#SingleInstance Force ; Only allows one instance of the script to run.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

I_Icon = binding_script-cs2.ico
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%
;return

setTitleMatchMode, Regex

#IfWinActive ahk_exe cs2.exe

LWin::p
LShift & RShift::Capslock
Capslock::o