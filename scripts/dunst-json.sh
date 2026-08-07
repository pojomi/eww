#!/usr/bin/env bash
dunst_json() {
  local js
  js=$(dunstctl history | jq -c '[
    .data[][]
    | select(.urgency.data == "NORMAL")
    | {app: .appname.data, body: .message.data}
  ]')
  eww update dunst-notifs="$js"
}

dunst_json
