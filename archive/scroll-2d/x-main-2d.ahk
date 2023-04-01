/*

*/

#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetStoreCapsLockMode, Off
#InstallMouseHook
; #InstallKeybdHook
running := 1
SetDefaultMouseSpeed, 0
SetMouseDelay, -1
CoordMode, Mouse, Screen
; === User settings ===
swapX := false 
swapY := true 
; swap := true 				; swap scroll direction
k := 1					; scroll speed coefficient (higher k means higher speed)

; === Internal settings ===
scrollsLimit := 10			; max amount of scroll at once 
S := 10						; unit distance (higher S = lower speed)

; ==============



d0X := 0
d0Y := 0
nX := 0
nY := 0
nXabs := 0
nYabs := 0
dSumX := 0
dSumY := 0
mousegetpos, mxFix, myFix
scrollsTotal := 0
dLimit := 50
T := 20					; scan frequency in MS 
TC := 350					; double click speed MS
ticker := 1000					; tick counter ms

loop 
{
	sleep %T%
	pan := getkeystate("rbutton", "P")				; set the key used to scroll
	; pan := getkeystate("numpaddiv", "P")				; set the key used to scroll
	trigger := (pan > panPrev)
	if (trigger = 1) {
		if (ticker < TC) {
			send {click right}
		} else {
			ticker := 0
		}
	}
	ticker := ticker + T
	panPrev := pan
	mousegetpos  mx, my						; get current mouse position 
	if (pan = 1) {
		d0X := k*(mx - mxFix)
		d0Y := k*(my - myFix)
		; d0 := k*(mx - mxFix)
		dSumX := dSumX + d0X
		dSumY := dSumY + d0Y
		directionX := (dSumX >= 0) ^ swapX
		directionY := (dSumY >= 0) ^ swapY
		nX := dSumX // S
		nY := dSumY // S
		dSumX := dSumX - nX * S					; calculate remainder after division
		dSumY := dSumY - nY * S					; calculate remainder after division

		nXabs := abs(nX)
		nXabs := min(nXabs, scrollsLimit)
		
		nYabs := abs(nY)
		nYabs := min(nYabs, scrollsLimit)

		if (nXabs > 0) {
			if (directionX = 1) 
				send  {wheelleft %nXabs%} 
			if (directionX = 0) 
				send  {wheelright %nXabs%} 
		}
		if (nYabs > 0) {
			if (directionY = 1) 
				send  {wheeldown %nYabs%} 
			if (directionY = 0) 
				send  {wheelup %nYabs%} 
		}

	} else {
		d0X := 0
		d0Y := 0
		dSumX := 0
		dSumY := 0
	}
	mousegetpos, mxFix, myFix
}


; +esc:: ExitApp


