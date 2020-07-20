# Drag Scroll Autohotkey 
This Autohotkey app provides system-wide drag scroll functionality. It uses mouse vertical movement for scrolling, which turns out to be more efficient and it also significantly reduces stress on the operator's hand compared to the scroll wheel. So if you want better scrolling experience (or maybe your scroll wheel broke) then this app is for you.  
Further, if you use drawing tablet or touchpad and the driver/OS does not provide drag scroll, then this app solves it.

### Installation
Firstly, you need Autohotkey installed on your PC. This script was tested with AHK 1.1.28 on Windows 10, but other Windows versions should also work.  You can download AHK from offical site, easiest option is to pick an .exe installer with recent version:  
 https://www.autohotkey.com/  


### Run the script
Once you have successfully installed Autohotkey, `.ahk` files can be run by double-clicking on the `.ahk` file in explorer.  

Put these 3 files in some local folder together:  

`mouse-scroll-run.ahk`  
`rbutton-block.ahk`   
`mouse-scroll-main.ahk`   

Then just run the `mouse-scroll-run.ahk`, it will run other two scripts.  To close the app, manually close tray icons of both scripts.  
If you want it to run automatically at startup, copy-paste shortcut of the `mouse-scroll-run.ahk` into the "startup" folder. 

Press and hold the right mouse button to scroll - faster movement will scroll more.

### Setup 
**Important**: For smoother scrolling, you may first set the system scroll speed to **1** or **2** in system Mouse Properties:   

<img src="./img/wheel.png">  
<!-- <img src="https://github.com/Mikhail22/Autohotkey/blob/master/img/wheel.png">   -->

 
Few setup variables are available, see "User settings" section directly in the source code (`mouse-scroll-main.ahk`). Simply edit the variable in the source code and restart the app 
(just run `mouse-scroll-main.ahk` again).

To set the scroll speed, edit the line:  
> k := 6

To swap the scroll direction: see line  
> swap := true


### Files description
`mouse-scroll-run.ahk` Run this script to run the other two scripts.  
`mouse-scroll-main.ahk` Main script.  
`rbutton-block.ahk` Prevents the right mouse button system-wide.
