Linux Dev Machine Config Project
================================

This project contains various configuration and maintenance files to ensure a consistent Linux development environment - specifically Zsh, Vim, and plugins.

# Installation
* Clone this repo into your home directory:
```
git clone git@bitbucket.org:caanaan/linuxdevconfig.git ~/.myconfig
```

* To install / update the Vim installation
> NOTE - installing the VIM plugins will recompile the YouCompleteMe libs, which can take a while...
```
~/.myconfig/vim/vimInstall.sh
```

* To install / update the Zsh  installation
```
~/.myconfig/zsh/zshInstall.sh
```

> NOTE - both of the above install required packages and create symlinks for the .vimrc, .zshrc, and other config files.

# Cheat Sheets
* Vim
   * https://people.csail.mit.edu/vgod/vim/vim-cheat-sheet-en.png
   * http://vim.rtorr.com/
   * http://vimcheatsheet.com/
* Zsh
* Docker
   * https://www.linode.com/docs/applications/containers/docker-quick-reference-cheat-sheet
