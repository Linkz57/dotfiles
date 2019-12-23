#!/bin/sh

mkdir -p ~/Documents/sjunk/scripts
cd ~/Documents/sjunk/scripts || exit


## diff-so-fancy - https://github.com/so-fancy/diff-so-fancy
echo "   diff-so-fancy"
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
echo "   mog"
pip3 install --user mog


## stow - https://www.gnu.org/software/stow/
## Thanks to XKCD for the following line - xkcd.com/1654
echo "   stow"
sudo apt install stow ||
sudo pacman -Sy stow ||
sudo pkg install stow ||
sudo dnf install stow
printf "Now run the command 'stow' with the argument of whatever subfolder you want in the dotfiles git repo\nassuming the dotfiles git repo is just under ~"





  ####                         #      "
 #       mmm   mmmmm   mmm   mm#mm  mmm    mmmmm   mmm    mmm  
  #mm   #" "#  # # #  #"  #    #      #    # # #  #"  #  #   " 
     #  #   #  # # #  #""""    #      #    # # #  #""""   """m 
 #mmm"  "#m#"  # # #  "#mm"    "mm  mm#mm  # # #  "#mm"  "mmm" 
## I don't always want to do the following things when setting up a new computer.
## run this one_time_setup script with the argument "all" to also do this extra stuff.
if [[ "$1" -eq "all" ]] ; then echo "   doing everything" ; else exit 0 ; fi


## bpython - https://bpython-interpreter.org
echo "   bPython"
pip3 install --user bpython


## speedread - https://github.com/pasky/speedread.git
echo "   speedread"
mkdir -p ~/Documents/sjunk/programs
cd ~/Documents/sjunk/programs
git clone https://github.com/pasky/speedread.git
ln -s ~/Documents/sjunk/programs/speedread/speedread ~/.local/bin/speedread
