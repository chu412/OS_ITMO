#!/bin/bash
inputFile="task4file.txt"
outputFile="task5file.txt"

prevPPID="0"
ART_sum="0"
COUNT="0"
AVG="0"

echo -e "$(<"$inputFile")\n" | sed "s/[^0-9.]\+/ /g" | sed "s/^ //g" |
while read line
do
    pid_cur=$(awk '{print $1}' <<< $line)
    ppid_cur=$(awk '{print $2}' <<< $line)
    ART=$(awk '{print $3}' <<< $line)
    
    if [[ $ppid_cur == $prevPPID ]]
    then
        ART_sum=$(echo "ART_sum+$ART") | awk '{printf "%f", $0}'
        COUNT=$(($COUNT+1))
    else
        AVG=$(echo "$ART_sum/$COUNT" | awk '{print "%f", $0}')
        echo "Average_Children_Running_Time_of_ParentID="$prevPPID" is "$AVG
        ART_sum=$ART
        COUNT=1
        prevPPID=$ppid_cur
    fi
    
    if [[ ! -z $pid_cur ]]
    then
        echo "ProcessID="$pid_cur" : Parent_ProcessID="$ppid_cur" : Average_Running_Time"=$ART
    fi
    
done > "$outputFile"