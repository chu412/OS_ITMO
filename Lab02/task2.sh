#!/bin/bash
outFile="task2file.txt"
ps ax | grep "/sbin/" | awk '{print $1}' > $outFile