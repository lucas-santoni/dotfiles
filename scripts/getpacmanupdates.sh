#!/bin/sh

result=' '
result+=$(pacman -Qu | wc -l)
echo $result
