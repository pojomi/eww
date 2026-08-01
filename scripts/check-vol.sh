#!/usr/bin/env bash

check_vol() {
  while ! pidof pipewire-pulse >/dev/null; do
    sleep 1s
  done

  IFS=" "
  local state=($(amixer get Master | tail -n 1 | tr -d '[]%'))
  state=("${state[@]: -2:2}")
  unset IFS

  if [[ ${state[1]} == "off" ]]; then
    echo muted
  elif [[ ${state[1]} == "on" ]]; then
    echo on
  fi
  eww u vol-level=${state[0]}
  eww u checking-vol=false
}

check_vol
