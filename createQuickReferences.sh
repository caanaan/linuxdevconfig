#!/bin/sh
# NOTE - this requires GRIP (https://github.com/joeyespo/grip) to be installed
#  sudo pip install grip
# and wkhtmltopdf:
#  sudo apt-get install wkhtmltopdf
#  sudo ln -s /usr/bin/wkhtmltopdf /usr/local/bin/html2pdf
# NOTE - wkhtmltopdf requires an X server, so won't work if none are running...

grip ./vim/VimQuickReference.md 8200 &
sleep 1
#/opt/google/chrome/chrome http://localhost:8200 &
html2pdf http://localhost:8200 VimQuickReference.pdf
killall grip

grip ./zsh/ZshQuickReference.md 8200 &
sleep 1
#/opt/google/chrome/chrome http://localhost:8201 &
html2pdf http://localhost:8200 ZshQuickReference.pdf
killall grip
