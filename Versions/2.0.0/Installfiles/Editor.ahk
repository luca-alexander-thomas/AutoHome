#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%


confdir := A_Args[1]

if confdir contains .ath
    gosub, athfile
if confdir contains .autohome
	gosub, autohomefile



Menu, Dateimen?, Add, ?&ffnen, Men?Datei?ffnen
Menu, Dateimen?, Add, &Beenden, MenuExit
Menu, Hilfsmen?, Add, Inf&o, MenuHelp
Menu, MeineMen?leiste, Add, &Datei, :Dateimen?
Menu, MeineMen?leiste, Add, &?, :Hilfsmen?





Gui, Menu, MeineMen?leiste
Gui, Font, s11 w700, Arial
Gui, Add, Text, x25 y45 w350 h28, Dateien zum bearbeiten ?ber Men?leiste ?ffnen
Gui, Show, w400 h600, AutoHome Editor
return

Men?Datei?ffnen:
Gui, Flash
FileSelectFile, confdir , 3, %A_ScriptDir%, AutoHome Datei ?ffnen, AutoHome Dateien (*.ath; *.autohome)
if confdir contains .ath
    gosub, athfile
if confdir contains .autohome
	gosub, autohomefile
return


MenuExit:
ExitApp

MenuHelp:


Readath:
IniRead, dir1, %confdir%, programs, 1
IniRead, dir2, %confdir%, programs, 2
IniRead, dir3, %confdir%, programs, 3
IniRead, dir4, %confdir%, programs, 4
IniRead, dir5, %confdir%, programs, 5
IniRead, dir6, %confdir%, programs, 6
IniRead, start1, %confdir%, programs-start, 1
IniRead, start2, %confdir%, programs-start, 2
IniRead, start3, %confdir%, programs-start, 3
IniRead, start4, %confdir%, programs-start, 4
IniRead, start5, %confdir%, programs-start, 5
IniRead, start6, %confdir%, programs-start, 6
IniRead, device, %confdir%, device, letter
IniRead, status, %confdir%, main, status
IniRead, messagedir, %confdir%, main, message
IniRead, username, %confdir%, user, Username
IniRead, pcname, %confdir%, user, PCname
IniRead, system, %confdir%, user, System
return

writeath:
IniWrite, %New_dir1%, %confdir%, programs, 1
IniWrite, %New_dir2%, %confdir%, programs, 2
IniWrite, %New_dir3%, %confdir%, programs, 3
IniWrite, %New_dir4%, %confdir%, programs, 4
IniWrite, %New_dir5%, %confdir%, programs, 5
IniWrite, %New_dir6%, %confdir%, programs, 6
IniWrite, %New_start1%, %confdir%, programs-start, 1
IniWrite, %New_start2%, %confdir%, programs-start, 2
IniWrite, %New_start3%, %confdir%, programs-start, 3
IniWrite, %New_start4%, %confdir%, programs-start, 4
IniWrite, %New_start5%, %confdir%, programs-start, 5
IniWrite, %New_start6%, %confdir%, programs-start, 6
IniWrite, %New_device%, %confdir%, device, letter
IniWrite, %New_status%, %confdir%, main, status
IniWrite, %New_messagedir%, %confdir%, main, message
IniWrite, %New_Username%, %confdir%, user, Username
IniWrite, %New_PCname%, %confdir%, user, PCname


return





GuiClose:
ExitApp

saveath:
Gui, Submit, NoHide
gosub, writeath
gosub, Readath
return

saveautohome:
Gui, Submit, NoHide
FileDelete, %confdir%
FileAppend, %New_Content%, %confdir%, UTF-8
FileRead, Content, %confdir%
return

athfile:
SplitPath, confdir, editfile
Gui, Destroy
Gui, Menu, MeineMen?leiste
Gui, Show, w400 h600, AutoHome Editor - %editfile%
gosub, Readath
Gui, Add, Text, x12 y36 w192 h19 , Speicherort Programm 1
Gui, Add, edit, vNew_dir1 r1 x12 y64 w280 h28 , %dir1%
Gui, Add, Text, x12 y96 w192 h19 , Speicherort Programm 2
Gui, Add, edit, vNew_dir2 r1 x12 y120 w280 h28 , %dir2%
Gui, Add, Text, x12 y148 w192 h19 , Speicherort Programm 3
Gui, Add, edit, vNew_dir3 r1 x12 y176 w280 h28 , %dir3%
Gui, Add, Text, x12 y204 w192 h19 , Speicherort Programm 4
Gui, Add, edit, vNew_dir4 r1 x12 y232 w280 h28 , %dir4%
Gui, Add, Text, x12 y260 w192 h19 , Speicherort Programm 5
Gui, Add, edit, vNew_dir5 r1 x12 y288 w280 h28 , %dir5%
Gui, Add, Text, x12 y316 w192 h19 , Speicherort Programm 6
Gui, Add, edit, vNew_dir6 r1 x12 y344 w280 h28 , %dir6%
Gui, Add, Text, x335 y36 w50 h19 , Status 1
Gui, Add, edit, vNew_start1 r1 x340 y64 w50 h28 , %start1%
Gui, Add, Text, x335 y96 w50 h19 , Status 2
Gui, Add, edit, vNew_start2 r1 x340 y120 w50 h28 , %start2%
Gui, Add, Text, x335 y148 w50 h19 , Status 3
Gui, Add, edit, vNew_start3 r1 x340 y176 w50 h28 , %start3%
Gui, Add, Text, x335 y204 w50 h19 , Status 4
Gui, Add, edit, vNew_start4 r1 x340 y232 w50 h28 , %start4%
Gui, Add, Text, x335 y260 w50 h19 , Status 5
Gui, Add, edit, vNew_start5 r1 x340 y288 w50 h28 , %start5%
Gui, Add, Text, x335 y316 w50 h19 , Status 6
Gui, Add, edit, vNew_start6 r1 x340 y344 w50 h28 , %start6%
Gui, Add, Text, x12 y372 w180 h19 , Laufwerksbuchstabe
Gui, Add, edit, vNew_device r1 x12 y400 w180 h28 , %device%
Gui, Add, Text, x210 y372 w180 h19 , Speicherort Willkommens Nachricht
Gui, Add, edit, vNew_messagedir r1 x210 y400 w180 h28 , %messagedir%
Gui, Add, Text, x12 y428 w376 h19 , Autostart Status
Gui, Add, edit, vNew_status r1 x12 y456 w376 h28 , %status%
Gui, Add, Text, x12 y493 w192 h19, Computername \ Benutzername
Gui, Add, text, x198 y521 w5 h28, \
Gui, Add, Edit, vNew_Username r1 x12 y521 w180 h28, %Username%
Gui, Add, edit, vNew_PCname r1 x210 y521 w180 h28, %PCname%
Gui, Add, Button, gsaveath, Sichern
return


autohomefile:
Gui, Destroy
Gui, Menu, MeineMen?leiste
Gui, Show, w400 h600, AutoHome Editor - %editfile%
FileRead, Content, %confdir%
Gui, Add, Edit, vNew_Content r40 x12 y35 w376 h550, %Content%
Gui, Add, Button, gsaveautohome, Sichern
return
