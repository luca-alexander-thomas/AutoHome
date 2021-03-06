#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
RegRead, AppVersion, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, AppVersion
RegRead, InstallPath, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, InstallPath
RegRead, confdir, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, CurrentConfPath

Arg1 := A_Args[1]


if Arg1 contains .autohome
	gosub, autohomefile
if Arg1 contains .ath
	gosub, athfile




SplashImage, %A_ScriptDir%\ICON\ICON_B.png, b fs14 CWFFFFFF,  AutoHomePanel Starten...
Titel := "AutoHome-Panel"
FileRead, Help, %A_ScriptDir%\bin\Help.autohome

Menu, Dateimenü, Add, Ö&ffnen, MenüDateiÖffnen
Menu, Dateimenü, Add, &Beenden, MenuExit
Menu, Hilfsmenü, Add, Inf&o, 1Help
Menu, MeineMenüleiste, Add, &Datei, :Dateimenü
Menu, MeineMenüleiste, Add, &?, :Hilfsmenü



gosub, Readconf


req := ComObjCreate("Msxml2.XMLHTTP")
; Öfnet einen Request mit aktivierter async.
req.open("GET", "https://data.lucathomas.de/AutoHome/update.ath", true)
; Setzt unsere Callback-Funktion [benötigt v1.1.17+].
req.onreadystatechange := Func("Ready")
; Sendet den Request.  Ready() wird aufgerufen, wenn es fertig ist.
req.send()
/*
; Wenn Sie warten wollen, brauchen Sie kein onreadystatechange.
; Durch Setzen von async=true und Warten auf diese Weise bleibt das Skript
; ansprechbar, während der Download läuft, dagegen macht async=false
; das Skript unansprechbar.
while req.readyState != 4
    sleep 100
*/
#Persistent

Ready() {
    global req
    if (req.readyState != 4)  ; Noch nicht fertig.
        return
    if (req.status == 200) {		;OK
		gosub, UpdY
        MsgBox, 4164, Update AutoHome-Autostart, % "" req.responseText
		IfMsgBox, Yes
			gosub, UpdMBY
		IfMsgBox, No
			Exit
			return
		
	}
		
    else {
		gosub, UpdN
		return
	}
    
}
Sleep, 1600
SplashImage, Off



Gui, Font, s20 
Gui -MaximizeBox
Gui, Add, Picture, x12 y16 w86 h76 , %A_ScriptDir%\ICON\ICON.png
Gui, Add, Text, ce12727 x176 y16 w200 h28 +Center, %Titel%
Gui, Font, s8


Gui, Font, s8
Gui, Add, StatusBar,,  © 2021 Luca-Alexander Thomas	AutoHome®	%UpdateText%
Gui, Add, Tab2, x0 y94 w479 h398 , Einstellungen|Autostart Programme

Gui, Tab, 1
Gui, Font, s8 cBlack
Gui, Add, Text, x5 y125 w160 h28, Homelaufwerk Auswählen: 
Gui, Font, s8 cBlack
Gui, Add, Edit,r1 x15 y140 w200 h28 ReadOnly vDEVICE, %DEVICE%
Gui, Add, Button, x290 y140 w96 h28 gCopy, Dateien Kopieren
Gui, Font, s15 cBlack
Gui, Add, Button, x220 y140 w30 h28 gSeldev, ...
Gui, Font, s9 cBlack
Gui, Add, Text, x40 y235 w220 h38 , Willkommens Nachricht
Gui, Font, s8 cBlack
Gui, Add, Checkbox, x40 y190 w96 h28 vNew_Status gMain Checked%Status%, Autostart Status
Gui, Add, Button, x40 y257 w96 h28 geditwill, Bearbeiten
Gui, Add, Button, x40 y290 w96 h28 gtestwill, Testen



Gui, Tab, 2
Gui, Font, s8 cBlack
Gui, Add, Button, x10 y151 w85 h28 gStart#1, Start #1
Gui, Add, Button, x10 y189 w85 h28 gStart#2, Start #2
Gui, Add, Button, x10 y228 w85 h28 gStart#3, Start #3
Gui, Add, Button, x10 y266 w85 h28 gStart#4, Start #4
Gui, Add, Button, x10 y304 w85 h28 gStart#5, Start #5
Gui, Add, Button, x10 y343 w85 h28 gStart#6, Start #6
Gui, Font, s8 cblack
Gui, Add, Edit, r1 x145 y151 w285 h28 ReadOnly vt1, %var#1%
Gui, Add, Edit, r1 x145 y189 w285 h28 ReadOnly vt2, %var#2%
Gui, Add, Edit, r1 x145 y228 w285 h28 ReadOnly vt3, %var#3%
Gui, Add, Edit, r1 x145 y266 w285 h28 ReadOnly vt4, %var#4%
Gui, Add, Edit, r1 x145 y304 w285 h28 ReadOnly vt5, %var#5%
Gui, Add, Edit, r1 x145 y343 w285 h28 ReadOnly vt6, %var#6%
Gui, Font, s12 cBlack
Gui, Add, Button, x440 y151 w30 h25 gSel#1, ...
Gui, Add, Button, x440 y189 w30 h25 gSel#2, ...
Gui, Add, Button, x440 y228 w30 h25 gSel#3, ...
Gui, Add, Button, x440 y266 w30 h25 gSel#4, ...
Gui, Add, Button, x440 y304 w30 h25 gSel#5, ...
Gui, Add, Button, x440 y343 w30 h25 gSel#6, ...
Gui, Add, CheckBox, x114 y151 w19 h28 vCheck#1 gCheck#1 Checked%Start#1%,
Gui, Add, CheckBox, x114 y189 w19 h28 vCheck#2 gCheck#2 Checked%Start#2%, 
Gui, Add, CheckBox, x114 y228 w19 h28 vCheck#3 gCheck#3 Checked%Start#3%, 
Gui, Add, CheckBox, x114 y266 w19 h28 vCheck#4 gCheck#4 Checked%Start#4%, 
Gui, Add, CheckBox, x114 y304 w19 h28 vCheck#5 gCheck#5 Checked%Start#5%, 
Gui, Add, CheckBox, x114 y343 w19 h28 vCheck#6 gCheck#6 Checked%Start#6%,
Gui, Font, s8 cBlack
Gui, Add, Text, x140 y123 w288 h28 +Center, Aktuelles Programm | Neues Programm
Gui, Add, Text, x98 y123 w45 h28 +Center, Autostart



Gui, Menu, MeineMenüleiste
Gui, Show, w480 h400, AutoHome-Panel
Gui, Submit , NoHide
return

GuiClose:
ExitApp

Start#1:
Run %var#1%
return
Start#2:
Run %var#2%
return
Start#3:
Run %var#3%
return
Start#4:
Run %var#4%
return
Start#5:
Run %var#5%
return
Start#6:
Run %var#6%
return

Check#1:
Gui, Submit , NoHide
IniWrite, %Check#1%, %confdir%, programs-start, 1
return
Check#2:
Gui, Submit , NoHide
IniWrite, %Check#2%, %confdir%, programs-start, 2
return
Check#3:
Gui, Submit , NoHide
IniWrite, %Check#3%, %confdir%, programs-start, 3
return
Check#4:
Gui, Submit , NoHide
IniWrite, %Check#4%, %confdir%, programs-start, 4
return
Check#5:
Gui, Submit , NoHide
IniWrite, %Check#5%, %confdir%, programs-start, 5
return
Check#6:
Gui, Submit , NoHide
IniWrite, %Check#6%, %confdir%, programs-start, 6
return


Sel#1:
FileSelectFile, #1 , 3, C:\*.exe, AutoHome Auswählen für #1, Ausführbare Dateien (*.exe; *.bat; *.ahk)
Gui, Submit, NoHide
IniWrite, %#1%, %confdir%, programs, 1
GuiControl, , t1, %#1%
IniRead, var#1, %confdir%, programs, 1
return
Sel#2:
FileSelectFile, #2 , 3, C:\*.exe, AutoHome Auswählen für #2, Ausführbare Dateien (*.exe; *.bat; *.ahk)
Gui, Submit, NoHide
IniWrite, %#2%, %confdir%, programs, 2
GuiControl, , t2, %#2%
IniRead, var#2, %confdir%, programs, 2
return
Sel#3:
FileSelectFile, #3 , 3, C:\*.exe, AutoHome Auswählen für #3, Ausführbare Dateien (*.exe; *.bat; *.ahk)
Gui, Submit, NoHide
IniWrite, %#3%, %confdir%, programs, 3
GuiControl, , t3, %#3%
IniRead, var#3, %confdir%, programs, 3
return
Sel#4:
FileSelectFile, #4 , 3, C:\*.exe, AutoHome Auswählen für #4, Ausführbare Dateien (*.exe; *.bat; *.ahk)
Gui, Submit, NoHide
IniWrite, %#4%, %confdir%, programs, 4
GuiControl, , t4, %#4%
IniRead, var#4, %confdir%, programs, 4
return
Sel#5:
FileSelectFile, #5 , 3, C:\*.exe, AutoHome Auswählen für #5, Ausführbare Dateien (*.exe; *.bat; *.ahk)
Gui, Submit, NoHide
IniWrite, %#5%, %confdir%, programs, 5
GuiControl, , t5, %#5%
IniRead, var#5, %confdir%, programs, 5
return
Sel#6:
FileSelectFile, #6 , 3, C:\*.exe, AutoHome Auswählen für #6, Ausführbare Dateien (*.exe; *.bat; *.ahk)
Gui, Submit, NoHide
IniWrite, %#6%, %confdir%, programs, 6
GuiControl, , t6, %#6%
IniRead, var#6, %confdir%, programs, 6
return



Seldev:
FileSelectFolder, hodev , ::{20d04fe0-3aea-1069-a2d8-08002b30309d}, 4, Homelaufwerk Auswählen | AutoHome
RegWrite, Reg_SZ, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart , DEVICE, %hodev% 
GuiControl, Text, device, %hodev%
return



Copy:
RegRead, DEVICE, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, DEVICE
FileCopy, %A_ScriptDir%\bin\autorun.inf, %DEVICE%
FileCopy, %A_ScriptDir%\ICON\icon.ico, %DEVICE%
FileCopy, %A_ScriptDir%\bin\usb.ath, %DEVICE% 
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run, AutoHome - Autostart, "%A_ScriptDir%\AutoHome.exe"
MsgBox, 262208, Erfolg, Erfolg ! `nDie Dateien Wurden Kopiert! `nAutoHome ist Einsatzbereit.
IfMsgBox, OK
	Exit
return


1Help:
MsgBox, 64, Hilfe AutoHome, %Help%
return


Main:
Gui, Submit, NoHide
IniWrite, %New_status%, %confdir%, main, status
return


UpdY:
UpdateText := "Update Verfügbar!"
Gui, Add, Link, x380 y94 w100 h15, <a href="https://github.com/luca-alexander-thomas/AutoHome/releases">%UpdateText%</a>
return

UpdN:
UpdateText := "Version Aktuell	"
return

UpdMBY:
Run, https://github.com/luca-alexander-thomas/AutoHome/releases
ExitApp
return


editwill:
Run, %A_ScriptDir%\editor.exe "%willmessagedir%"
return

testwill:
FileRead, willmessage, %willmessagedir%
MsgBox, 64, AutoHome Willkommen, %willmessage%
IfMsgBox, Ok 
	Exit
return

autohomefile:
MsgBox, 8209, ERROR, AutoHome-Informationsdateien können nicht mit dem AutoHome-Panel geöffnet werden
IfMsgBox, OK
	Reload
IfMsgBox, Cancel
	ExitApp

return

athfile:
MsgBox, %Arg1%
if %Arg1% = %confdir%
	MsgBox, 8256, AutoHome Hinweis, Die Konfigurationsdatei unter %Arg1% ist gleich mit der Standart Konfigurationsdatei!
	goto, Readconf
if %Arg1% != %confdir%
	MsgBox, 8227, AutoHome Hinweis, Es wurde eine Konfigurationsdatei unter %Arg1% erkannt.`nSoll diese als Standart festgelegt werden?`nBei "Nein" kann diese nur bearbeitet werden.
	IfMsgBox, Yes
		RegWrite, REG_SZ, HKCU, \SOFTWARE\ATH\Autostart, CurrentConfPath, %Arg1%
		Restore
	IfMsgBox, No
		

return



MenüDateiÖffnen:
FileSelectFile, Arg1, 3, %A_ScriptDir%, AutoHome Konfigurationsdatei Öffnen, AutoHome Konfigurationsdateien (*.ath)
if Arg1 contains .ath
    gosub, athfile
if Arg1 contains .autohome
	gosub, autohomefile
return


MenuExit:
ExitApp

MenuHelp:


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