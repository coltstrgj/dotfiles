#!/bin/bash
. ~/.config/theme/colors.theme

monitor=${1:-0}
geometry=( $(herbstclient monitor_rect "$monitor") )
style_gap=40
x=${geometry[0]}
y=${geometry[1]}
panel_width=${geometry[2]}
panel_sep=$(expr $panel_width / 2)
panel_height=36
herbstclient pad $monitor $(($style_gap + 2* $panel_height)) $style_gap $style_gap $style_gap
herbstclient emit_hook quit_panel

font='-*-terminus-*-r-normal-*-*-110-*-*-*-*-iso8859-*'
dzen_fg=$COLOR1
dzen_bg=$COLOR0
normal_fg=""
normal_bg=
viewed_fg=$COLOR1
viewed_bg=$CYAN
other_fg=$ORANGE
other_bg=
urgent_fg=
urgent_bg=$ORANGE
used_fg=$COLOR2
used_bg=

herbstclient --idle 2>/dev/null | {
tags=( $(herbstclient tag_status) )
windowtitle=""
while true; do
	for tag in "${tags[@]}" ; do
		case ${tag:0:1} in
			'-') cstart="^fg($other_fg)^bg($other_bg)" ;;
			'#') cstart="^fg($viewed_fg)^bg($viewed_bg)" ;;
			'+') cstart="^fg($viewed_fg)^bg($viewed_bg)" ;;
			':') cstart="^fg($used_fg)^bg($used_bg)"     ;;
			'!') cstart="^fg($urgent_fg)^bg($urgent_bg)" ;;
			*)   cstart=''                               ;;
		esac
		dzenstring="${cstart}^ca(1,herbstclient use ${tag:1}) ${tag:1} "
		dzenstring+="^ca()^fg()^bg()"
		echo -n "$dzenstring"
	done
	echo "^fg($CYAN)| $windowtitle"

	# Update tags and title
	read line || exit
	hook=( $line )
	case "${hook[0]}" in
		tag*) tags=( $(herbstclient tag_status) ) ;;
		quit_panel*) exit ;;
		focus_changed|window_title_changed)
			windowtitle="^fg($COLOR2)^bg($used_bg)${hook[@]:2}^fg()^bg()"
			;;
	esac
done
} | dzen2 -h $panel_height -fn "$font" -ta l -sa l \
	-x $(expr $x + $style_gap / 2) -y $(expr $y + $style_gap / 2) -w $(($panel_sep - $style_gap / 2))\
	-fg "$dzen_fg" -bg "$dzen_bg" &
pids+=($!)

conky_flags=
if [ -e ~/.config/theme/conky.conf ];then
	conky_flags="-c /home/$USER/.config/theme/conky.conf"
fi

#Second part of the panel
conky $conky_flags |  dzen2 -fn "$font" -ta r -sa l \
	-h $panel_height -x $(expr $x + $panel_sep) -y $(expr $y + $style_gap / 2) -w $(($panel_sep - $style_gap )) \
	-fg "$COLOR2" -bg "$dzen_bg" &
pids+=($!)

herbstclient --wait '^(quit_panel|reload).*'
kill -TERM "${pids[@]}" >/dev/null 2>&1
exit 0
