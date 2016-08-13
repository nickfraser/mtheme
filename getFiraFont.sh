#!/bin/bash

## cf from http://programster.blogspot.com/2014/05/ubuntu-14-desktop-install-fira-sans-and.html

# Find out if we're on cygwin, in case some programs need to know during installation.
if [ "$OS" = "Windows_NT" ]; then # If we're using cygwin.
    CYGWIN_FLAG=1
else # If we're not using cygwin (so we're using linux).
    CYGWIN_FLAG=0
fi

cd /tmp

# install unzip just in case the user doesn't already have it.
if [ $CYGWIN_FLAG = "1" ]; then
    sudo apt-get install unzip -y
fi

wget "http://www.carrois.com/downloads/fira_4_1/FiraFonts4106.zip"
wget "http://www.carrois.com/downloads/fira_mono_3_2/FiraMonoFonts3206.zip"
unzip FiraFonts4106.zip
unzip FiraMonoFonts3206.zip

if [ $CYGWIN_FLAG = "1" ]; then
    mkdir -p /usr/share/fonts/truetype/FiraSans
    mkdir -p /usr/share/fonts/opentype/FiraSans
    cp Fira*/WEB/*.ttf /usr/share/fonts/truetype/FiraSans/
    cp Fira*/OTF/Fira* /usr/share/fonts/opentype/FiraSans/
    
    fc-cache -fv
else
    sudo mkdir -p /usr/share/fonts/truetype/FiraSans
    sudo mkdir -p /usr/share/fonts/opentype/FiraSans
    sudo cp Fira*/WEB/*.ttf /usr/share/fonts/truetype/FiraSans/
    sudo cp Fira*/OTF/Fira* /usr/share/fonts/opentype/FiraSans/
    
    sudo fc-cache -fv
fi

