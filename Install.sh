sudo cp "/home/yami/Documents/фэлш/evdev.xml" "/usr/share/X11/xkb/rules/"
sudo cp "/home/yami/Documents/фэлш/jp" "/usr/share/X11/xkb/symbols"
setxkbmap jp
sudo mkdir /Archive
sudo mkdir /Anime
sudo mkdir /Storage
sudo ln -sf "/home/yami/Documents/фэлш/Themes/faev kde splash" "/home/yami/.local/share/plasma/look-and-feel/faev"
sudo ln -sf "/home/yami/Documents/фэлш/Themes/faev plasma" "/home/yami/.local/share/plasma/desktoptheme/faev"
sudo ln -sf "/home/yami/Documents/фэлш/Themes/faev plasma/ðэв литэв.colors" "/home/yami/.local/share/color-schemes"
sudo ln -sf "/home/yami/Documents/фэлш/Themes/faev kde" "/home/yami/.local/share/aurorae/themes/faev"
sudo ln -sf "/home/yami/Documents/фэлш/Themes/faev" "/usr/share/themes/faev"
sudo ln -sf "/home/yami/Documents/фэлш/Themes/faev IC" "/usr/share/icons/faev"
sudo ln -sf "/home/yami/Documents/фэлш/FFchrome" "/home/yami/.mozilla/firefox/zpba42s9.default/chrome/"
sudo pacman -Sy jack qjackctl pulseaudio-jack pulseeffects pulseaudio-qt yoshimi fontforge ktorrent gparted virt-manager qemu rawtherapee wine wine-mono wine-gecko winetricks opencl-mesa otf-ipafont
yay -Sy fontpreview ckb-next minecraft-launcher-beta qemu-spice stress-ng youtube-dl
sudo systemctl enable ckb-next-daemon
sudo systemctl start ckb-next-daemon
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
curl -fsSL https://raw.githubusercontent.com/curusarn/resh/master/scripts/rawinstall.sh | bash

fstab {
10.1.1.3:/Archive	/Archive	nfs	rw,hard,intr,rsize=8192,wsize=8192,timeo=1024	0	0
10.1.1.3:/Storage	/Storage	nfs	rw,hard,intr,rsize=8192,wsize=8192,timeo=1024	0	0
10.1.1.3:/Anime         /Anime          nfs     rw,hard,intr,rsize=8192,wsize=8192,timeo=1024   0       0
}
