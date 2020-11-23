#!/bin/bash
ps -u user | wc -l > task1file.txt
ps -u user | awk '{print($1 ":" $4)}' >> task1file.txt