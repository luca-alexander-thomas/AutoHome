Title := "Auto Home"

TrayTipVerstecken() {
    TrayTip  ; Normale Methode zum Verstecken benutzen.
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200  ; Möglicherweise muss dieser Sleep-Wert angepasst werden.
        Menu Tray, Icon
    }
}
	
	Loop , 1 {
		RegRead, var#1, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, #1
		RegRead, var#2, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, #2
		RegRead, var#3, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, #3
		RegRead, var#4, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, #4
		RegRead, var#5, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, #5
		RegRead, var#6, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, #6
		RegRead, deviceUSB, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, DEVICE
	}

FileRead, willmessage, message.autohome

IfExist, %deviceUSB%\usb.autohome
{
		Run, %var#1%
		Run, %var#2%
		Run, %var#3%
		Run, %var#4%
		Run, %var#5%
		Run, %var#6%
		TrayTip #1, %willmessage%
		Sleep 3000   ; 3 Sekunden lang anzeigen lassen.
		TrayTipVerstecken()
		Sleep 6000
		ExitApp
		

	}

IfNotExist, %deviceUSB%\abcdef.123
	ExitApp










