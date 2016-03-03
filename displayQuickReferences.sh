#!/bin/sh
# NOTE - this requires GRIP (https://github.com/joeyespo/grip) to be installed!

grip ./vim/MyVimQuickReference.md 8200 &
/opt/google/chrome/chrome http://localhost:8200 &

grip ./zsh/MyZshQuickReference.md 8201 &
/opt/google/chrome/chrome http://localhost:8201 &

#NOTE - you will need to kill the grip instances manually when done!
# Typically using killall grip
