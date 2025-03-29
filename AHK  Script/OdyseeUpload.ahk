;********************        ONLY tested on Brave 

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Pixel

; Change this to your target folder containing yout MP4's
FolderPath := "d:\!upload"  

; Video description text
Description := "In here`n<- guess what that does, newline"

; Video tags text
Tags := "tags"

; Slowing down keyboard stroke input
SetKeyDelay, 350

Esc::ExitApp

; if you press right alt and 0 
<^>!0::
  ; clear the filelist varriable
    FileList := ""

  ; scan the folder and repeat this for every file found
    Loop, Files, %FolderPath%\*.mp4, F
    {
		; Open Odysee upload page
        Run, https://odysee.com/$/upload
		;wait for it to load the browser, 5 secs
		Sleep, 5000

		;press upload button
		Send {Space}
		Sleep, 3000
		
		;paste in filename, move the variable contents to clipboard
		Clipboard := A_LoopFileFullPath
		Send ^v
		Send {Enter}
		Sleep, 5000
		
		Send {Tab}
		Send ^c
		Clipboard := RegExReplace(Clipboard, "[\(\)]", "")
		Send ^v
		; move to description box
		sleep 1000		
		Send {Tab}
		
		;paste desc
		Clipboard := Description
		Send ^v
		
		;move to upload thumb snap 		from video
		Send {Tab 4}
        Send {Space}
		
		;upload frame from video
		Send {Tab 8}
		Send {Enter}	 		
		Sleep, 6000
		
		; move to tags
		Send {Tab 46}
		Clipboard :=  Tags
		Send ^v
		Send {Enter}
	Sleep, 3000
	
	;move to upload
	Send {Tab 10}
	  Send {Space}
	 Sleep, 5000 
	  
        ; Display each file one by one as a  test
     ;   MsgBox, Found MP4 file:`n%A_LoopFileFullPath%
        ; Wait for the user to close the message box before continuing
      ;  Sleep, 500  ; Optional: Adds a small delay before showing the next file
    }

    ; If no files are found, show a message
    if (A_Index = 1)
    {
        MsgBox, No MP4 files found man, their all gone.
    }
return
