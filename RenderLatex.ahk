SelectedEq = ""

^l::
    InputBox, latex, Enter LaTeX, , , , 100
    
    RenderLaTeX(latex)
Return

^+l::
    latex := MultiLineInputBox("Enter LaTeX", "", "LaTeX render utility")
    
    RenderLaTeX(latex)
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

RenderLaTeX(latex:="") {
    global SelectedEq
    
    If latex =
        Return
    
    ClipSaved := ClipboardAll
    
    Sleep, 50
    
    SelectedEq = %latex%
    RunWait, javaw -cp ./lib/jlatexmath-1.0.4.jar;./bin/ LatexRenderer "%latex%", , UseErrorLevel
    
    If (ErrorLevel > 0) {
        SendInput, syntax error
        Send {Shift down}
        Loop 12
            Send, {Left}
        
        Send {Shift up}
        
        Return
    }
    
    Sleep, 100
    
    SendInput ^v
    Sleep, 50
    Clipboard := ClipSaved
    ClipSaved =   ; Free the memory in case the clipboard was very large.
}

MultiLineInputBox(Text:="", Defualt:="", Caption:="Multi Line Input Box"){
    static
    ButtonOK:=ButtonCancel:= false
    if !MultiLineInputBoxGui{
        Gui, MultiLineInputBox: add, Text, r1 w600  , % Text
        Gui, MultiLineInputBox: add, Edit, r10 w600 vMultiLineInputBox, % Defualt
        Gui, MultiLineInputBox: add, Button, w60 gMultiLineInputBoxOK , &OK
        Gui, MultiLineInputBox: add, Button, w60 x+10 gMultiLineInputBoxCancel, &Cancel
        MultiLineInputBoxGui := true
    }
    GuiControl,MultiLineInputBox:, MultiLineInputBox, % Defualt
    Gui, MultiLineInputBox: Show,, % Caption
    SendMessage, 0xB1, 0, -1, Edit1, A
    while !(ButtonOK||ButtonCancel)
        continue
    if ButtonCancel
        return
    Gui, MultiLineInputBox: Submit, NoHide
    Gui, MultiLineInputBox: Cancel
    return MultiLineInputBox
    ;----------------------
    MultiLineInputBoxOK:
    ButtonOK:= true
    return
    ;---------------------- 
    MultiLineInputBoxGuiEscape:
    MultiLineInputBoxCancel:
    ButtonCancel:= true
    Gui, MultiLineInputBox: Cancel
    return
}