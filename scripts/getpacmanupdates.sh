#! /bin/bash

result=" "
result+=$(checkupdates | wc -l)
echo $result
