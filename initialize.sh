#!/bin/bash

echo adding neovim repository
sudo add-apt-repository ppa:neovim-ppa/stable

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# OK
echo adding docker repository
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update
sudo apt upgrade

echo installing tree command
sudo apt install -y tree

if ! command -v git &> /dev/null
then
    echo installing git
    sudo apt install -y git
else
    echo git exists. skipping git installation
fi

echo setting git configuration
git config --global user.email "pkeugine@gmail.com"
git config --global user.name "Eugine Park"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=36000000'

if ! command -v curl &> /dev/null
then
    echo installing curl
    sudo apt install -y curl
    sudo apt install -y git
else
    echo curl exists. skipping curl installation
fi

sudo apt install -y neovim
# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo udate-alternatives --config vim

sudo apt install -y net-tools
sudo apt install -y ethtool
sudo apt install -y openssh-server

echo installing openJDK version 11
sudo apt install -y openjdk-11-jdk

echo installing node.js version 10
sudo apt install nodejs

echo installing npm
sudo apt install npm

echo installing yarn
sudo npm install --global yarn
# 여러 node 버전을 다운로드하고 관리하기 위해 nvm 설치
echo installing nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

echo installing node.js v16.13.2
nvm install v16.13.2

echo installing docker
sudo apt install -y docker-ce

# sudo systemctl enable docker
