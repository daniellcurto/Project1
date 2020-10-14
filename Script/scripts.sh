#!/bin/bash

addScriptToPATH () {
  
  if [[":$PATH:" == *":$:scripts"*]]; then
      echo 'export PATH=$PATH:https://github.com/daniellcurto/Project1/tree/master/Script/scripts' >> ~/.profile
  # find out the logic of this if statement
  fi
}

change_MOTD(){
    #I am not wanting the user to see that a reboot is required so he/she doesn't reboot the system
    sudo chmod -x /etc/update-motd.d/98-reboot-required

    #I also don't want the user to see any available updates. That is the job of the system admin
    sudo chmod -x /etc/update-motd.d/90-updates-available

    #What I am trying to do with this one is tell a particular user how many nodes they are running
    echo 'Welcome to your system '$(echo $USER)'. There are currently '$(find . | wc -l)'-nodes running on your account' >> /etc/update-motd.d/curto-motd
    # change user to root and make same permissions as other files in directory
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
  # remind user to reload this themselves as this doesn't work
fi
}

alias2(){
# create alias of choice
if ! command -v moo &> /dev/null
then
  echo 'alias moo="sudo apt-get install cowsay"' >> ~/.bashrc
  . ~/.bashrc
  # remind user to reload this themselves as this doesn't work
fi
}

printHelp() {
  if [[$1 = '-help'] || [$1 = 'help'] || [$1 = '-h'] || [$1 = 'h']]; then
    echo "Usage: passwd [options] [LOGIN]"
	  echo ""
    echo "Options:"
    echo " -a, --all                        report password status on all accounts"
    echo " -d, --delete                     delete the password for the named account"
    echo " -e, --expire                     for expire the password for the named account"
    echo " -h, --help                       display this help message and exit"
    echo " -k, --keep-tokens                change password only if expired"
    echo " -i, --inactive INACTIVE          set password inactive after expiration to INACTIVE"
    echo " -l, --lock                       lock the password of the named account"
    echo " -n, --mindays MIN_DAYS           set minimum number of days before password change to MIN_DAYS"
    echo " -q, --quiet                      quiet mode"
    echo " -r, --repository REPOSITORY      change password in REPOSITY repository"
    echo " -R, --root CHROOT_DIR            directory to chroot into"
    echo " -S, --status                  report password status on the named account"
    echo " -u, --unlock                  unlock the password of the named account"
    echo " -w, --warndays WARN_DAYS      set expiration warning days to WARN_DAYS"
    echo " -x, --maxdays MAX_DAYS        set maximum number of days before password change to MAX_DAYS"
    echo "Ubuntu 4.19.104-microsoft-version for passwd command October 12, 2020"
    # help should just be about how this particular script works
    # call printHelp
fi
}
 
motdFromInternet() {
  sudo apt install fortune-mod cowsay

}

addScriptToPATH
change_MOTD
customize_Vim
alias1
alias2
printHelp
motdFromInternet