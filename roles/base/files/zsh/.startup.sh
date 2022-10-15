#!/bin/bash

# === Setup Environment ===
# load zshrc
source $HOME/.zshrc

# set extra env
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export DISPLAY=:0.0

# === Startup Command ===
# welcome words
MSG=$(cat <<-END
  Time: <b>$(date +"%Y-%m-%d %T")</b>
END
)
notify-send -u normal -t 2000 \
  "hello world" \
  $MSG

# auto hide mouse cursor
unclutter -idle 10 &
notify-send -t 2000 "unclutter" "mouse idle timeout 10 seconds"

# joplin sync
(joplin sync | while read OUTPUT; do notify-send -t 2000 "Joplin" "$OUTPUT"; done) &

# oh-my-zsh update
(omz update > /dev/null && notify-send -t 2000 "omz updated") &

# go app update
(gup update | while read OUTPUT; do notify-send -t 500 "$OUTPUT"; done) &
# gup update > /dev/null && notify-send "gup updated"

# goodby words
notify-send "goodbye wolrd"
