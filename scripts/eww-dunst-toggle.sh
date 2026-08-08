#!/usr/bin/bash
eww_check_toggle_dunst() {
  local win_state="$(eww get dunst.is_open)"
  if [[ $win_state == "false" ]]; then
    $HOME/.config/eww/scripts/eww-dunst-json.sh
  elif [[ $win_state == "true" ]]; then
    eww u dunst.is_open=false
    eww close dunst-win
  fi
}

eww_check_toggle_dunst
