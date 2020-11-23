#!/bin/bash
sh cycleForTask4.sh&pid1=$!
sh cycleForTask4.sh&pid2=$!
sh cycleForTask4.sh&pid3=$!
renice +10 -p $pid1
kill $pid1
kill $pid2
kill $pid3