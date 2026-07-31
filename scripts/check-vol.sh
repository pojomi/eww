#!/usr/bin/env bash

if $(amixer get Master | grep -q '\[off\]'); then
  echo muted
else
  false
fi

eww u vol-level=$(amixer sget Master | awk -F"[][]" '/Left:/ { gsub(/%/, ""); print $2 }')
eww u checking-vol=false
