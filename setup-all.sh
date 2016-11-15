#!/bin/bash
# This is recommended to run in clean slate user.
# run this in ~/junhosetting
# run this with   `sh setup-all.sh` and exit just after `zsh` is installed to proceed following configurations.

# install zsh and ohmyz.sh
sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"  # install

# install zsh highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo 'source ~/junhosetting/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ${ZDOTDIR:-$HOME}/.zshrc
# source zsh later

# concat my alias to .zshrc
cat ~/junhosetting/alias >> ~/.zshrc

# install tmux and set tmux.conf
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install -y tmux=2.0-1~ppa1~t


git clone https://github.com/tmux-plugins/tmux-resurrect ~/junhosetting/tmux-resurrect

cp ~/junhosetting/tmux.conf ~/.tmux.conf
tmux source ~/.tmux.conf

# install vim and copy .vimrc
sudo apt-get install vim -y
cp ~/junhosetting/vimrc ~/.vimrc
# install vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall

# change default shell
sudo chsh -s /usr/bin/zsh ${USER}

echo "Now enjoy! start with command : zsh!"
zsh
