#SingleInstance, Force
#NoTrayIcon
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
Process, Priority, %PID%, Low

IniRead, RingRefillHotkeyTibia11, settings.ini, settings, RingRefillHotkeyTibia11
IniRead, ShiftRingRefillTibia11, settings.ini, settings, ShiftRingRefillTibia11
If (ShiftRingRefillTibia11 = "Shift +")
    {
    ShiftRingRefillTibia11 = +
    }   
If (ShiftRingRefillTibia11 = "Ctrl +")
    {
    ShiftRingRefillTibia11 = "^"
    }       
If (ShiftRingRefillTibia11 = "None")
    {
    ShiftRingRefillTibia11 = ""
    } 	

Loop,
{
    Sleep, 1000
CoordMode Pixel
WinWaitActive, ahk_class Qt5QWindowOwnDCIcon
IfNotExist, Images\DwarvenRingInSlot_Tibia11.png
   MsgBox, DwarvenRingInSlot_Tibia11 image not exists.
ImageSearch, FoundX, FoundY, A_ScreenWidth - 168, 0, A_ScreenWidth, A_ScreenHeight - A_ScreenHeight + 432, Images\DwarvenRingInSlot_Tibia11.png
Sleep, 1000
	 if ErrorLevel = 1
		{
		WinWaitActive, ahk_class Qt5QWindowOwnDCIcon
        #IfWinActive, ahk_class Qt5QWindowOwnDCIcon
		Send, %ShiftRingRefillTibia11%{%RingRefillHotkeyTibia11%}
		Random, R, 250, 350
		Sleep, R
		}		    
}
	Return
