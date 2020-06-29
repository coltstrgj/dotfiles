#!/bin/bash

#remove all existing keybindings
herbstclient keyunbind --all

# keybindings
# if you have a super key you will be much happier with Mod set to Mod4
Mod=Mod1    # Use alt as the main modifier
#Mod=Mod4   # Use the super key as the main modifier

herbstclient keybind $Mod-Shift-q quit
herbstclient keybind $Mod-Shift-r reload
herbstclient keybind $Mod-Shift-c close
herbstclient keybind $Mod-Return spawn xfce4-terminal
herbstclient keybind $Mod-Escape spawn slock
# basic movement
# focusing clients
herbstclient keybind $Mod-Left  focus left
herbstclient keybind $Mod-Down  focus down
herbstclient keybind $Mod-Up    focus up
herbstclient keybind $Mod-Right focus right
herbstclient keybind $Mod-h     focus left
herbstclient keybind $Mod-j     focus down
herbstclient keybind $Mod-k     focus up
herbstclient keybind $Mod-l     focus right

# moving clients
herbstclient keybind $Mod-Shift-Left  shift left
herbstclient keybind $Mod-Shift-Down  shift down
herbstclient keybind $Mod-Shift-Up    shift up
herbstclient keybind $Mod-Shift-Right shift right
herbstclient keybind $Mod-Shift-h     shift left
herbstclient keybind $Mod-Shift-j     shift down
herbstclient keybind $Mod-Shift-k     shift up
herbstclient keybind $Mod-Shift-l     shift right

# splitting frames
# create an empty frame at the specified direction
herbstclient keybind $Mod-u       split   bottom  0.5
herbstclient keybind $Mod-o       split   right   0.5
# let the current frame explode into subframes
herbstclient keybind $Mod-Control-space split explode

# resizing frames
resizestep=0.05 # Move to theme dir
herbstclient keybind $Mod-Control-h       resize left +$resizestep
herbstclient keybind $Mod-Control-j       resize down +$resizestep
herbstclient keybind $Mod-Control-k       resize up +$resizestep
herbstclient keybind $Mod-Control-l       resize right +$resizestep
herbstclient keybind $Mod-Control-Left    resize left +$resizestep
herbstclient keybind $Mod-Control-Down    resize down +$resizestep
herbstclient keybind $Mod-Control-Up      resize up +$resizestep
herbstclient keybind $Mod-Control-Right   resize right +$resizestep

# cycle through tags
herbstclient keybind $Mod-period use_index +1 --skip-visible
herbstclient keybind $Mod-comma  use_index -1 --skip-visible

# layouting
herbstclient keybind $Mod-r remove
herbstclient keybind $Mod-space cycle_layout 1
herbstclient keybind $Mod-s floating toggle
herbstclient keybind $Mod-f fullscreen toggle
herbstclient keybind $Mod-p pseudotile toggle

# mouse
herbstclient mouseunbind --all
herbstclient mousebind $Mod-Button1 move
herbstclient mousebind $Mod-Button2 zoom
herbstclient mousebind $Mod-Button3 resize

# focus
herbstclient keybind $Mod-BackSpace   cycle_monitor
herbstclient keybind $Mod-Tab         cycle_all +1
herbstclient keybind $Mod-Shift-Tab   cycle_all -1
herbstclient keybind $Mod-c cycle
herbstclient keybind $Mod-i jumpto urgent

# dmenu # move sizing to theme
herbstclient keybind $Mod-Control-f spawn dmenu_run  -fn '-*-terminus-*-r-normal-*-*-128-*-*-*-*-iso8859-*' -nb '#002B36' -nf '#839496' -sb '#2AA198' -sf '#002b36'

# media keys and similar
#herbstclient keybind XF86AudioPlay 
#herbstclient keybind XF86AudioNext 
#herbstclient keybind XF86AudioPrev 
#herbstclient keybind XF86AudioStop
herbstclient keybind XF86AudioRaiseVolume spawn amixer -D pulse sset Master 5%+
herbstclient keybind XF86AudioLowerVolume spawn amixer -D pulse sset Master 5%-
herbstclient keybind XF86AudioMute spawn amixer -D pulse sset Master toggle
herbstclient keybind XF86MonBrightnessUp spawn xbacklight +10 #/usr/bin/brightness.sh 100
herbstclient keybind XF86MonBrightnessDown spawn xbacklight -10 #/usr/bin/brightness.sh -100
