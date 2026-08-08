#!/usr/bin/env bash
dunst_json() {
  local js
  js=$(dunstctl history | jq -c '[
    .data[][]
    | select(.urgency.data == "NORMAL")
    | {app: .appname.data, body: (.message.data|gsub("<[^>]*>"; "")), id: .id.data}
  ]')
  eww u dunst-notifs="$js"
  eww u dunst-open=true
  eww u have-notifications=false
  eww open dunst
}

dunst_json
