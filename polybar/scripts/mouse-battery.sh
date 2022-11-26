#!/usr/bin/env bash

level=$(rivalcfg --battery-level | sed -n -e 's/^.*] //p' | sed 's/ //g')
bad='630%'

if [[ "$level" == *"$bad"* ]]; then
  echo " DOWN"
else
  echo " $level"
fi
