#!/usr/bin/env bash

kitty --title "pack updates" /usr/bin/env sh -c \
  'paru -Syu && echo Done && read && eww poll check-packages'
