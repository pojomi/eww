#!/usr/bin/env bash

while ! eww ping >/dev/null; do
  sleep 1s
done

call_mixer() {
  IFS=" "
  local -a state
  until ((${#state[@]} == 2)); do
    state=($(amixer get Master | tail -n 1 | tr -d '[]%'))
    state=(${state[@]: -2:2})
  done
  echo "${state[@]}"
  unset IFS
}

mixer_state=($(call_mixer))

if [[ ${mixer_state[1]} == "off" ]]; then
  eww u muted=true
elif [[ ${mixer_state[1]} == "on" ]]; then
  eww u muted=false
fi
eww u vol-level=${mixer_state[0]}
echo -e "amixer output values on startup:\nmixer_state: ${mixer_state[1]}\n${mixer_state[0]}" >$HOME/eww-script.log
unset mixer_state
