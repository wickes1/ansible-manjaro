
# === Setup Environment ===
# load zshrc
source $HOME/.zshrc

# set extra env
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export DISPLAY=:0.0

# === Startup Command ===
# welcome words
notify-send 'hello wolrd'

# auto hide mouse cursor
unclutter -idle 10 &

# go app update
gup update

# goodby words
notify-send 'goodbye wolrd'
