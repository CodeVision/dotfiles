#!/bin/zsh

userresources=$HOME/.config/X/Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?* ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# remap caps lock to ctrl
setxkbmap -option ctrl:nocaps
setxkbmap -option compose:menu

if [ -f /usr/bin/VBoxClient-all ]; then
  /usr/bin/VBoxClient-all
fi

if [ -f $HOME/.config/X/xinit-$(hostname) ]; then
  /$HOME/.config/X/xinit-$(hostname)
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

i3_log_dir=~/.local/share/i3
[ ! -d "$i3_log_dir" ] && mkdir -p "$i3_log_dir"
exec i3 -V >> "$i3_log_dir/log-$(date +'%F')" 2>&1
