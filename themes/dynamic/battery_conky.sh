#!/bin/sh
if [ ! -e /tmp/battery_conky ]; then
	conky -c ~/.config/theme/battery_conky.conf &
	echo $! > /tmp/battery_conky
else
	kill $(cat /tmp/battery_conky)
	rm -f /tmp/battery_conky
fi
