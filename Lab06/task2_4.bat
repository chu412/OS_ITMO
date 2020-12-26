@echo off
schtasks /Query /TN "Task2.2" >NUL 2>&1 && SCHTASKS /Delete /TN "Task2.2" /F