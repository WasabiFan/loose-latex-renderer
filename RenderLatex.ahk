^l::
    ClipSaved := ClipboardAll
    SendInput, ^c
    ClipWait, 1
    
    RunWait, javaw -cp ./lib/jlatexmath-1.0.4.jar;./bin/ LatexRenderer "%clipboard%"
    SendInput ^v
    Sleep, 100
    
    Clipboard := ClipSaved
    ClipSaved =   ; Free the memory in case the clipboard was very large.
Return