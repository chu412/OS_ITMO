@echo off
wmic os get caption, version > version.txt
wmic computersystem get totalphysicalmemory > memory.txt
wmic os get freephysicalmemory >> memory.txt
wmic logicaldisk list brief > disks.txt