#NoEnv
SetBatchLines, -1
Titel := "Timer"
Noch := "Still"
Sek := "seconds"
Zeit := "Starting.."
; Das Skript erwartet einen Kommandozeilenparameter mit der Anzahl der Sekunden als positive Ganzzahl.
Sekunden := GetParam()
Time := GetParam()
If (Sekunden = 0) {
;  Falls eine Fehlermeldung gewünscht ist
   MsgBox, 16, %Titel%
         , The script requires a command line parameter with the number of seconds as a positive integer.
   ExitApp
}
;Folgendes Kommando für only Close GUI "Gui, +ToolWindow"
Gui, Font, s32 cNavy, Consolas
Gui, Add, Text, Center, Timer
Gui, Add, Text, Center vTimer, %Zeit%
Gui, Show, Minimize, %Titel%



Sleep, 1
S := A_TickCount
SetTimer, CountDown, 10
Return

GuiClose:
MsgBox, 262160, STOP, timer cannot be canceld!
	Return
IfMsgBox, ok
	Exit
    
GuiEscape:
MsgBox, 262160, STOP, timer cannot be canceld!
	Return
IfMsgBox, ok
	Exit
    
CountDown:
   T := A_TickCount - S
   If (T > 1000) {
      S += 1000
      Sekunden--
      GuiControl, , Timer, %Noch% %Sekunden% %Sek%
      If (Sekunden < 1)
         {
         MsgBox, 262208, Timer expired !, The timer expired after %Time% seconds!
         IfMsgBox OK
			ExitApp
         }
   }
Return

GetParam() {
   If (A_Args.Length() = 1) {
      Sekunden := A_Args[1]
      If Sekunden Is Integer
         If (Sekunden > 0)
            Return Sekunden
   }
   Return 0
}