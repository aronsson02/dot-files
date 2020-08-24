sudo mkdir /Archive
sudo mkdir /Anime
sudo mkdir /Storage
fstab {
10.1.1.3:/Archive	/Archive	nfs	rw,hard,intr,rsize=8192,wsize=8192,timeo=1024	0	0
10.1.1.3:/Storage	/Storage	nfs	rw,hard,intr,rsize=8192,wsize=8192,timeo=1024	0	0
10.1.1.3:/Anime         /Anime          nfs     rw,hard,intr,rsize=8192,wsize=8192,timeo=1024   0       0
}
curl -fsSL https://raw.githubusercontent.com/curusarn/resh/master/scripts/rawinstall.sh | bash
sudo pacman -Sy pulseeffects yoshimi fontforge ktorrent gparted virt-manager qemu rawtherapee wine wine-mono wine-gecko opencl-mesa
yay -Sy fontpreview ckb-next minecraft-launcher-beta qemu-spice youtube-dl
