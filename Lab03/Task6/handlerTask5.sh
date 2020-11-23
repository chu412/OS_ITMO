#!/bin/bash

result=1
mode="+"

tail -f pipe |
while true; do
    read line
    case $line in
        "+")
            mode="$line"
            echo "sum mode"
        ;;
        "*")
            mode="$line"
            echo "mult mode"
        ;;
        "QUIT")
            echo "Quit"
            killall tail
            exit 0
        ;;
        [0-9]*)
            case $mode in
            "+")
                result=$(($result + $line))
                echo $result
            ;;
            "*")
                result=$(($result * $line))
                echo $result
            ;;
            esac
        ;;
    *)
        echo "Handler: Error. Wrong argument"
        killall tail
        exit 1
    ;;
    esac
done