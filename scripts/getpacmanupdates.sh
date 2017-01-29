#!/bin/sh

result=' '
result+=$(checkupdates | wc -l)
echo $result
