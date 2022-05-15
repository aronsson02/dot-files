doas cp "$HOME/dot-files/X/evdev.xml" "/usr/share/X11/xkb/rules/"
doas cp "$HOME/dot-files/X/jp" "/usr/share/X11/xkb/symbols"
setxkbmap jp
yay -Sy awesome-git rofi-git picom-tryone-git alsa-utils pulseaudio pulseaudio-alsa xprop imagemagick xfce4-power-manager xdg-user-dirs kvantum-qt5-git konsole xorg-xinput
if test -e "$HOME/.config/awesome"; then
    rm -Rv "$HOME/.config/awesome" && ln -sf "$HOME/dot-files/rice/awesomewm" "$HOME/.config/awesome"
    else
    ln -sf "$HOME/dot-files/rice/awesomewm" "$HOME/.config/awesome"
fi
if test -e "$HOME/.fonts"; then
    rm -Rv "$HOME/.fonts" && ln -sf "$HOME/dot-files/fonts/" "$HOME/.fonts"
    else
    ln -sf "$HOME/dot-files/fonts/" "$HOME/.fonts"
fi
if test -e "$HOME/.local/share/plasma/look-and-feel/Story"; then
    rm -Rv "$HOME/.local/share/plasma/look-and-feel/Story" && ln -sf "$HOME/dot-files/rice/KDE/plasma/look-and-feel/Story" "$HOME/.local/share/plasma/look-and-feel/Story"
    else
    ln -sf "$HOME/dot-files/rice/KDE/plasma/look-and-feel/Story" "$HOME/.local/share/plasma/look-and-feel/Story"
fi
if test -e "$HOME/.local/share/plasma/desktoptheme/Story"; then
    rm -Rv "$HOME/.local/share/plasma/desktoptheme/Story" && ln -sf "$HOME/dot-files/rice/KDE/plasma/desktoptheme/Story" "$HOME/.local/share/plasma/desktoptheme/Story"
    else
    ln -sf "$HOME/dot-files/rice/KDE/plasma/desktoptheme/Story" "$HOME/.local/share/plasma/desktoptheme/Story"
fi
if test -e "$HOME/.local/share/color-schemes"; then
    rm -Rv "$HOME/.local/share/color-schemes" && ln -sf "$HOME/dot-files/rice/KDE/color-schemes/Story.colors" "$HOME/.local/share/color-schemes"
    else
    ln -sf "$HOME/dot-files/rice/KDE/color-schemes/Story.colors" "$HOME/.local/share/color-schemes"
fi
if test -e "$HOME/.local/share/aurorae/themes/Story"; then
    rm -Rv "$HOME/.local/share/aurorae/themes/Story" && ln -sf "$HOME/dot-files/rice/KDE/aurorae/Story" "$HOME/.local/share/aurorae/themes/Story"
    else
    ln -sf "$HOME/dot-files/rice/KDE/aurorae/Story" "$HOME/.local/share/aurorae/themes/Story"
fi
if test -e "$HOME/.themes/Story"; then
    rm -Rv "$HOME/.themes/Story" && ln -sf "$HOME/dot-files/rice/linux system/themes/Story" "$HOME/.themes/Story"
    else
    ln -sf "$HOME/dot-files/rice/linux system/themes/Story" "$HOME/.themes/Story"
fi
if test -e "$HOME/.icons/Story"; then
    rm -Rv "$HOME/.icons/Story" && ln -sf "$HOME/dot-files/rice/linux system/icons/Story" "$HOME/.icons/Story"
    else
    ln -sf "$HOME/dot-files/rice/linux system/icons/Story" "$HOME/.icons/Story"
fi
if test -e "$HOME/.icons/blue-oreo"; then
    rm -Rv "$HOME/.icons/blue-oreo" && ln -sf "$HOME/dot-files/rice/linux system/icons/blue-oreo" "$HOME/.icons/blue-oreo"
    else
    ln -sf "$HOME/dot-files/rice/linux system/icons/blue-oreo" "$HOME/.icons/blue-oreo"
fi
if test -e "$HOME/.config/Kvantum"; then
    rm -Rv "$HOME/.config/Kvantum" && ln -sf "$HOME/dot-files/rice/Kvantum/" "$HOME/.config/Kvantum"
    else
    ln -sf "$HOME/dot-files/rice/Kvantum/" "$HOME/.config/Kvantum"
fi
