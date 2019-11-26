To be used with [GNU stow](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

Note to self: 
- make a subdirectoy, say polybar
- then move the dotfile from its origional location to the subfolder
- run <code>stow SubDirName -t ~/.where/do/you/want/the/symlink</code>, say stow polybar -t ~
  - but maybe not, I haven't tried it
- I think you can stow -d ~/dotfiles/where -t ~/.where/do/you/want/the/symlink
  - but maybe not, I haven't tried it
