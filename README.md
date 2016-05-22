# Loose LaTeX renderer

This is a relatively simple AutoHotkey script and accompanying Eclipse Java project that lets you render LaTeX snippets on-the-fly and insert the generated visuals into almost any app that supports images.

## Prerequisites for building/running
Currently, the script is set up for quick development and iteration. As a result, one must be able to manually compile the Java portion of the app to be able to run it.
- Eclipse or ability to manually compile Java
- Java Runtime Environment
- AutoHotkey

## Building and running
1. Build the Java source files (to produce `.class` files)
  - If you have Eclipse installed, simply open the Eclipse project that is at the root of the repository.
  - Otherwise, you can use `javac` on the command line to build the files. You'll have to figure this out on your own; just make sure that you end up with class files in a `bin/` directory.
2. Launch the `RenderLatex.ahk` file from Windows Explorer

## Usage
Keystroke | Action
--------- | ------
<kbd>Ctrl</kbd>+<kbd>L</kbd> | Opens a single-line input window and focuses in the text box. When the window is dismissed, content entered into the box is rendered as LaTeX and pasted at your cursor's location.
<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>L</kbd> | The same as <kbd>Ctrl</kbd>+<kbd>L</kbd>, but allows for multi-line entry at the expense of dismissal with the <kbd>Enter</kbd> key.
<kbd>Ctrl</kbd>+<kbd>K</kbd> | Pastes the last-entered raw LaTeX string.

![Demo gif](https://github.com/WasabiFan/loose-latex-renderer/wiki/LaTeX%20Demo.gif)
