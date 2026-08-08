pactl list sinks | grep -A 1 -m 1 "$(pactl get-default-sink)" | awk '/Description:/ {$1=""; print}'
