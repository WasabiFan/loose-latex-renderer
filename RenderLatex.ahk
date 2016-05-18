^l::
    ; Uncomment extra lines to enable clipboard save/restore. This may cause issues with some client software.
    ; ClipSaved := ClipboardAll
    SendInput, ^c
    ClipWait, 1
    
    Sleep, 50
    
    RunWait, javaw -cp ./lib/jlatexmath-1.0.4.jar;./bin/ LatexRenderer "%clipboard%"
    SendInput ^v
    
    ; Sleep, 100    
    ; Clipboard := ClipSaved
    ; ClipSaved =   ; Free the memory in case the clipboard was very large.
Return