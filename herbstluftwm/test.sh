#!/bin/sh

tag=$(herbstclient list_monitors | grep "$1:" | grep -o "\"[0-9]*\"" | grep -o "[0-9]*")

herbstclient move $tag 

mon=$(herbstclient list_monitors | grep -e "\"$tag\"" | cut -d: -f1)
herbstclient focus_monitor $mon
