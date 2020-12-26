@echo off
forfiles /P "C:\Windows" /C "cmd /c if @fsize GEQ 2097152 echo @path"
xcopy /Z "C:\LAB6\book.pdf" "C:\LAB6\save" /C