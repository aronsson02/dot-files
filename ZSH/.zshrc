# Path to your oh-my-zsh installation.
export ZSH="/home/yami/dot-files/ZSH/.oh-my-zsh/"

# Set name of the theme to load
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# _ and - will be interchangeable.
# Case-sensitive completion must be off.
HYPHEN_INSENSITIVE="true"

# Auto-update and how often to auto-update (in days)
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 7

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
COMPLETION_WAITING_DOTS="%F{cyan}...%f"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias yt-dlp-vt="yt-dlp --download-archive /mnt/Archive/.archive -N 16 --buffer-size 128K -P /mnt/Archive/VT/ --part --write-info-json --no-write-playlist-metafiles --write-thumbnail PLu2_CGIuTx8MYkY8RDX7TIzQJ0MA9BWiP"
alias yt-dlp-pvt="yt-dlp --download-archive /mnt/Archive/.archive -N 16 --buffer-size 128K -P /mnt/Archive/PVT/ --part --write-info-json --no-write-playlist-metafiles --write-thumbnail PLu2_CGIuTx8M3BMEUuVYTn1adjKFWKPKB"
alias yt-dlp-boris="yt-dlp --download-archive /mnt/Archive/.archive -N 16 --buffer-size 128K -P '/mnt/Archive/YouTube/Life of Boris/' --part --write-info-json --no-write-playlist-metafiles --write-thumbnail --playlist-reverse -o 'E%(playlist_autonumber)s - %(title)s' 'UUS5tt2z_DFvG7-39J3aE-bQ'"
alias yt-dlp-AiJ="yt-dlp --download-archive /mnt/Archive/.archive -N 16 --buffer-size 128K -P '/mnt/Archive/YouTube/Abroad in Japan/Season 1/' --part --write-info-json --no-write-playlist-metafiles --write-thumbnail --playlist-reverse -o 'Abroad in Japan - S01E%(playlist_autonumber)s - %(title)s' 'UUHL9bfHTxCMi-7vfxQ-AYtg'"
alias yt-dlp-CB="yt-dlp --download-archive /mnt/Archive/.archive -N 16 --buffer-size 128K -P '/mnt/Archive/YouTube/Abroad in Japan/Season 2/' --part --write-info-json --no-write-playlist-metafiles --write-thumbnail --playlist-reverse -o 'Abroad in Japan - S02E%(playlist_autonumber)s - %(title)s' 'UUuJn_2HhHRqnu3xiIukNx1Q'"
alias yt-dlp-AiJP="yt-dlp --download-archive /mnt/Archive/.archive -N 16 --buffer-size 128K -P '/mnt/Archive/YouTube/Abroad in Japan/Season 3/' --part --write-info-json --no-write-playlist-metafiles --write-thumbnail --playlist-reverse -o 'Abroad in Japan - S03E%(playlist_autonumber)s - %(title)s' 'UUgL1f1txLPqr2XpQlKlKmEg'"
alias yt-dlp-Boy="yt-dlp --download-archive /mnt/Archive/.archive -N 16 --buffer-size 128K -P '/mnt/Archive/YouTube/I did a thing/Season 1/' --part --write-info-json --no-write-playlist-metafiles --write-thumbnail --playlist-reverse -o 'I did a thing - S01E%(playlist_autonumber)s - %(title)s' 'UU_S45UpAYVuc0fYEcHN9BVQ'"
alias yt-dlp-IDaT="yt-dlp --download-archive /mnt/Archive/.archive -N 16 --buffer-size 128K -P '/mnt/Archive/YouTube/I did a thing/Season 2/' --part --write-info-json --no-write-playlist-metafiles --write-thumbnail --playlist-reverse -o 'I did a thing - S02E%(playlist_autonumber)s - %(title)s' 'UUJLZe_NoiG0hT7QCX_9vmqw'"
alias yt-dlp-CD="yt-dlp --download-archive /mnt/Archive/.archive -N 16 --buffer-size 128K -P '/mnt/Archive/YouTube/Captain Disillusion/Season 1/' --part --write-info-json --no-write-playlist-metafiles --write-thumbnail --playlist-reverse -o 'Captain Disillusion - S01E%(playlist_autonumber)s - %(title)s' 'UUEOXxzW2vU0P-0THehuIIeg'"
alias yt-dlp-Trash="yt-dlp --download-archive /mnt/Archive/.archive -N 16 --buffer-size 128K -P '/mnt/Archive/YouTube/Trash Taste/' --part --write-info-json --no-write-playlist-metafiles --write-thumbnail --playlist-reverse -o 'Trash Taste - S01E%(playlist_autonumber)s - %(title)s' 'UUcmxOGYGF51T1XsqQLewGtQ'"

alias yt-dlp-random="yt-dlp --cookies-from-browser firefox:'/home/yami/.floorp/dzwzs0nv.default-release/' -N 16 --buffer-size 128K -P '/home/yami/Nedlastinger/' --part -o '%(title)s'"
alias yt-dlp-music="yt-dlp --cookies-from-browser firefox:'/home/yami/.floorp/dzwzs0nv.default-release/' -N 16 --buffer-size 128K -P '/mnt/Koyo/Music/' --part -x -o '%(creator)s - %(title)s'"

alias nrk="/home/yami/.local/bin/nrkdownload -d '/Tera/TV'"

alias pixiv-bookmarks="python /mnt/Archive/PixivUtil2/PixivUtil2.py -s 6 -p y -x"
alias pixiv-list="python /mnt/Archive/PixivUtil2/PixivUtil2.py -s 4 -x"
alias pixiv-user="python /mnt/Archive/PixivUtil2/PixivUtil2.py -s 1 -x"

alias sudo=doas
alias install=yay -S
alias system-update="yay -Syu --noconfirm"
alias cp="rsync -ahvU --open-noatime --preallocate --progress"
alias system-info="inxi -Fza"
alias disk-space="df -H"
alias check-ports="nmap -Pn"
alias ll="ls -lha"
alias failed="doas systemctl list-units --failed"

[ -f ~/.resh/shellrc ] && source ~/.resh/shellrc # this line was added by RESH

HISTFILE=/Archive/.histfile
HISTSIZE=100000000
SAVEHIST=100000000
