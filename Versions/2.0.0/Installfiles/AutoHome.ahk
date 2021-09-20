#NoEnv
#NoTrayIcon


Title := "Auto Home"


Loop, 1 {
RegRead, autoON, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, AutostartON
FileRead, willmessage, %A_ScriptDir%\bin\message.autohome
RegRead, var#1, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options, #1
RegRead, var#2, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options, #2
RegRead, var#3, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options, #3
RegRead, var#4, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options, #4
RegRead, var#5, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options, #5
RegRead, var#6, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options, #6
RegRead, DEVICE, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, DEVICE
}


zzz := FileExist("%DEVICE%")

MsgBox, %zzz%

If (autoON = 1) {
	Main()
}

If (autoON = 0) {
	MsgBox, 4112, AutoHome Error, Autostart ist deaktiviert!`nAktiviere Autostart im AutoHome Panel oder wähle den Eintrag im Startmenü zum Manuellen Start.	
	ExitApp
}
	
TrayTipVerstecken() {
    TrayTip  ; Normale Methode zum Verstecken benutzen.
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200  ; Möglicherweise muss dieser Sleep-Wert angepasst werden.
        Menu Tray, Icon
    }
}

Main() {
	


if FileExist("%DEVICE%usb.autohome") {
	gosub, Autostart
}
if !FileExist("%DEVICE%usb.autohome") {
	MsgBox, 4112, AutoHome Error, Das Ziel Volume ist nicht verfügbar!`nBitte verbinde das Ziel Volume mit dem System.
	IfMsgBox, OK
		ExitApp
}
}




Autostart:


Progress, x31 y84 w200, In Artbeit..., , AutoHome - Autostart, 
Sleep, 100
;Run, %var#1%
Sleep, 100
Progress, 14, Programm 1
Sleep, 100
Run, %var#2%
Sleep, 100
Progress, 28, Programm 2
Sleep, 100
Run, %var#3%
Sleep, 100
Progress, 42, Programm 3
Sleep, 100
Run, %var#4%
Sleep, 100
Progress, 56, Programm 4
Sleep, 100
Run, %var#5%
Sleep, 100
Progress, 70, Programm 5
Sleep, 100
Run, %var#6%
Sleep, 100
Progress, 84, Programm 6
sleep, 10
Progress, 100, ... Fertig!
sleep, 300
Progress, Off
sleep, 150
MsgBox, 64, AutoHome Willkommen, %willmessage%
IfMsgBox, Ok 
	ExitApp

