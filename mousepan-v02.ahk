/*
== "MousePan" v.02 
== Mikhail V. 2018 
== AHK1.1.28
== System-wide mouse-movement scroll

Note: this version uses right mouse button to scroll, so you need 
to run another script (rbutton-block.ahk) to prevent 
the OS consuming the right click.

**Usage**
Press and hold the right mouse button and move the mouse.
To set another key: see line 
>   pan := getkeystate("rbutton", "P")
To swap the scroll direction: see line
> swap := true 		; swap scroll direction
*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; install mouse hook - needed to read the physical state 
; of the mouse button (e.g. when it is blocked by another thread)
#InstallMouseHook

; min function
min(a,b) {
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

; ----- MAIN -----
mousegetpos, , preY	; get mouse Y position
movelimit := 20		; max amount of scroll at once
; swap := true 			; flag to swap scroll direction
swap := false 			; flag to swap scroll direction
loop 
{
	sleep, 20
	pan := getkeystate("rbutton", "P")		; set the key used to scroll
	mousegetpos, , Y						; get new mouse position Y
	dY := Y - preY
	moves := min(abs(dY), movelimit)		; amount of sent scroll events per once
	direct := (dY >= 0) ^ 1 ^ swap		; get direction
	; tooltip,  %direct% , %dY%			; for debugging 
	if (pan = true) {
		scroll(direct, moves)
	}
	preY := Y								; save previous Y position
}

; close the app with Shift+Escape (good for testing)
+esc::exitapp