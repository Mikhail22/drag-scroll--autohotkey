# Drag Scroll Autohotkey 🖱️↕
This Autohotkey app provides system-wide drag scroll functionality. It uses mouse vertical movement for scrolling, which turns out to be more efficient and it also significantly reduces stress on the operator's hand compared to the scroll wheel. So if you want better scrolling experience (or maybe your scroll wheel broke) then this app is for you.  
Further, if you use drawing tablet or touchpad and the driver/OS does not provide drag scroll, then this app solves it.

### Installation
Firstly, you need Autohotkey installed on your PC. This script was tested with AHK 1.1.28 on Windows 10, but other Windows versions should also work.  You can download AHK from offical site, easiest option is to pick an .exe installer with recent version:  
 https://www.autohotkey.com/  

Once you have successfully installed Autohotkey, `.ahk` files can be run by double-clicking on the `.ahk` file in explorer.  

Download and put these 3 files in some local folder together:  

`mouse-scroll-run.ahk`  
`rbutton-block.ahk`   
`mouse-scroll-main.ahk`   


### Run the script

Run the `mouse-scroll-run.ahk`, it will run other two scripts.  To close the app, manually close tray icons of both scripts.  
If you want it to start automatically at startup, copy-paste shortcut of the `mouse-scroll-run.ahk` into the "startup" folder. 

Press and hold the right mouse button to scroll - faster movement will scroll more.

### Setup 
**Important**: For smoother scrolling, you may first set the system scroll speed to **1** or **2** in system Mouse Properties:   

<img src="./img/wheel.png">  
 
To customize the scrolling you need to edit main script, `mouse-scroll-main.ahk`.
Few setup variables are available, see "User settings" section in the source code. Simply edit the variable in the source code and restart the app 
(just run `mouse-scroll-main.ahk` again).

To set the scroll speed factor, edit the `k` variable:  
> k := 6  

To swap the scroll direction set `swap` variable to "true" or "false":
> swap := true

<br>

---

### Files summary
`mouse-scroll-run.ahk` Run this script to run the other two scripts.  
`mouse-scroll-main.ahk` Main script.  
`rbutton-block.ahk` Prevents the right mouse button system-wide.
