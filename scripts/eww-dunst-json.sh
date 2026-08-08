#!/usr/bin/env bash
dunst_json() {
  local js
  js=$(dunstctl history | jq -c '[
    .data[][]
    | {app: .appname.data, body: (.message.data|gsub("<[^>]*>"; "")), id: .id.data, count: ([.appname,.message]|length-1)}
    ]')
  eww u dunst="$js"
  eww u dunst.is_open=true
  eww u dunst.has_notifications=false
  eww u bell=""
  eww open dunst-win
}

dunst_json
