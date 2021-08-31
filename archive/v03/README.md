# Drag to scroll  🖱️↕ (Autohotkey, Windows)
This Autohotkey app provides system-wide drag-to-scroll feature. It uses mouse vertical movement for scrolling, which turns out to be more efficient and it also significantly reduces stress on the operator's hand compared to the scroll wheel. So if you want better scrolling experience (or maybe your scroll wheel broke) then this app is for you.  
Further, if you use a drawing tablet or a touchpad and the driver/OS does not provide drag scroll, then this app solves it.

### Installation
Firstly, you need Autohotkey (v1.1.27+) installed on your PC. The easiest option is to download the .exe installer from the offical site: [www.autohotkey.com](https://www.autohotkey.com)  

Once you have installed Autohotkey, “.ahk” files can be run directly in explorer.  

Download and put these 3 files in some local folder together:  

[mouse-scroll-run.ahk](mouse-scroll-run.ahk)  
[mouse-scroll-main.ahk](mouse-scroll-main.ahk)  
[rbutton-block.ahk](rbutton-block.ahk)  


### Run the script

Run the “mouse-scroll-run.ahk”, it will run other two scripts.  Now hold the right mouse button and move the mouse to scroll.  
To close the app, manually close tray icons of both scripts.  

If you want the app to start automatically at OS startup, copy-paste the shortcut of the “mouse-scroll-run.ahk” into the Startup folder:  
 (“%appdata%\Microsoft\Windows\Start Menu\Programs\Startup”).  

### Setup 
**Note**: For smoother scrolling, you may first set the system scroll speed to “1” or “2” in system Mouse Properties:   

<img src="./img/wheel.png">  
 
To customize the scrolling speed you need to edit the main script, “mouse-scroll-main.ahk”.
Few setup variables are available, see “User settings” section in the source code. Simply edit the variable in the source code and restart the app 
(just run “mouse-scroll-main.ahk” again, it should reload automatically).

To set the scroll speed factor, edit the `k` variable:  
> k := 6  

To swap the scrolling direction, set the `swap` variable to “true” or “false”:
> swap := true

<br>

---

### Files summary
[mouse-scroll-run.ahk](mouse-scroll-run.ahk)  - Runs the other two scripts.  
[mouse-scroll-main.ahk](mouse-scroll-main.ahk)  - Main app  
[rbutton-block.ahk](rbutton-block.ahk)  - Prevents the right mouse button system-wide  

