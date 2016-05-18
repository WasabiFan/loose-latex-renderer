SelectedEq = ""
^l::
    global SelectedEq
    ClipSaved := ClipboardAll
    
    SendInput, ^c
    ClipWait, 1
    
    Sleep, 50
    
    SelectedEq := Clipboard
    
    RunWait, javaw -cp ./lib/jlatexmath-1.0.4.jar;./bin/ LatexRenderer "%clipboard%"
    SendInput ^v
    
    Sleep, 50
      
    Clipboard := ClipSaved
    ClipSaved =   ; Free the memory in case the clipboard was very large.
Return

^b::
    global SelectedEq
    
    ClipSaved := ClipboardAll
    
    Clipboard := SelectedEq
    Send, ^v
    Sleep, 50
    
    Clipboard := ClipSaved
    ClipSaved =   ; Free the memory in case the clipboard was very large.
Return