sudo cp "$HOME/dot-files/XKB/evdev.xml" "/usr/share/X11/xkb/rules/"
sudo cp "$HOME/dot-files/XKB/jp" "/usr/share/X11/xkb/symbols"
setxkbmap jp
yay -Sy awesome-git rofi-git picom-tryone-git alsa-utils pulseaudio pulseaudio-alsa xprop imagemagick xfce4-power-manager xdg-user-dirs kvantum-qt5-git konsole
ln -sf "$HOME/dot-files/fonts/" "$HOME/.fonts"
ln -sf "$HOME/dot-files/rice/KDE/plasma/look-and-feel/Story" "$HOME/.local/share/plasma/look-and-feel/Story"
ln -sf "$HOME/dot-files/rice/KDE/plasma/desktoptheme/Story" "$HOME/.local/share/plasma/desktoptheme/Story"
ln -sf "$HOME/dot-files/rice/KDE/color-schemes/Story.colors" "$HOME/.local/share/color-schemes"
ln -sf "$HOME/dot-files/rice/KDE/aurorae/Story" "$HOME/.local/share/aurorae/themes/Story"
ln -sf "$HOME/dot-files/rice/linux system/themes/Story" "$HOME/.themes/Story"
ln -sf "$HOME/dot-files/rice/linux system/icons/Story" "$HOME/.icons/Story"
ln -sf "$HOME/dot-files/rice/linux system/icons/blue-oreo" "$HOME/.icons/blue-oreo"
ln -sf "$HOME/dot-files/rice/firefox" "$HOME/.mozilla/firefox/zpba42s9.default/chrome/"
