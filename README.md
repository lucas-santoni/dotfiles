# dotfiles

Configuration files for various softwares.

I upload configuration files (often named dotfiles as
they usually start with a dot) in this repo. I normally
write them on Linux but they should work on OS X. In
order to use a file, simply copy it to its location on
your machine or create a symbolic link. Be careful when you overwrite files and
create backups ! :-)

Here is a list of the files :

* **.i3/config** [i3 Window Manager](https://i3wm.org/) configuration file.
  Zenburn style.
* **.irssi/config** [irssi](https://irssi.org/) configuration file. Uses
  [tmux-away](https://github.com/claytron/dotfiles/blob/master/.irssi/scripts/tm
  ux_away.pl)
  and [trackbar](https://github.com/mjholtkamp/irssi-trackbar) with the
  [solarized-universal](https://github.com/huyz/irssi-colors-solarized) theme.
* **.gitconfig** My personnal configuration file for Git. You can propably
  ignore this ! ;-)
* **.tmux.conf** [tmux](https://tmux.github.io/) configuration file. Uses
  [Powerline](https://github.com/powerline/powerline) installed via pip.
* **.vimrc** [Vim](http://www.vim.org/) configuration file. Uses
  [Powerline](https://github.com/powerline/powerline) installed via pip. There
  are also many plugins installed via
  [Vundle](https://github.com/VundleVim/Vundle.vim).
* **.zshrc** Configuration file for the [ZSH](http://www.zsh.org/) shell with
  [Oh-My-ZSH](https://github.com/robbyrussell/oh-my-zsh).

Feel free to use `dotscript.sh` in order to help you manage your dotfiles :

$ ./dotscript.sh -h
Usage : ./dotscript.sh \[-a file\_to\_add\] \[-l file\_to\_link\]

If you are french, here is
[a little post](http://blog.geographer.fr/posts/gerer-ses-dotfiles) I wrote on
dotfiles.
