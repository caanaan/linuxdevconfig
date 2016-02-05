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

#Ensure that git related packages are installed.  
# Cmake and python-dev required for YouCompleteMe
DEPS="git git-core cmake python-dev vim-gnome"

for pkg in $DEPS; do
    if dpkg --get-selections | grep -q "^$pkg[[:space:]]*install$" >/dev/null; then
        echo -e "$pkg is already installed."
    else
        sudo $PACK_MAN_CMD -y install $pkg
        echo -e "Installed $pkg..."
    fi
done

#Verify that Vundle is already installed
DIR=~/.vim/bundle/Vundle.vim
if [ -d $DIR ];
then
   echo "Vundle is already installed."
else
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   echo "Installed Vundle..."
fi

#Backup the .vimrc and the ycm_extra_conf_default files and remove the old versions
FILES="~/.vimrc
~/.ycm_extra_conf_default.py"
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

#Ensure that the vim colors folder exists
mkdir ~/.vim/colors

#Create symlinks from .myconfig/vim path to the canonical locations for the config files
ln -sf ~/.myconfig/vim/vimrc ~/.vimrc
ln -sf ~/.myconfig/vim/ycm_extra_conf_default.py ~/.ycm_extra_conf_default.py
ln -sf ~/.myconfig/vim/lukes-dev-scheme.vim ~/.vim/colors/lukes-dev-scheme.vim

#Create symlinks from default Ultisnips files to snippets config area.
mkdir ~/.vim/UltiSnips
FILES="c.snippets
conf.snippets
"
for f in $FILES
do
   ln -sf ~/.myconfig/vim/UltiSnips/$f ~/.vim/UltiSnips/$f
done

#Install all the plugins
# NOTE - there may be an ycm error, since it isn't compiled yet.
vim +PluginInstall +qall

#Make sure the Powerline patched fonts are installed.
~/.vim/bundle/fonts/install.sh
#NOTE - this will attempt to force the font used for the shell to this, 
# not sure how (if) this will work for non-Linux systems!
if [ "$PLATFORM"=="LINUX" ]; then
   echo "Setting monospace font to 'Deja Sans Mono for Powerline 11'"
   gsettings set org.gnome.desktop.interface monospace-font-name 'DejaVu Sans Mono for Powerline 11'
else
   echo "To see the correct airline and tmuxline fonts, make sure to set the system font"
   echo " to to 'DejaVu Sans Mono for Powerline!' or something listed for Powerline."
fi

#Compile YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe

#Check if YCM has already been built
if [ -f ./third_party/ycmd/ycm_core.so ]; then
   echo "YouCompleteMe is already compiled."
else
   ./install.py --clang-completer
fi
cd ~
