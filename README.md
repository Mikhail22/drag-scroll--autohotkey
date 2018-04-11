# Autohotkey scripts
My AHK scripts. AHK version 1.1.28
### ` mousepan-v02.ahk `
This script provides a system-wide mouse scrolling functionality.  
Hold the right mouse button to scroll - more movements will scroll faster.  

For smoother scrolling experience set the scroll step to **"1"** in mouse properties:  
<img src="https://github.com/Mikhail22/Autohotkey/blob/master/img/wheel.png">  

Note: to prevent the context menu popup, first run another AHK script "rbutton-block.ahk" -  
you must run it BEFORE you start the "mousepan-v02.ahk" script to make it work.  
This will block the Rbutton system-wide.  
To invoke the context menu - just use Shift- or Ctrl-rightclick.  
To bind another key - edit the script (see comments in file)  

### ` rbutton-block.ahk `
Prevents the right mouse button system-wide.
