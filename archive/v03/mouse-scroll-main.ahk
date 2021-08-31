/*
Mouse Scroll v03 
by Mikhail V., 2020 
tested on Windows 10, AHK 1.1.28

Note: this app uses right mouse button to toggle scrolling, 
so the rbutton is blocked to prevent the context menu popup.
(see: rbutton-block.ahk)  
*/

#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetStoreCapsLockMode, Off
#InstallMouseHook

; === User settings ===
; swap := false 
swap := true 				; swap scroll direction
k := 6						; scroll speed coefficient (higher k means higher speed)

; === Internal settings ===
movelimit := 15			; max amount of scroll at once 
S := 20						; unit distance (higher S = lower speed)
T := 20					; scan frequency in MS (

; ==============

mousegetpos, , yp									; get mouse Y position
; panp := getkeystate("rbutton", "P")					; save key state / set the key used to scroll
dy := 0
dyTotal := 0
movesTotal := 0

loop 
{
	sleep %T%
	pan := getkeystate("rbutton", "P")				; set the key used to scroll
	; pan_on := (pan > panp)							; check if key state is changed 
	pan_off := (pan < panp)							; check if key state is changed 
	panp := pan
	mousegetpos, , y							; get current mouse position Y
	dy := k * (y - yp)						; relative mouse movement
	yp := y									; save y position
	dyTotal := dyTotal + dy
	moves := dyTotal // S
	dyTotal := dyTotal - moves * S					; calculate remainder after division
	d := (moves >= 0) ^ swap					; get direction
	n := min(abs(moves), movelimit)
	; tooltip,  %moves% -- %dy%
	
	if (pan = true ) {
		if (d = 1) 
			send, {wheeldown %n% } 
		if (d = 0) 
			send, {wheelup %n%} 
		movesTotal := movesTotal + moves
	}
	if (pan_off = true) {
		if (movesTotal = 0) 
			send {rbutton}
		movesTotal := 0
	}
}
