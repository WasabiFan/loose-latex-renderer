SelectedEq = ""

^l::
    global SelectedEq
    ClipSaved := ClipboardAll
    
    InputBox, latex, Enter LaTeX
    Sleep, 50
    
    SelectedEq = %latex%
    RunWait, javaw -cp ./lib/jlatexmath-1.0.4.jar;./bin/ LatexRenderer %latex%
    Sleep, 100
    
    SendInput ^v
    Sleep, 50
    Clipboard := ClipSaved
    ClipSaved =   ; Free the memory in case the clipboard was very large.
Return

^k::
    global SelectedEq
    
    ClipSaved := ClipboardAll
    
    Clipboard := SelectedEq
    Send, ^v
    Sleep, 50
    
    Clipboard := ClipSaved
    ClipSaved =   ; Free the memory in case the clipboard was very large.
Return