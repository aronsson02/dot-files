yay -Sy doas awesome-git rofi-git picom-tryone-git qt5ct xdg-user-dirs kvantum-qt5-git xorg-xinput ckb-next-git fontforge ktorrent gparted rawtherapee wine wine-mono wine-gecko inkscape-git whatsapp-for-linux baobab isousb czkawka-gui czkawka-cli easyeffects

doas mkdir /Archive
doas mkdir /Anime

doas cp "$HOME/dot-files/X/00-mouse.conf" "/etc/X11/xorg.conf.d"
doas cp "$HOME/dot-files/X/no" "/usr/share/X11/xkb/symbols"
setxkbmap no

ln -sf "$HOME/dot-files/rice/awesomewm" "$HOME/.config/awesome"
ln -sf "$HOME/dot-files/fonts/" "$HOME/.fonts"
ln -sf "$HOME/dot-files/rice/KDE/plasma/desktoptheme/Reverence" "$HOME/.local/share/plasma/desktoptheme/Reverence"
ln -sf "$HOME/dot-files/rice/KDE/color-schemes/Reverence.colors" "$HOME/.local/share/color-schemes"
ln -sf "$HOME/dot-files/rice/KDE/aurorae/Reverence" "$HOME/.local/share/aurorae/themes/Reverence"
ln -sf "$HOME/dot-files/rice/GTK/Reverence" "$HOME/.themes/Reverence"
ln -sf "$HOME/dot-files/rice/icons/Reverence" "$HOME/.icons/Reverence"
ln -sf "$HOME/dot-files/rice/Kvantum/" "$HOME/.config/Kvantum"
