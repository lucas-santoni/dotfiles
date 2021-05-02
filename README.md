# Dotfiles

Various stuff to install:

* https://github.com/ogham/exa
* https://github.com/sharkdp/fd
* https://github.com/BurntSushi/ripgrep
* https://github.com/sharkdp/bat
* https://github.com/junegunn/fzf
* https://github.com/be5invis/Iosevka

Handy to have around:

* https://github.com/fnune/base16-fzf
* https://github.com/devkral/lightsonplus

## Alacritty

Nothing special:

```fish
ln -s ~/.dotfiles/alacritty ~/.config
```

## Aspell

Nothing special:

```fish
ln -s ~/.dotfiles/aspell/aspell.en.pws ~/.aspell.en.pws
ln -s ~/.dotfiles/aspell/aspell.en.prepl ~/.aspell.en.prepl
```

## Bspwm

Dependencies: actually a lot of stuff as most background programs are
started here. Take a look at the configuration file first I guess.

Nothing special:

```fish
ln -s ~/.dotfiles/bspwm ~/.config
```

## Dunst

Nothing special:

```fish
ln -s ~/.dotfiles/dunst ~/.config
```

## Emacs

Nothing special:

```fish
ln -s ~/.dotfiles/emacs/* ~/.emacs.d/
```

## Fish

Dependencies:

* https://github.com/jorgebucaran/fisher
* https://github.com/chriskempson/base16-shell
* https://starship.rs/fr-fr/ (see below)

Install the functions:

```fish
ln -s ~/.dotfiles/fish/functions/* ~/.config/fish/functions/
```

*Note: run the command again if you create new files in the `functions/`
directory.*

Install the plugins:

```fish
# First, install fisher
ln -s ~/.dotfiles/fish/fish_plugins ~/.config/fish
fisher update
```

Install the base16 helper:

```fish
ln -s ~/.dotfiles/fish/base16.fish ~/.config/fish/conf.d
```

Source the universal variables:

```fish
source ~/.dotfiles/fish/universal.fish
```

Source the abbreviations:

```fish
source ~/.dotfiles/fish/abbreviations.fish
```

*Note: run the command again if you change one of these files.*

## Git

Nothing special:

```fish
ln -s ~/.dotfiles/git/config ~/.gitconfig
```

## IMWheel

Nothing special:

```fish
ln -s ~/.dotfiles/imwheel/imwheelrc ~/.imwheelrc
```

## Picom

Nothing special:

```fish
ln -s ~/.dotfiles/picom ~/.config
```

## Polybar

Nothing special:

```fish
ln -s ~/.dotfiles/polybar ~/.config
```

## Rofi

Nothing special:

```fish
ln -s ~/.dotfiles/rofi ~/.config
```

## Starship

Link the file:

```fish
ln -s ~/.config/starship/starship/toml ~/.config/starship.toml
```

Then, write the startup procedure:

```fish
starship init fish > ~/.config/fish/conf.d/starship.fish
```

## Sxhkd

Nothing special:

```fish
ln -s ~/.dotfiles/sxhkd ~/.config
```

## Tmux

Nothing special:

```fish
ln -s ~/.dotfiles/tmux ~/.config/
```

## Vim

Dependencies:

* https://github.com/junegunn/vim-plug
* https://github.com/chriskempson/base16-shell

Otherwise nothing special:

```fish
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
```

## VSCode

Nothing special:

```fish
ln -s ~/.dotfiles/vscode/* ~/.config/Code/User/
```

I don't track the plugins I install.

## X

Nothing special:

```fish
ln -s ~/.dotfiles/x/xinitrc ~/.xinitrc
ln -s ~/.dotfiles/x/Xresources ~/.Xresources
ln -s ~/.dotfiles/x/xscreensaver ~/.xscreensaver
```

*Note: be careful! You probably want to edit those files first if you don't have a 4K
screen. Otherwise everything will look huge.*

## Zathura

Nothing special:

```fish
ln -s ~/.dotfiles/zathura ~/.config
```
