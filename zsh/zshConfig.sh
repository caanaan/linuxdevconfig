#!/bin/bash

#Ensure that the cwd is correct
cd ~

#Enter the sudo password once
sudo -v

#Ensure that zsh related packages are installed
DEPS="zsh git-core"

for pkg in $DEPS; do
    if dpkg --get-selections | grep -q "^$pkg[[:space:]]*install$" >/dev/null; then
        echo -e "$pkg is already installed."
    else
        sudo apt-get install $pkg
        echo -e "Installed $pkg..."
    fi
done

#Verify that Oh My Zsh is installed
FILE=~/.oh-my-zsh/oh-my-zsh.sh
if [ -f $FILE ];
then
   echo "Oh My Zsh is already installed."
else
   sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
   echo "Installed Oh My Zsh..."
fi

#Verify that Antigen is already installed
DIR=~/.antigen
if [ -d $DIR ];
then
   echo "Antigen is already installed."
else
   mkdir ~/.antigen
   cd ~/.antigen
   git clone https://github.com/zsh-users/antigen.git
   echo "Installed Antigen..."
fi

#Backup the .zshrc and the ycm_extra_conf_default files and remove the old versions
FILES="~/.zshrc
"
for f in $FILES
do
   echo -e "processing $f"
   if [ -f $f ]; then
      if [ -L $f ]; then
          #File is a symbolic link -- not backing up
          echo -e "$f is a symbolic link.  Not backing up..."
      else
         mv $f ${f}.backup
      fi
   fi
   echo -e "removing $f"
   rm -f $f
done

#Create symlinks from .myconfig/zsh path to the canonical locations for the config files
ln -sf ~/.myconfig/zsh/zshrc ~/.zshrc

