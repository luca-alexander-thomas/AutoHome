Titel := "AutoHome-Panel"
FileRead, Start, Start.autohome
RegWrite, Reg_SZ, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome , target, "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

Loop, 1 {	
	RegRead, var#1, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, #1
	RegRead, var#2, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, #2
	RegRead, var#3, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, #3
	RegRead, var#4, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, #4
	RegRead, var#5, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, #5
	RegRead, var#6, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, #6
	RegRead, deviceUSB, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, DEVICE
	RegRead, willmessage, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, MESSAGE
	RegRead, target, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, target
	RegRead, InstallPath, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, InstallPath
}

Gui, Font, s20 
Gui -MaximizeBox
Gui, Add, Picture, x12 y16 w86 h76 , E:\Downloads\icon.ico ;H:\icon.ico
Gui, Add, Text, c0B4C5F x176 y16 w200 h28 +Center, %Titel%
Gui, Font, s8
Gui, Add, StatusBar,, ? 2021 Luca-Alexander Thomas 	AutoHome?
Gui, Add, Tab2, x0 y94 w479 h398 , Start|Grundeinstellungen|Autostart

Gui, Tab, 3
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

Gui, Tab, 1
Gui, Font, s11 c#21610B
Gui, Add, Text,x3 y151 w470 h390 +Center, %Start%

Gui, Tab, 2
Gui, Font, s8 cBlack
Gui, Add, Text, x5 y125 w160 h28, Homelaufwerk Ausw?hlen: 
Gui, Add, Text, x5 y215 w160 h28, Zielordner:
Gui, Add, Text, x5 y290 w300 h40, Als Zielordner gilt der Autostartordner.
Gui, Font, s8 cBlack
Gui, Add, Edit,x15 y140 w200 h28 ReadOnly vdevice, %deviceUSB%
Gui, Add, Edit,x15 y232 w290 h28 ReadOnly, %target%
Gui, Add, Button, x210 y315 w90 h28 gCopy, Dateien Kopieren
Gui, Font, s15 cBlack
Gui, Add, Button, x260 y140 w30 h28 gSeldev, ...



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
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome , #1, %#1%
GuiControl, , t1, %var#1% | %#1%
return
Check#2:
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome , #2, %#2%
GuiControl, , t2, %var#2% | %#2%
return
Check#3:
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome , #3, %#3%
GuiControl, , t3, %var#3% | %#3%
return
Check#4:
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome , #4, %#4%
GuiControl, , t4, %var#4% | %#4%
return
Check#5:
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome , #5, %#5%
GuiControl, , t5, %var#5% | %#5%
return
Check#6:
RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome , #6, %#6%
GuiControl, , t6, %var#6% | %#6%
return


Sel#1:
FileSelectFile, #1 , 3, C:\*.exe, AutoHome Ausw?hlen f?r #1, Ausf?hrbare Dateien (*.exe; *.bat; *.ahk)
GuiControl, , t1, %#1%
return
Sel#2:
FileSelectFile, #2 , 3, C:\*.exe, AutoHome Ausw?hlen f?r #2, Ausf?hrbare Dateien (*.exe; *.bat; *.ahk)
GuiControl, , t2, %#2%
return
Sel#3:
FileSelectFile, #3 , 3, C:\*.exe, AutoHome Ausw?hlen f?r #3, Ausf?hrbare Dateien (*.exe; *.bat; *.ahk)
GuiControl, , t3, %#3%
return
Sel#4:
FileSelectFile, #4 , 3, C:\*.exe, AutoHome Ausw?hlen f?r #4, Ausf?hrbare Dateien (*.exe; *.bat; *.ahk)
GuiControl, , t4, %#4%
return
Sel#5:
FileSelectFile, #5 , 3, C:\*.exe, AutoHome Ausw?hlen f?r #5, Ausf?hrbare Dateien (*.exe; *.bat; *.ahk)
GuiControl, , t5, %#5%
return
Sel#6:
FileSelectFile, #6 , 3, C:\*.exe, AutoHome Ausw?hlen f?r #6, Ausf?hrbare Dateien (*.exe; *.bat; *.ahk)
GuiControl, , t6, %#6%
return



Seldev:
FileSelectFolder, hodev , ::{20d04fe0-3aea-1069-a2d8-08002b30309d}, 4, Homelaufwerk Ausw?hlen | AutoHome
RegWrite, Reg_SZ, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome , DEVICE, %hodev% 
RegRead, deviceUSB, HKEY_CURRENT_USER\SOFTWARE\AHK\AutoHome, DEVICE
GuiControl, Text, device, %hodev%
return



Copy:
FileCopy, autorun.inf, %deviceUSB%
FileCopy, icon.ico, %deviceUSB%
FileCopy, usb.autohome, %deviceUSB% 
FileCreateShortcut, %A_ScriptDir%\AutoHome.exe, AutoHome-Autostart.lnk, %A_ScriptDir%, , Autostart von AutoHome, %A_ScriptDir%\Autohome.exe, , 1, 1
Run, %A_ScriptDir%\copy.bat
MsgBox, 262208, Erfolg, Erfolg ! `nDie Dateien Wurden Kopiert! `nAutoHome ist Einsatzbereit.
IfMsgBox, OK
	Exit








