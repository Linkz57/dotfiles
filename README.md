To be used with [GNU stow](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

## How to Stow from scratch:
1. Get yourself a folder somewhere. Say: ~/dotfiles
2. Make a bunch of subfolders named whatever you want, but don't change the name maybe. Say: ~/dotfiles/i3 and ~/dotfiles/bash and ~/dotfiles/ThingsThatMakeYourGoBleh
3. Find some dotfiles you want to stow up and just make a note of their path. Say: ~/.config/i3/config and ~/.bashrc and ~/.local/kxmlgui5/dolphin/dolphinui.rc
4. Inside your custom subfolders, recreate the folder structure (mkdir -p is good for this) of the files you'll eventually stow, relative from the parent of the PWD of our future stow commands which in the case of ~/dotfiles is ~ Say: ~/dotfiles/bash/ and ~/dotfiles/ThingsThatMakeYourGoBleh/.local/kxmlgui5/dolphin/
5. Move (don't copy) the dotfiles from their original locate to their new home at ~/dotfiles/something/subfolders
6. From ~/dotfiles run <code>stow ThingsThatMakeYourGoBleh</code> and it'll make a symlink for you.

https://www.youtube.com/watch?v=TG_R7lpR2zU

Maybe there's a way for stow to create the folder structure in ~/dotfiles and move the file there and make a symlink back automatically? I haven't found it, but I know standard shell script can do that, and Stow is made of a lot of Perl so presumably it has that power.
Maybe --adopt is that?


If you change any names, it'll break your symlinks, but <code>stow -R ThingsThatMakeYourGoBleh</code> will re-stow them, recreating the symlinks to your newly named ~/Documents/dotfiles or whatever.


When setting up a new machine or whatever, you can run stow with multiple arguments to stow all the things. Say: <code> cd ~ ; git clone mahDotfiles ; cd dotfiles ; stow i3 bash</code>


## Credits
All of the neat and interesting things in the repo have been written by people more clever than me. Including them as linked submodules should help with proper attribution, but here's another more explicit thanks:

* [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) by Robby Russell
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting
) by Daniel Shahaf et al
* [agnoster theme](https://github.com/agnoster/agnoster-zsh-theme) by Isaac Wolkerstorfer
* [numix circle icons](https://github.com/numixproject/numix-icon-theme-circle) by Joshua H. Fogg

