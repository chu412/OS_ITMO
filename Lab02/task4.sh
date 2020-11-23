#!/bin/bash
outfile="task4file.txt"
resultString=""
for pid in $(ps a x -o pid); do
#Find PPID
resultPPID=$(grep -s "^pid:" /proc/$PID/status | awk '{print $2}')
#Find ART
tempSum=$(grep -s "sum_exec_runtime" /proc/$PID/sched | awk '{print $3}')
tempSwitches=$(grep -s "nr_switches" /proc/$PID/sched | awk '{print $3}')
if [[ -z $tempSum ]] | [[ -z $tempSwitches ]]; then
continue
fi
ART=$(echo "scale=5; $tempSum/$tempSwitches" | bc)
resultString="$resultString$resultPID $resultPPID $ART\n"
done
printf "$resultString" | sort -nk2 | awk '{print "ProncessID = "$1" : Parent_ProcessID = "$2" : Average_Running_Time = "$3}' > $outFile