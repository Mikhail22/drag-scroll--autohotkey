# Autohotkey - Mouse scroll
This Autohotkey (short: AHK) script provides system-wide mouse scrolling functionality.  
By using this script you don't have to use the mouse wheel for scrolling anymore. Instead, it uses mouse vertical movement for scrolling, which turns out to be much more efficient and it also significantly reduces stress on the operator's hand.  
Scrolling speed is optimized for most comfortable usage with Firefox with smooth scrolling enabled, but of course it can be modified further.  
**Important**: For smoother scrolling set the scroll step to **"1"** in windows mouse properties:  
<img src="https://github.com/Mikhail22/Autohotkey/blob/master/img/wheel.png">  
Note: The script will block the Rbutton function (e.g. Context menu) system-wide. To invoke the context menu - use double-RightClick, or Shift-RightClick or Ctrl-RightClick.  If you still need Rbutton in some apps, you might want to add conditional directives to both  scripts, which will exclude specific applications (e.g. directive `#If !winActive("ahk_exe SOME_APP.exe")`).  

### installation
To use the script you need AHK on your computer. This script was tested with AHK 1.1.28 on Windows 10 (other Windows versions should also work).  
You can download AHK here: https://www.autohotkey.com/download/1.1/  
(easiest option is to pick an .exe installer with recent version)
Check out official website for more information: https://www.autohotkey.com/

### run the script
Once you have successfully installed Autohotkey, you can run scripts by double-clicking on the `.ahk` files in explorer. Put all 3 files in some folder and run `mouse-scroll-run.ahk`.
This will automatically run two AHK scripts (2 threads are needed for stable functionality).

### usage
Press and hold the right mouse button to scroll - faster movement will scroll more.  
The script will block the Rbutton system-wide. To invoke the context menu - just use Shift-RightClick or Ctrl-RightClick.  
Right mouse button is chosen for best ergonomics, but this can be changed in the main script file.  

Some setup variables are available, see "Settings" section directly in the source code (mouse-scroll-v02.ahk).  
Simply edit the variable in the source code and restart it.

To set the scroll speed, edit the line:  
> k := 0.6

To set the double-RightClick threshold in milliseconds, edit the line:  
> T := 300

To swap the scroll direction: see line  
> swap := true

To set another key for scrolling, see line  
> pan := getkeystate("rbutton", "P")  

(refer to official Autohotkey documentation for the `getkeystate()` function and key names)  

### files description
`mouse-scroll-run.ahk` Run this script to run the other two scripts.  
`mouse-scroll-v02.ahk` Main script. Describes the scrolling logic.  
`rbutton-block.ahk` Prevents the right mouse button system-wide.
