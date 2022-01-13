#!/bin/sh

### org.gnome.desktop


## default-applications

gsettings set org.gnome.desktop.default-applications.terminal exec 'kitty'
gsettings set org.gnome.desktop.default-applications.terminal exec-arg ''

## sound 

gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true

## interface

gsettings set org.gnome.desktop.interface clock-format '12h'
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
gsettings set org.gnome.desktop.interface toolbar-icons-size 'small'

gsettings set org.gnome.desktop.interface font-name 'Noto Sans Regular 9'
gsettings set org.gnome.desktop.interface document-font-name 'Noto Sans Regular 9'
gsettings set org.gnome.desktop.interface monospace-font-name 'Hack Regular 9'
gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'
gsettings set org.gnome.desktop.interface font-hinting 'slight'

gsettings set org.gnome.desktop.interface gtk-theme 'Adapta-Nokto-Eta'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
# edit /etc/dconf/db/gdm.d/10-cursor-settings for GDM 
gsettings set org.gnome.desktop.interface cursor-theme 'Breeze-Obsidian'
gsettings set org.gnome.desktop.interface cursor-size 16

## wm.preferences

gsettings set org.gnome.desktop.wm.preferences theme 'Adapta-Nokto-Eta'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Clear Sans Bold 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-uses-system-font true
gsettings set org.gnome.desktop.wm.preferences audible-bell false


### org.gnome.nautilus

## preferences

gsettings set org.gnome.nautilus.preferences show-delete-permanently true

## icon-view

gsettings set org.gnome.nautilus.icon-view default-zoom-level 'small'

## list-view

gsettings set org.gnome.nautilus.list-view default-zoom-level 'standard'

