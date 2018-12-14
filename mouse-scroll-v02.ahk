/*
Mouse Scroll v.02 
by Mikhail V., 2018 
tested on Windows 10, AHK 1.1.28

Note: this app uses right mouse button to toggle the scroll, so the rbutton must be blocked
(see rbutton-block.ahk) to prevent the context menu popup. 
To invoke the context menu, use double-Rightclick, or Ctrl-Rightclick.

== Usage ==
Press and hold the right mouse button and move the mouse vertically.
To set another key: see line 
>    pan := getkeystate("rbutton", "P")
To swap the scroll direction: see line
>    swap := true
*/


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetStoreCapsLockMode, Off
; install mouse hook - it is needed to read the physical state 
; of the mouse button if it is blocked by another thread
#InstallMouseHook

; min function
min(a, b) {
	if (b < a) {
		return b
	}
	return a
}

; scroll function : d = direction, n = amount of scrolls
scroll(d, n) {
	if (d = 1) {
		send, {wheeldown %n% } 
	}
	if (d = 0) {
		send, {wheelup %n%} 
	}
}

; === SETTINGS ===
k := 0.6						; scroll speed coefficient (higher k = more speed)
T := 300						; double-Rightclick threshold, millseconds
swap := true 					; swap scroll direction
; swap := false 
movelimit := 15				; max amount of scroll at once (better leave as is)
; ==============

mousegetpos, , Yp									; get mouse Y position
panp := getkeystate("rbutton", "P")					; save key state / set the key used to scroll
tikp := A_TickCount									; save time

loop 
{
	sleep 30
	pan := getkeystate("rbutton", "P")				; set the key used to scroll
	pan_on := (pan > panp)							; check if key state is changed 
	panp := pan
	; tooltip %pan%
	mousegetpos, , Y									; get current mouse position Y
	dY := k * (Y - Yp)								; relative mouse movement
	Yp := Y											; save Y position
	moves := min(floor(abs(dY)), movelimit)			; amount of scroll events per once
	direct := (dY >= 0) ^ swap						; get direction
	; tooltip,  %direct% , %dY%	
	if (pan = true) {
		scroll(direct, moves)
	}
	
	; ===  context menu on double-Rightclick
	if (pan_on = true) {
		tik := A_TickCount							; get current time
		dt := tik - tikp								; get time past from previous r-click
		tikp := tik										; save current time in a temp variable
		if (dt < T) {
			send {rbutton}
		}
	}
	 
}


; +esc:: exitapp
