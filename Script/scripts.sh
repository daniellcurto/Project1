#!/bin/bash

addScriptToPATH () {
    if ! command -v scripts.sh &> /dev/null
    then
      echo 'export PATH=$PATH:https://github.com/daniellcurto/Project1/tree/master/Script/' >> ~/.profile
    fi
}

change_MOTD(){
    #I am not wanting the user to see that a reboot is required so he/she doesn't reboot the system
    sudo chmod -x /etc/update-motd.d/98-reboot-required

    #I also don't want the user to see any available updates. That is the job of the system admin
    sudo chmod -x /etc/update-motd.d/90-updates-available

    #What I am trying to do with this one is tell a particular user how many nodes they are running
    echo 'Welcome to your system '$(echo $USER)'. There are currently '$(find . | wc -l)'-nodes running on your account' >> /etc/update-motd.d/curto-motd
    sudo chmod 755 curto-motd
    sudo chown root curto-motd
} 

customize_Vim () {
  #This installes the Solarized vim color scheme
  #only clone plugin IF directory does not exist
  if [-d ~/.vim/pack/bundle/start/solarized]; then
    echo "Good news! Solarized has already been installed!"
  else
    git clone git://github.com/altercation/solarized.git ~/.vim/pack/bundle/start/solarized
    echo 'syntax enable' >> ~/.vimrc
    echo 'set background=light' >> ~/.vimrc
    echo 'colorscheme solarized' >> ~/.vimrc
  fi
}

alias1(){
# create aws-ssh alias
if ! command -v aws-ssh &> /dev/null
  echo 'alias aws-ssh="ssh -i demo.key ubuntu@54.205.113.32"' >> ~/.bashrc
  . ~/.bashrc
  echo 'Please reload the .bashrc file as this does not work'
fi
}

alias2(){
# create alias of choice
if ! command -v moo &> /dev/null
then
  echo 'alias moo="sudo apt-get install cowsay"' >> ~/.bashrc
  . ~/.bashrc
  echo 'Please reload the .bashrc file as this does not work'
fi
}

printHelp() {
  if [[$1 = '-help'] || [$1 = 'help'] || [$1 = '-h'] || [$1 = 'h']]; then
    echo "This script will set itself up in the .profile file."
    echo "It will disable the '98-reboot-required' and the '90-updates-available' files"
    echo "It will also add a custom motd with the saying Welcome to your system '$(echo $USER)'. There are currently '$(find . | wc -l)'-nodes running on your account.' This motd will be addded to the 'curto-motd file'."
    echo "The script will make sure the file 'curto-motd' will given the same permissions and ownership as the other motd files"
    echo "The script can also download the Solarized vim color scheme and set all the desired custom adjustments that the writer desires"
    echo "The first alias called 'aws-ssh' will point to ssh -i demo.key ubuntu@54.205.113.32"
    echo "The second alias called 'moo' will point to sudo apt-get install cowsay"
    echo "This help option can be called by -help or help or -h or h"
    echo "Also, there is a random motd that can be installed from the internet called fortune-mod cowsay"
    echo "If there are any typos or errors please contact Daniel Curto at curto.2@wright.edu to correct any mistakes"
    # call printHelp
fi
}
 
motdFromInternet() {
  echo 'sudo apt install fortune-mod cowsay' >> ~/.bashrc

}

addScriptToPATH
change_MOTD
customize_Vim
alias1
alias2
printHelp
motdFromInternet