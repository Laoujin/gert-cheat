#Persistent

keyToPress := 5
keyToPress2 := 4
everyMinutes := 30 * 1000 * 60

SetTimer, DoStuff, %everyMinutes%

active := true

DoStuff:
if active {
	; MsgBox yaye
	SendInput %keyToPress%
	Sleep, 1000
	SendInput %keyToPress2%
}
return

; Control+Win+S toggle active
^#s::
active := !active
return

; Control+Win+R reload script
^#r::
Reload
return