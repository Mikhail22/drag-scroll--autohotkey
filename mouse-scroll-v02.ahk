/*
  Mouse-Scroll v.02 
  by Mikhail V., 2018 
  tested on Windows 10, AHK 1.1.28

Note: this app uses right mouse button to toggle scroll mode, so the button must be blocked
(see rbutton-block.ahk) to prevent the context menu popup.

== Usage ==
Press and hold the right mouse button and move the mouse.
To set another key: see line 
-->    pan := getkeystate("rbutton", "P")
To swap the scroll direction: see line
-->    swap := true
*/


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetStoreCapsLockMode, Off
; install mouse hook - needed to read the physical state 
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

; ----- MAIN -----
mousegetpos, , preY			; get mouse Y position
movelimit := 15					; max amount of scroll at once
; swap := true 					; flag to swap scroll direction
swap := false 					; flag to swap scroll direction
loop 
{
	sleep 30
	pan := getkeystate("rbutton", "P")		; set the key used to scroll
	mousegetpos, , Y							; get current mouse position Y
	dY := Y - preY								; relative mouse movement
	moves := min(abs(dY), movelimit)		; amount of scroll events per once
	direct := (dY >= 0) ^ 1 ^ swap			; get direction
	; tooltip,  %direct% , %dY%	
	if (pan = true) {
		scroll(direct, moves)
	}
	preY := Y					; save Y position
}

;exit app
;+esc:: exitapp
