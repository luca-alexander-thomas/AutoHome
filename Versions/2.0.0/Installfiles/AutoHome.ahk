#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
RegRead, confdir, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, CurrentConfPath

Title := "Auto Home"
usb := usb

gosub, Readconf
FileRead, willmessage, %willmessagedir%
SplitPath, var#1, Prog#1
SplitPath, var#2, Prog#2
SplitPath, var#3, Prog#3
SplitPath, var#4, Prog#4
SplitPath, var#5, Prog#5
SplitPath, var#6, Prog#6
SetWorkingDir, %DEVICE%
MsgBox, %DEVICE%



If (status = 1) {
	Main()
}

If (status = 0) {
	MsgBox, 4112, AutoHome Error, Autostart ist deaktiviert!`nAktiviere Autostart im AutoHome Panel.	
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
	


IfExist, %DEVICE%usb.autohome
	gosub, Autostart
IfNotExist, %DEVICE%usb.autohome
	MsgBox, 4112, AutoHome Error, Das Ziel Volume ist nicht verfügbar!`nBitte verbinde das Ziel Volume mit dem System.
	IfMsgBox, OK
		ExitApp
}




Autostart:
Progress, x31 y84 w200, In Artbeit..., , AutoHome - Autostart, 
Sleep, 100
Run, %var#1%
Sleep, 100
Progress, 14, %Prog#1%
Sleep, 100
Run, %var#2%
Sleep, 100
Progress, 28, %Prog#2%
Sleep, 100
Run, %var#3%
Sleep, 100
Progress, 42, %Prog#3%
Sleep, 100
Run, %var#4%
Sleep, 100
Progress, 56, %Prog#4%
Sleep, 100
Run, %var#5%
Sleep, 100
Progress, 70, %Prog#5%
Sleep, 100
Run, %var#6%
Sleep, 100
Progress, 84, %Prog#6%
sleep, 10
Progress, 100, ... Fertig!
sleep, 300
Progress, Off
sleep, 150
MsgBox, 64, AutoHome Willkommen, %willmessage%
IfMsgBox, Ok 
	ExitApp


Readconf:
IniRead, var#1, %confdir%, programs, 1
IniRead, var#2, %confdir%, programs, 2
IniRead, var#3, %confdir%, programs, 3
IniRead, var#4, %confdir%, programs, 4
IniRead, var#5, %confdir%, programs, 5
IniRead, var#6, %confdir%, programs, 6
IniRead, start#1, %confdir%, programs-start, 1
IniRead, start#2, %confdir%, programs-start, 2
IniRead, start#3, %confdir%, programs-start, 3
IniRead, start#4, %confdir%, programs-start, 4
IniRead, start#5, %confdir%, programs-start, 5
IniRead, start#6, %confdir%, programs-start, 6
IniRead, DEVICE, %confdir%, device, letter
IniRead, status, %confdir%, main, status
IniRead, willmessagedir, %confdir%, main, message
IniRead, username, %confdir%, user, Username
IniRead, pcname, %confdir%, user, PCname
IniRead, system, %confdir%, user, System
return
