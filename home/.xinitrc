#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

openbox-session
