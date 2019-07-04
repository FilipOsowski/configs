# Installing applications
sudo apt install -y tmux
sudo apt install -y vim-gtk
sudo apt install -y trash-cli

# Getting my configs
git clone https://github.com/FilipOsowski/configs configs
mv configs/.vimrc ~/.vimrc
mv configs/.tmux.conf ~/.tmux.conf
sudo chmod 777 .vimrc
sudo chmod 777 .tmux.conf

# Adding vim bindings to bash
echo "set -o vi" >> ~/.bashrc
sudo bash configs/install_vim_system_clipboard.sh

# Install Vundle and plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo chmod 777 -R ~/.vim
vim +PluginInstall +qall
# TODO

# Installing conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda

# Reloading configs
exec bash -l
