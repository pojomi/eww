#!/usr/bin/env bash

if (($# == 1)); then
  dunstctl history-rm "$1"
else
  dunstctl history-clear
fi
$HOME/.config/eww/scripts/eww-dunst-json.sh
