# Gnome

This file is a collection of links and information about my Gnome setup.
I normally have the latest stable versions of Gnome and Gnome-Shell installed.

## Gnome-Shell extensions

You can get the Gnome-Shell extensions from [here](https://extensions.gnome.org/).
Use Firefox directly from your Gnome system in order to enable them easily.

* Alternatetab *A better Alt + Tab*
* Dash to dock *A dock*
* Hide Top Bar *Even more space*
* Icon hider *For removing useless icons in topbar*
* No topleft hot corner *Because it's annoying, I use the super button instead*
* Openweather *For the weather in topbar*
* Panel OSD *For replacing notifications because of dock*
* User themes *For themes*
* Workspace indicator *Workspace indicator in topbar*
* TopIcons *Move legacy tray icons to the topbar*
* Notifications Alert *Reminds you that your notification tray is not empty*

## Theming

Just follow the installation guides.

* GTK Theme : [Arc Theme](https://github.com/horst3180/arc-theme) *The basic one*
* Shell Theme : [Arc Shell](https://github.com/horst3180/arc-theme) *User themes must be enabled !*
* Basic icons : [Numix Icons](https://github.com/numixproject/numix-icon-theme) *For folders...* 
* Application Icons : [Numix Circle Icons](https://github.com/numixproject/numix-icon-theme-circle) *For applications...*

Alternatively, for people who enjoy transparency : [Xenlism Themes](http://xenlism.github.io/minimalism/) *Can be mixed with Arc*

## Extras

Here is a command to fix the workspaces for multiple monitors :

```
gsettings set org.gnome.shell.overrides workspaces-only-on-primary false
```
