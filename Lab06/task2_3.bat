@echo off
schtasks /Create /SC MINUTE /TN Task2.2 /TR task2_2.bat
