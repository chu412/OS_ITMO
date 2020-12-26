@echo off
sc queryex type=service state=all >service.txt
net stop spooler
timeout /t 10
sc queryex type=service state=all >serviceNew.txt
call C:\LAB6\task3_3.bat
net start spooler
