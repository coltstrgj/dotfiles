# Themes

These are themes. They are deisgned to work with my HerbstluftWM settings. I have included an example theme (solarized) for if anybody manages to find this before I have something actually good. 

## Instructions

### Create a theme

copy the solarized folder. You can modify the colors.theme, panel.sh, hc.sh (herbstclient settings.sh was too long for me to type all the time), conky.conf files to your liking. 

If you do not provide one of these files(other than colors), the defaults will be used instead. you can modify the defaults in the following locations:

1. hc.sh: in herbstluftwm/autostart near the bottom
2. panel.sh: in herbstluftwm/panel.sh
3. conky.conf: conky/conky.conf
4. colors.theme this file MUST be provided. Otherwise things will break.

### Use a theme

In order to use a theme, my HLWM files will look in  "~/.config/theme/" for the files. I usually just do the following so that any changes I make to my theme are updated in my WM and my tracked files for git.

	ln -s /home/$USER/.config/themes/<theme name> /home/$USER/.config/theme/

