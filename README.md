# Autohotkey - Mouse scroll (drag scroll)
This Autohotkey (short: AHK) script provides system-wide mouse scrolling functionality.  
By using this script you don't have to use the mouse wheel for scrolling anymore. Instead, it uses mouse vertical movement for scrolling, which turns out to be much more efficient and it also significantly reduces stress on the operator's hand.    
**Important**: For smoother scrolling set the scroll step to **"1"** in windows mouse properties:  
<img src="https://github.com/Mikhail22/Autohotkey/blob/master/img/wheel.png">  
  

### installation
To use the script you need Autohotkey installed on your PC. This script was tested with AHK 1.1.28 on Windows 10 (other Windows versions should also work).  
You can download AHK here: https://www.autohotkey.com/  
(easiest option is to pick an .exe installer with recent version)

### run the script
Once you have successfully installed Autohotkey, `.ahk` files can be run by double-clicking on the `.ahk` file in explorer.  

Put these 3 files in some folder together:  

`mouse-scroll-run.ahk`  
`rbutton-block.ahk`   
`mouse-scroll-v02.ahk`   

Then just run the `mouse-scroll-run.ahk`, it will run other two scripts.  
If you want it to run automatically at Windows startup, copy-paste shortcut of the `mouse-scroll-run.ahk` into the "startup" folder.  
To close the app, manually close tray icons of both scripts.

### usage
Press and hold the right mouse button to scroll - faster movement will scroll more.  . 
Right mouse button is chosen for best ergonomics, but this can be changed in the main script file.  
If you need to enable the script only in some app, you might want to add conditional directives to both  scripts, which will exclude specific applications (e.g. directive `#If !winActive("ahk_exe APP_NAME.exe")`).  

Few setup variables are available, see "Settings" section directly in the source code (`mouse-scroll-v02.ahk`).  
Simply edit the variable in the source code and restart it.

To set the scroll speed, edit the line:  
> k := 0.6

To swap the scroll direction: see line  
> swap := true

To set another key for scrolling, see line  
> pan := getkeystate("rbutton", "P")  

(refer to official Autohotkey documentation for the `getkeystate()` function and key names)  

### files description
`mouse-scroll-run.ahk` Run this script to run the other two scripts.  
`mouse-scroll-v02.ahk` Main script. Describes the scrolling logic.  
`rbutton-block.ahk` Prevents the right mouse button system-wide.
