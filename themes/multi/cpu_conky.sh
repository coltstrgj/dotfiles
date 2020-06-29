#!/bin/sh
if [ ! -e /tmp/cpu_conky ]; then
	conky -c ~/.config/theme/cpu_conky.conf &
	echo $! > /tmp/cpu_conky
else
	kill $(cat /tmp/cpu_conky)
	rm -f /tmp/cpu_conky
fi
