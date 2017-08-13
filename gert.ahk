#Persistent

; The next key is pressed after
waitTimeInMinutes := 30 * 1000 * 60
actions := Object()
actions.Insert(1)
actions.Insert(2)
actions.Insert(3)

SetTimer, DoStuff, %waitTimeInMinutes%

active := true
actionIndex := 0
actionCount := actions.MaxIndex()

DoStuff:
if active {
	if (actionIndex > 0) {
		; Wait a few minutes extra
		Random, extraRandomMinutes, 1, 10
		Random, extraRandomSeconds, 1, 60
		extraRnd := (extraRandomMinutes * 1000 * 60) + (extraRandomSeconds * 1000)
		Sleep extraRnd

		; Press the key
		keyToPress := actions[actionIndex]
		SendInput %keyToPress%
	}
	actionIndex := actionIndex + 1
	if (actionIndex > actionCount) {
		actionIndex := 1
	}
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
