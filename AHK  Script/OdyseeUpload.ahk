#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Pixel

FolderPath := "folder path"  ; Change this to your target folder

Esc::ExitApp

; time 5 - 1
<^>!0::
  ; clear the filelist varriable
    FileList := ""
  ; scan the folder and repeat this for every file found
    Loop, Files, %FolderPath%\*.mp4, F
    {
        ; Display each file one by one as a  test 
        MsgBox, Found MP4 file:`n%A_LoopFileFullPath%
        ; Wait for the user to close the message box before continuing
        Sleep, 500  ; Optional: Adds a small delay before showing the next file
    }

    ; If no files are found, show a message
    if (A_Index = 1)
    {
        MsgBox, No MP4 files found man, their all gone.
    }
return
