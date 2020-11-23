#!/bin/bash
mkfifo pipe
sh handlerTask5.sh&sh generatorTask5.sh
rm pipe