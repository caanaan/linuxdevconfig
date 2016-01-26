#!/bin/bash

#Determine what platform the script is running on and set appropriate variables.
case "$(uname -s)" in
   Darwin)
     echo 'Mac OS X'
     PLATFORM=MAC
     PACK_MAN_CMD=brew
     ;;
   Linux)
     echo 'Linux'
     PLATFORM=LINUX
     PACK_MAN_CMD=apt-get
     ;;
   CYGWIN*|MINGW32*|MSYS*)
     echo 'MS Windows'
     PLATFORM=WINDOWS
     PACK_MAN_CMD=pact
     ;;
   *)
     echo 'other OS' 
     ;;
esac

echo "Platform is $PLATFORM"

#Ensure that the cwd is correct
cd ~

#Enter the sudo password once
sudo -v

# Update apt-get sources so that tmux 2.0 can be installed
sudo apt-get update
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update

#Ensure that zsh related packages are installed
DEPS="zsh git-core tmux ruby-full silversearcher-ag xclip python-pip"

for pkg in $DEPS; do
    if dpkg --get-selections | grep -q "^$pkg[[:space:]]*install$" >/dev/null; then
        echo -e "$pkg is already installed."
    else
        sudo $PACK_MAN_CMD -y install $pkg
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

#Verify that TMUX Plugin Manager is already installed
DIR=~/.tmux/plugins/tpm
if [ -d $DIR ];
then
   echo "TPM is already installed."
else
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   echo "Installed TPM..."
fi


#Verify that tmuxinator is installed
if gem list tmuxinator -i; then
   echo "Tmuxinator already installed."
else
   echo "Installing Tmuxinator."
   sudo gem install -q tmuxinator
fi

#Install pip packages.
DEPS="httpie"
for pkg in $DEPS; do
   if pip list | grep "^$pkg" >/dev/null; then
      echo -e "$pkg is already installed."
   else
      echo -e "Installing $pkg."
      sudo pip install $pkg
   fi
done

#Install icdiff
if hash icdiff 2>/dev/null; then
   echo "icdiff is already installed."
else
   echo "Installing icdiff."
   curl -s https://raw.githubusercontent.com/jeffkaufman/icdiff/release-1.7.3/icdiff \
     | sudo tee /usr/local/bin/icdiff > /dev/null \
       && sudo chmod ugo+rx /usr/local/bin/icdiff
fi

#Backup the .zshrc and the ycm_extra_conf_default files and remove the old versions
FILES="~/.zshrc
~/.tmux.conf
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
ln -sf ~/.myconfig/zsh/tmux.conf ~/.tmux.conf

#Check that txuminator folder exists -- create if it doesn't
if [ -d ~/.tmuxinator ]; then
   echo "~/.tmuxinator folder already exists."
else
   mkdir ~/.tmuxinator
fi

#Create symlinks from default tmuxinator projects to tmuxinator config area.
FILES="myconfig.yml
sandbox-dev.yml
gateway-dev.yml
"
for f in $FILES
do
   ln -sf ~/.myconfig/zsh/tmuxinator/$f ~/.tmuxinator/$f
done
