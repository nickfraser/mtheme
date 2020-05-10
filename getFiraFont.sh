#!/bin/bash

set -e

## cf from http://programster.blogspot.com/2014/05/ubuntu-14-desktop-install-fira-sans-and.html

# Find out if we're on cygwin, in case some programs need to know during installation.
if [ "$OS" = "Windows_NT" ]; then # If we're using cygwin.
    CYGWIN_FLAG=1
else # If we're not using cygwin (so we're using linux).
    CYGWIN_FLAG=0
fi

cd /tmp

# install unzip just in case the user doesn't already have it.
if [ $CYGWIN_FLAG = "0" ]; then
    sudo apt-get install unzip -y
fi

# Fonts also available at: https://github.com/bBoxType/FiraSans
wget "https://bboxtype.com/downloads/Fira/Download_Folder_FiraSans_4301.zip"
wget "https://bboxtype.com/downloads/Fira/Fira_Mono_3_2.zip"
unzip -q Download_Folder_FiraSans_4301.zip
unzip -q Fira_Mono_3_2.zip

if [ $CYGWIN_FLAG = "1" ]; then
    mkdir -p /usr/share/fonts/truetype/FiraSans
    mkdir -p /usr/share/fonts/opentype/FiraSans
    cp Download_Folder_FiraSans_4301/Fonts/Fira_Sans_TTF_4301/*/*/*.ttf \
        /usr/share/fonts/truetype/FiraSans/
    cp Download_Folder_FiraSans_4301/Fonts/Fira_Sans_OTF_4301/*/*/*.otf \
        /usr/share/fonts/opentype/FiraSans/
    cp Fira_Mono_3_2/Fonts/FiraMono_WEB_32/*.ttf /usr/share/fonts/truetype/FiraSans
    cp Fira_Mono_3_2/Fonts/FiraMono_OTF_32/*.otf /usr/share/fonts/truetype/FiraSans
    
    fc-cache -fv
else
    sudo mkdir -p /usr/share/fonts/truetype/FiraSans
    sudo mkdir -p /usr/share/fonts/opentype/FiraSans
    sudo cp Download_Folder_FiraSans_4301/Fonts/Fira_Sans_TTF_4301/*/*/*.ttf \
        /usr/share/fonts/truetype/FiraSans/
    sudo cp Download_Folder_FiraSans_4301/Fonts/Fira_Sans_OTF_4301/*/*/*.otf \
        /usr/share/fonts/opentype/FiraSans/
    sudo cp Fira_Mono_3_2/Fonts/FiraMono_WEB_32/*.ttf /usr/share/fonts/truetype/FiraSans
    sudo cp Fira_Mono_3_2/Fonts/FiraMono_OTF_32/*.otf /usr/share/fonts/truetype/FiraSans
    
    sudo fc-cache -fv
fi

rm Download_Folder_FiraSans_4301.zip Fira_Mono_3_2.zip
rm -rf Download_Folder_FiraSans_4301 Fira_Mono_3_2

