#!/bin/sh

mkdir -p ~/Documents/sjunk/scripts
cd ~/Documents/sjunk/scripts || exit


## diff-so-fancy - https://github.com/so-fancy/diff-so-fancy
echo"   diff-so-fancy"
curl -O ~/Documents/sjunk/scripts/diff-so-fancy "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy"
chmod 700 ~/Documents/sjunk/scripts/diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta                   "11"
git config --global color.diff.frag                   "magenta bold"
git config --global color.diff.commit                 "yellow bold"
git config --global color.diff.old                    "red bold"
git config --global color.diff.new                    "green bold"
git config --global color.diff.whitespace             "red reverse"


## mog - https://github.com/witchard/mog
echo"   mog"
cd ~/Documents/sjunk/scripts || exit
pip3 install --user mog


## speedread - https://github.com/pasky/speedread.git
mkdir -p ~/Documents/sjunk/programs
cd ~/Documents/sjunk/programs
git clone https://github.com/pasky/speedread.git
ln -s ~/Documents/sjunk/programs/speedread/speedread ~/.local/bin/speedread


## stow - https://www.gnu.org/software/stow/
## Thanks to XKCD for the following line - xkcd.com/1654
sudo apt install stow ||
sudo pacman -Sy stow ||
sudo pkg install stow ||
sudo dnf install stow
printf "Now run the command 'stow' with the argument of whatever subfolder you want in the dotfiles git repo\nassuming the dotfiles git repo is just under ~"
