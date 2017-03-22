#!/bin/bash
sudo apt-get update
sudo apt-get -y install emacs radare2 valgrind p7zip-full tshark shellcheck python3-pip
sudo pip3 install pep8
git clone https://github.com/holbertonschool/Betty.git ~/Betty
cp bash_aliases ~/.bash_aliases
cp emacsrc ~/.emacsrc
cp vimrc ~/.vimrc
cp -r vim ~/.vim
sed -i 's/\#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc
echo 'export PS1="\A~ \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$"' >> ~/.bashrc
echo 'export TZ="/usr/share/zoneinfo/America/Los_Angeles"' >> ~/.bashrc
echo -e "betty() {\n    /home/$(whoami)/Betty/betty-doc.pl \$1\n     /home/$(whoami)/Betty/betty-style.pl \$1\n}\n" >> ~/.bashrc
#setup Git
git config --global user.email "ian.liu-johnson@holbertonschool.com"
git config --global user.name "Ian Liu-Johnston"
if [ ! -a ~/.ssh ]; then
		mkdir ~/.ssh
fi
cat config >> ~/.ssh/config
pushd ~/holbertonschool-low_level_programming
git clone https://github.com/ianliu-johnston/holbertonschool-low_level_programming.git ~/holbertonschool-low_level_programming
git remote set-url origin git@github.com:ianliu-johnston/holbertonschool-low_level_programming.git
popd
pushd ~/holbertonschool-higher_level_programming
git clone https://github.com/ianliu-johnston/holbertonschool-higher_level_programming.git ~/holbertonschool-higher_level_programming
git remote set-url origin git@github.com:ianliu-johnston/holbertonschool-higher_level_programming.git
popd
. eval $(ssh-agent -s)
. ssh-add ~/.ssh/git
