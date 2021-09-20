#NoEnv
#NoTrayIcon
Arg1 := A_Args[1]
SplashImage, %A_ScriptDir%\ICON\iconB.png, b fs14 CWFFFFFF,  AutoHomePanel Starten...
Titel := "AutoHome-Panel"
FileRead, Help, %A_ScriptDir%\bin\Help.autohome

if (Arg1 = "--help")
	gosub, 1Help
	


Loop, 1 {	
	RegRead, var#1, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options, #1
	RegRead, var#2, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options, #2
	RegRead, var#3, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options, #3
	RegRead, var#4, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options, #4
	RegRead, var#5, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options, #5
	RegRead, var#6, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options, #6
	RegRead, deviceUSB, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, DEVICE
	RegRead, willmessage, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, MESSAGE
	RegRead, target, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, target
	RegRead, InstallPath, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, InstallPath
	RegRead, AppVersion, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, AppVersion
	RegRead, autoON, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, AutostartON
	RegRead, 1autoON, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, 1AutostartON
}



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
Gui, Add, Picture, x12 y16 w86 h76 , %A_ScriptDir%\ICON\icon.png
Gui, Add, Text, c0B4C5F x176 y16 w200 h28 +Center, %Titel%
Gui, Font, s8
Gui, Add, Link, x380 y94 w100 h15, <a href="https://github.com/luca-alexander-thomas/AutoHome/releases">%UpdateText%</a>

Gui, Font, s8
Gui, Add, StatusBar,,  © 2021 Luca-Alexander Thomas	AutoHome®	%UpdateText%
Gui, Add, Tab2, x0 y94 w479 h398 , Einstellungen|Autostart Programme

Gui, Tab, 1
Gui, Font, s8 cBlack
Gui, Add, Text, x5 y125 w160 h28, Homelaufwerk Auswählen: 
Gui, Font, s8 cBlack
Gui, Add, Edit,x15 y140 w200 h28 ReadOnly vdevice, %deviceUSB%
Gui, Add, Button, x290 y140 w96 h28 gCopy, Dateien Kopieren
Gui, Font, s15 cBlack
Gui, Add, Button, x220 y140 w30 h28 gSeldev, ...
Gui, Font, s10 cBlack
Gui, Add, Text, x40 y200 w96 h28, Autostart:
Gui, Add, Text, x267 y200 w182 h38 , Willkommens Nachricht
Gui, Font, s8 cBlack
Gui, Add, Radio, x40 y226 w96 h28 gon Checked%autoON% , Ein
Gui, Add, Radio, x40 y250 w96 h28 goff Checked%1autoON% , Aus
Gui, Add, Button, x367 y343 w86 h28 g1Help, Hilfe
Gui, Add, Button, x290 y237 w96 h28 geditwill, Bearbeiten
Gui, Add, Button, x290 y270 w96 h28 gtestwill, Testen



Gui, Tab, 2
Gui, Font, s8 cBlack
Gui, Add, Button, x10 y151 w85 h28 gStart#1, Start #1
Gui, Add, Button, x10 y189 w85 h28 gStart#2, Start #2
Gui, Add, Button, x10 y228 w85 h28 gStart#3, Start #3
Gui, Add, Button, x10 y266 w85 h28 gStart#4, Start #4
Gui, Add, Button, x10 y304 w85 h28 gStart#5, Start #5
Gui, Add, Button, x10 y343 w85 h28 gStart#6, Start #6
Gui, Font, s8 cblack
Gui, Add, Edit, x145 y151 w285 h28 ReadOnly vt1, %var#1%
Gui, Add, Edit, x145 y189 w285 h28 ReadOnly vt2, %var#2%
Gui, Add, Edit, x145 y228 w285 h28 ReadOnly vt3, %var#3%
Gui, Add, Edit, x145 y266 w285 h28 ReadOnly vt4, %var#4%
Gui, Add, Edit, x145 y304 w285 h28 ReadOnly vt5, %var#5%
Gui, Add, Edit, x145 y343 w285 h28 ReadOnly vt6, %var#6%
Gui, Font, s15 cBlack
Gui, Add, Button,x440 y151 w30 h28 gSel#1, ...
Gui, Add, Button, x440 y189 w30 h28 gSel#2, ...
Gui, Add, Button, x440 y228 w30 h28 gSel#3, ...
Gui, Add, Button, x440 y266 w30 h28 gSel#4, ...
Gui, Add, Button, x440 y304 w30 h28 gSel#5, ...
Gui, Add, Button, x440 y343 w30 h28 gSel#6, ...
Gui, Add, CheckBox, x114 y151 w19 h28 gCheck#1, 
Gui, Add, CheckBox, x114 y189 w19 h28 gCheck#2, 
Gui, Add, CheckBox, x114 y228 w19 h28 gCheck#3, 
Gui, Add, CheckBox, x114 y266 w19 h28 gCheck#4, 
Gui, Add, CheckBox, x114 y304 w19 h28 gCheck#5, 
Gui, Add, CheckBox, x114 y343 w19 h28 gCheck#6,
Gui, Font, s8 cBlack
Gui, Add, Text, x140 y123 w288 h28 +Center, Aktuelles Programm | Neues Programm
Gui, Add, Text, x98 y123 w45 h28 +Center, Autostart




Gui, Show, w480 h400, AutoHome-Panel
Gui, Submit , NoHide
return

GuiClose:
ExitApp

Start#1:
Run %var#1%
Run %#1%
return
Start#2:
Run %var#2%
Run %#1%
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
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options , #1, %#1%
GuiControl, , t1, %var#1% | %#1%
return
Check#2:
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options , #2, %#2%
GuiControl, , t2, %var#2% | %#2%
return
Check#3:
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options , #3, %#3%
GuiControl, , t3, %var#3% | %#3%
return
Check#4:
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options , #4, %#4%
GuiControl, , t4, %var#4% | %#4%
return
Check#5:
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options , #5, %#5%
GuiControl, , t5, %var#5% | %#5%
return
Check#6:
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart\Options , #6, %#6%
GuiControl, , t6, %var#6% | %#6%
return


Sel#1:
FileSelectFile, #1 , 3, C:\*.exe, AutoHome Auswählen für #1, Ausführbare Dateien (*.exe; *.bat; *.ahk)
GuiControl, , t1, %#1%
return
Sel#2:
FileSelectFile, #2 , 3, C:\*.exe, AutoHome Auswählen für #2, Ausführbare Dateien (*.exe; *.bat; *.ahk)
GuiControl, , t2, %#2%
return
Sel#3:
FileSelectFile, #3 , 3, C:\*.exe, AutoHome Auswählen für #3, Ausführbare Dateien (*.exe; *.bat; *.ahk)
GuiControl, , t3, %#3%
return
Sel#4:
FileSelectFile, #4 , 3, C:\*.exe, AutoHome Auswählen für #4, Ausführbare Dateien (*.exe; *.bat; *.ahk)
GuiControl, , t4, %#4%
return
Sel#5:
FileSelectFile, #5 , 3, C:\*.exe, AutoHome Auswählen für #5, Ausführbare Dateien (*.exe; *.bat; *.ahk)
GuiControl, , t5, %#5%
return
Sel#6:
FileSelectFile, #6 , 3, C:\*.exe, AutoHome Auswählen für #6, Ausführbare Dateien (*.exe; *.bat; *.ahk)
GuiControl, , t6, %#6%
return



Seldev:
FileSelectFolder, hodev , ::{20d04fe0-3aea-1069-a2d8-08002b30309d}, 4, Homelaufwerk Auswählen | AutoHome
RegWrite, Reg_SZ, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart , DEVICE, %hodev% 
RegRead, deviceUSB, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, DEVICE
GuiControl, Text, device, %hodev%
return



Copy:
FileCopy, %A_ScriptDir%\bin\autorun.inf, %deviceUSB%
FileCopy, %A_ScriptDir%\ICON\icon.ico, %deviceUSB%
FileCopy, %A_ScriptDir%\bin\usb.ath, %deviceUSB% 
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run, AutoHome - Autostart, "%A_ScriptDir%\AutoHome.exe"
MsgBox, 262208, Erfolg, Erfolg ! `nDie Dateien Wurden Kopiert! `nAutoHome ist Einsatzbereit.
IfMsgBox, OK
	Exit
return


1Help:
MsgBox, 64, Hilfe AutoHome, %Help%
return


on:
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, AutostartON, 1
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, 1AutostartON, 0
return

off:
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, AutostartON, 0
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\ATH\Autostart, 1AutostartON, 1
return

UpdY:
UpdateText := "Update Verfügbar!"
return

UpdN:
UpdateText := "Version Aktuell"
return

UpdMBY:
Run, https://github.com/luca-alexander-thomas/AutoHome/releases
ExitApp
return


editwill:
Run, C:\Windows\Notepad.exe "%A_ScriptDir%\bin\message.autohome"
return

testwill:
FileRead, willmessage, %A_ScriptDir%\bin\message.autohome
MsgBox, 64, AutoHome Willkommen, %willmessage%
IfMsgBox, Ok 
	Exit
return