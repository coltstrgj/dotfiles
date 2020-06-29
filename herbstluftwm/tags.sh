#!/bin/sh
hc() {
	herbstclient "$@"
}

activemonitor() {
	echo $( hc list_monitors | grep FOCUS | cut -d ':' -f 1 )
}
#hc keybind "$Mod-$key" use_index "$i"


# tags
#tag_names=( {1..9} )
#tag_keys=( {1..9} 0 )

#hc rename default "${tag_names[0]}" || true
for i in $( seq 1 9 ) ; do
	#hc add "${tag_names[$i]}"
	key="$i"
	hc keybind "Mod1-$key" spawn "herbstclient use \"$(activemonitor)$key\""
	#hc keybind "$Mod-$key" use_index "$i"
	hc keybind "Mod1-Shift-$key" spawn "herbstclient move \"$(activemonitor)$i\""
done


## tags
#mon1_names=( 1_{1..5} ) # tag names for monitor 1
#mon2_names=( 2_{1..5} ) # tag names for monitor 2
#fallback_names=( {1..5} ) # tag names for all other monitors
#tag_keys=( {1..9} 0 )

#hc rename default "${mon1_names[0]}" || true
#for tag in "${mon1_names[@]}" "${mon2_names[@]}" "${fallback_names[@]}" ; do
#	hc try silent add "$tag"
#done

#for i in ${!tag_keys[@]} ; do
#	key="${tag_keys[$i]}"
#	# they kebinding is as follows: the or executes the commands seperated by
#	# CASE and stops executing them after the first of those succeeds.
#	# the first command is: check that we are on monitor 3 and can switch to tag "${mon1_names[$i]}"
#	# if only one of these to steps fail, try the second one (and so one).
#	# The setup for two monitors is as follows:
#	hc keybind "$Mod-$key" \
#		or CASE and . compare monitors.focus.index = 0 . use "${mon1_names[$i]}" \
#		   CASE and . compare monitors.focus.index = 1 . use "${mon2_names[$i]}" \
#		   CASE use "${fallback_names[$i]}"
#	hc keybind "$Mod-Shift-$key" \
#		or CASE and . compare monitors.focus.index = 0 . move "${mon1_names[$i]}" \
#		   CASE and . compare monitors.focus.index = 1 . move "${mon2_names[$i]}" \
#		   CASE move "${fallback_names[$i]}"
#done

## cycle through tags
## add additional information in order to cycle only through a monitor's tags
## and not through all tags
#define-tag-cycle() {
#	local n=$#
#	local tags=( "$@" )
#	for i in "${!tags[@]}" ; do
#		local t="${tags[$i]}"
#		hc chain , new_attr string tags.by-name."$t".my_previous_tag \
#				 , set_attr tags.by-name."$t".my_previous_tag "${tags[$(((i - 1 + n) % n))]}" \
#				 , new_attr string tags.by-name."$t".my_next_tag \
#				 , set_attr tags.by-name."$t".my_next_tag "${tags[$(((i + 1) % n))]}"
#	done
#}

#define-tag-cycle "${mon1_names[@]}"
#define-tag-cycle "${mon2_names[@]}"
#define-tag-cycle "${fallback_names[@]}"

## cycle through tags
## check whether the current tag as a custom "next tag" configured
## if yes, jump to that one, otherwise fall back to ordinary use_index +1
#hc keybind $Mod-period or , substitute NEXT tags.focus.my_next_tag use NEXT  \
#						  , use_index +1 --skip-visible
#hc keybind $Mod-comma  or , substitute PREV tags.focus.my_previous_tag use PREV  \
#						  , use_index +1 --skip-visible
