#NoEnv
SetBatchLines, -1
Titel := "Timer"
Noch := "Noch"
Sek := "Sekunden"
Zeit := "Startet.."
; Das Skript erwartet einen Kommandozeilenparameter mit der Anzahl der Sekunden als positive Ganzzahl.
Sekunden := GetParam()
Time := GetParam()
If (Sekunden = 0) {
;  Falls eine Fehlermeldung gewünscht ist
   MsgBox, 16, %Titel%
         , Das Skript benötigt einen Kommandozeilenparameter mit der Anzahl der Sekunden als positive Ganzzahl.
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
MsgBox, 262160, STOP, Timer kann nicht beendet werden!
	Return
IfMsgBox, ok
	Exit
    
GuiEscape:
MsgBox, 262160, STOP, Timer kann nicht beendet werden!
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
         MsgBox, 262208, Timer Abgelaufen!, Der Timer ist nach %Time% Sekunden Abgelaufen!
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