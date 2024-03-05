
cp "$HOME/dot-files/doas/doas.conf" "/etc/doas.conf"

yay -Y --builddir /Archive/arch-pkg/yay --save
yay -Sy doas hyprland-git waybar-hyprland-git dunst-git swaybg-git swaylock-effects-git swayidle-git rofi-git qt5ct xdg-user-dirs kvantum-qt5-git ckb-next-git fontforge rawtherapee inkscape baobab isousb czkawka-gui czkawka-cli easyeffects piper-git yt-dlp partitionmanager

# yay -Sy awesome-git picom-tryone-git

doas mkdir /Archive
doas mkdir /Tera

# doas cp "$HOME/dot-files/X/00-mouse.conf" "/etc/X11/xorg.conf.d"
doas cp "$HOME/dot-files/X/no" "/usr/share/X11/xkb/symbols"
hyprctl reload
# setxkbmap no

# ln -sf "$HOME/dot-files/rice/awesomewm" "$HOME/.config/awesome"
# ln -sf "$HOME/dot-files/fonts/" "$HOME/.fonts"
# ln -sf "$HOME/dot-files/rice/KDE/plasma/desktoptheme/Reverence" "$HOME/.local/share/plasma/desktoptheme/Reverence"
# ln -sf "$HOME/dot-files/rice/KDE/color-schemes/Reverence.colors" "$HOME/.local/share/color-schemes"
# ln -sf "$HOME/dot-files/rice/KDE/aurorae/Reverence" "$HOME/.local/share/aurorae/themes/Reverence"
# ln -sf "$HOME/dot-files/rice/GTK/Reverence" "$HOME/.themes/Reverence"
# ln -sf "$HOME/dot-files/rice/icons/Reverence" "$HOME/.icons/Reverence"
# ln -sf "$HOME/dot-files/rice/Kvantum/" "$HOME/.config/Kvantum"
