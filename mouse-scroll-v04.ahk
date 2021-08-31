/*
Mouse Scroll v04 
by Mikhail V., 2021 
tested on Windows 10, AHK 1.1.28
*/

#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

running := 0

; === User settings ===
swap := false 
; swap := true 				; swap scroll direction

; horiz := false 
horiz := true 				; use horizontal movement as input

k := 1					; scroll speed coefficient (higher k means higher speed)

; === Internal settings ===
scrollsLimit := 15			; max amount of scroll at once 
S := 6						; unit distance (higher S = lower speed)
T := 30					; scan frequency in MS (

; ==============

dy := 0
dyTotal := 0
scrollsTotal := 0

; #if running
loop 
{
	sleep %T%

	if (running) {
		; mousegetpos, mx						; get current mouse position 
		mousegetpos, mx, my						; get current mouse position 
		if (horiz = 0) {
			dy := k * (my - myLast)						; relative mouse movement vertical
			myLast := my									; save position
		} else {
			dy := k * (mx - mxLast)						; relative mouse movement horizontal
			mxLast := mx									; save position
		}
		dyTotal := dyTotal + dy
		scrolls := dyTotal // S
		dyTotal := dyTotal - scrolls * S					; calculate remainder after division
		direction := (scrolls >= 0) ^ swap				; get direction
		scrollsN := abs(scrolls)
		scrollsTotal := scrollsTotal + scrollsN
		n := min(scrollsN, scrollsLimit)
		; tooltip,  %scrolls% -- %dy%
		if (direction = 1) 
			send, {wheeldown %n%} 
		if (direction = 0) 
			send, {wheelup %n%} 
	}
}

rbutton::
	running := 1
	dyTotal := 0
	mousegetpos, mxLast, myLast
return

rbutton up::
	running := 0
	if (scrollsTotal = 0) 
		send {rbutton}
	scrollsTotal := 0
return

; +esc:: ExitApp
