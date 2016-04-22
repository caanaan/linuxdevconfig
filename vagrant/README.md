Vagrant Use Instructions:
=========================

## Installation / Required Software
* Install Vagrant
   * https://www.vagrantup.com/
* Install Virtualbox
   * https://www.virtualbox.org/
* If on Windows, install a decent shell
  * https://babun.github.io/ - Tmux seems to work better in Babun for me than Cmder...
  * http://cmder.net/

## VM Creation / Setup
* Launch your terminal (Babun, Cmder, etc)
  * Create a folder for the Vagrant definition
     * `mkdir ~/vagrant/dev-env`
  * Download the Vagrantfile in this same path to this folder
  * Bring the Vagrant VM up
     * From within the same folder, `vagrant up`
     * This will create the VM using the information in the Vagrantfile
     * NOTE - if this is your first time doing this, it will have to pull down the Ubuntu base box which will take a while...
     * It will also clone this Git repo to ~/.myconfig for the default 'vagrant' user

## Use
* From the terminal, after the vagrant vm is up
  * `vagrant ssh`
  * If this is your first use of this vagrant vm
     * `cd ~/.myconfig`
     * `./configAll.sh`
     * NOTE - this will take a while,  In particular, pulling down Clang and compiling it for YouCompleteMe takes a long time...
  * Your terminal dev environment should now be set up.
  * To launch a Tmuxinator configuration
     * `mux <configName>` for instance `mux myconfig`
  * To see some of the extra configurations / setup - view the *QuickReference.md files.
