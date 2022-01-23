## <p align="center">Details</p>

+ **OS**                : Arch
+ **WM**                : Bspwm
+ **HOTKEY DAEMON**     : Sxhkd
+ **BAR**               : Polybar
+ **TERMINAL**          : Alacritty
+ **SHELL**             : Bash
+ **EDITOR**            : Vim
+ **TERMINAL FONT**     : JetBrains Mono
+ **BAR FONT**          : Iosevka
+ **ICON FONT**         : [Symbols Nerd Font](https://archlinux.org/packages/community/any/ttf-nerd-fonts-symbols/)
+ **APP LAUNCHER**      : Dmenu
+ **MUSIC PLAYER**      : Mpd, Ncmpcpp
+ **FILE MANAGER**      : Ranger
+ **NOTIFICATION**      : Dunst
+ **COMPOSITOR**        : [Picom](https://github.com/ibhagwan/picom)
+ **EMAIL**             : Neomutt
+ **VIDEO PLAYER**      : Mpv
+ **SCREEN CAPTURE**    : Scrot
+ **DOCUMENT VIEWER**   : Zathura
+ **RSS READER**        : Newsboat

## <p align="center">Installation</p>

```shell
mv ~/.config ~/.config-bak
mkdir -p ~/.config/ ~/workspace
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/workspace/dotfiles/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc && mv ~/.zshrc ~/.zshrc-bak
echo "workspace/dotfiles" >> .gitignore
git clone --bare git@github.com:Hrazhan/dotfiles.git $HOME/workspace/dotfiles
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```
