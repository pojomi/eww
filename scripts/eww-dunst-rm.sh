#!/usr/bin/env bash

dunstctl history-rm "$1"
$HOME/.config/eww/scripts/eww-dunst-json.sh
