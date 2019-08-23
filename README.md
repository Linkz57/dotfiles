To be used with [GNU stow](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

Note to self: 
- make a subdirectoy, say polybar
- then move the dotfile from its origional location to the subfolder
- run <code>stow SubDirName</code>, say polybar
- magic?
    - Twice it's make a link in ~ which is where it was supposed to go, but I don't know how that'll work with things supposed to be in ~/.config or wherever.
