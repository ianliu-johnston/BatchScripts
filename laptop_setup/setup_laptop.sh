#!/bin/bash
echo "This script is for customization on Lubuntu v.16.04"
echo "Run this script in sudo mode."
# Install all tools I need.
apt-get update
apt-get install -y git p7zip-full radare2 valgrind emacs gcc-4.8 gcc docker-engine
apt-get install -y exfat-fuse exfat-utils vlc pavucontrol virtualbox vagrant
# Uninstall any I don't need
apt-get purge -y pidgin pidgin-data gnumeric mplayer gnome-mplayer
apt-get purge -y audacious audacious-plugins audacious-plugins-data
apt-get purge -y sylpheed sylpheed-doc sylpheed-i18n sylpheed-plugins
apt autoremove
rm -v ~/Pictures ~/Templates ~/Videos
# Clone repos I work with.
git clone https://github.com/ianliu-johnston/BatchScripts.git ~/Documents/BatchScripts
git clone https://github.com/ianliu-johnston/holbertonschool-low_level_programming.git ~/Documents/holbertonschool-low_level_programming
git clone https://github.com/ianliu-johnston/holbertonschool-higher_level_programming.git ~/Documents/holbertonschool-higher_level_programming
# Run batch script to setup customizations in bash and vim, etc.
cd ~/BatchScripts/setupBash
./setupBash.sh
echo "alias battinfo='upower -i $(upower -e | grep \"battery\") | grep -E \"percent| time\"'" >> ~/.bash_aliases
echo "alias padoff=\"xinput --disable 12\"" >> ~/.bash_aliases
echo "alias padon=\"xinput --enable 12\"" >> ~/.bash_aliases
# Start firewall.
ufw enable
# Setup Slack
echo "Download slack, ubuntu 64 bit .deb file, install with dpkg -i file.deb"
echo "Sometimes there is a small dependency error. Delete the dependency. It is not so necessary."
echo "Edit /var/lib/dpkg/status file after you have installed slack."
# Setup vagrant
cd ~/Documents
vagrant init ubuntu/trusty64
vagrant up
vagrant halt
