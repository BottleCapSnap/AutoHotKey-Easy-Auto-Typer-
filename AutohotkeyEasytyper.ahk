; Set the typing speed (adjust this value as needed)
TypingSpeed := 50

; Function to type text with simulated human-like speed
TypeText(text) {
    Loop, Parse, text, `n
    {
        SendInput, %A_LoopField%
        Sleep, %TypingSpeed%
    }
}

; Function to create an input dialog with a larger text box and type the entered text
InputAndTypeText() {
    ; Create an input dialog with a larger text box
    FileSelectFile, InputFile, 3, , Open a Text File
    if ErrorLevel
    {
        MsgBox, Operation canceled by user.
        return
    }

    FileRead, UserInput, %InputFile%
    
    ; Check if there is text entered
    if (UserInput != "")
    {
        ; Allow 3 seconds for interaction before typing
        Sleep, 3000 ; Adjust the time as needed
        
        ; Simulate typing the entered text
        TypeText(UserInput)
    }
}

; Hotkey to trigger the script with Ctrl+9
^9:: ; Ctrl+9 activates the script
    InputAndTypeText()
return
