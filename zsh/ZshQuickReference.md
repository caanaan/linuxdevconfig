ZSH Quick Reference:
=======================

## Copy and Paste to/from Tmux
* y - While selecting some text, press to yank the contents to the system clipboard
* Ctrl + Shift + V - Copy from system clipboard to Tmux

## Cscope and Ctags
* csetup - run cscope and ctags generation in the current folder

## Autojump
* j <partialFolderName> - Jump to the most recent folder that matches the partial folder name

## FZF - a fuzzy finder (like CtrlP for the shell):
* ** <TAB> - Will open FZF to search for the wildcarded item (files and folders, pids, host names, environmental variables)
* ESC or Ctrl-C - Exit
* fzf - opens a program to find a file and returns its name in stdout
* fzf -m - open in multiselect mode

## Sudo
* Esc - Esc - will prepend the current command with sudo
* _ - is aliased to sudo

## TMUX
* Control prefix is Ctrl + a
* prefix + a - To send a Ctrl + a to a window
* prefix + x - Close the current pane
* prefix + z - Maximize / restore the current pane
* hold prefix + arrow keys - resize the pane one column at a time
* prefix + Ctrl + Shift + arrow keys - resize the pane several columns per
* prefix + arrow keys - move between panes
* prefix + d - disconnect the tmux session
* y - while selecting text to yank it to the clipboard
* prefix + - or | - split pane horizontally or vertically
* prefix + ? - display all key mappings

##Windows Stuff
vagrant up - Bring the Vagrant VM up
vagrant ssh - Ssh into the Vagrant VM
vagrant halt - Bring down the Vagrant VM
Ctrl + Shift + Insert - Copy into Tmux window in Babun
