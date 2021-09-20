FileRead, Help, H:\AutoHome\Source\Help.autohome
Arg1 := A_Args[1]
Arg2 := A_Args[2]

if (Arg2 = "--help") {
	gosub, Help
	return
}
if (Arg1 = "--Panel") {
	Run, "H:\AutoHome\Source\AutoHomePanel.ahk"
	return
}
if (Arg1 = "--AStart") {
	Run, test.txt
	return
}
else {
	
	return
}



Help:
MsgBox, 64, Hilfe AutoHome, %Help%
return

