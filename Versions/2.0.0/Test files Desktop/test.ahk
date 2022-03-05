old_version := 1.0.51
URL := "https://data.lucathomas.de/AutoHome/2.0.0/Message.txt"


whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.Open("GET", "https://data.lucathomas.de/AutoHome/update.ath", true)
whr.Send()
; Using 'true' above and the call below allows the script to remain responsive.
whr.WaitForResponse()
URLS := whr.ResponseText
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.Open("GET", "https://camo.githubusercontent.com/7fe12d1f357642f85a89cf71d82acd70bc183eb675cdedd8352bebf0aa87e1bf/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f56657273696f6e2d312e302e312d677265656e", true)
whr.Send()
; Using 'true' above and the call below allows the script to remain responsive.
whr.WaitForResponse()
version := whr.ResponseText
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.Open("GET", "https://data.lucathomas.de/AutoHome/2.0.0/Message.txt", true)
whr.Send()
; Using 'true' above and the call below allows the script to remain responsive.
whr.WaitForResponse()
text := whr.ResponseText
MsgBox % Text
MsgBox % Version
MsgBox % URL