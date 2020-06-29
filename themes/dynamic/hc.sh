#!/bin/bash

#load the themes colors
. ~/.config/theme/colors.theme

##############################
#     Herbstluft Settings    #
##############################
# colors
hc set frame_border_active_color $CYAN
hc set frame_border_normal_color $COLOR0
hc set frame_bg_normal_color $COLOR0
hc set frame_bg_active_color $COLOR0
hc set frame_border_width 4
hc set always_show_frame 0
hc set frame_bg_transparent 1
hc set frame_transparent_width 0
hc set frame_gap 80

hc set window_border_normal_color $COLOR0
hc set window_border_active_color $CYAN
hc set window_border_width 3
hc set window_border_inner_width 1
# add overlapping window borders
hc set window_gap -2
hc set frame_padding 3
hc set smart_window_surroundings 1
hc set smart_frame_surroundings 1
hc set mouse_recenter_gap 0


##############################
#            MISC            #
##############################
exec compton --config /home/$USER/.config/compton/compton.conf --paint-on-overlay &
#xsetroot -solid '#586875'
feh --bg-fill ~/.config/theme/background
