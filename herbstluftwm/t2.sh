#!/bin/sh

mon=$(herbstclient list_monitors | grep -e "FOCUS" | cut -d: -f1)
herbstclient use  $mon$1

