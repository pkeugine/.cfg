#!/bin/bash

echo -e "\033[31m adding neovim repository\033[0m"
yes | sudo add-apt-repository ppa:neovim-ppa/stable

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# OK
echo -e "\033[31m adding docker repository\033[0m"
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt -y update
sudo apt -y upgrade

echo -e "\033[31m installing tree command\033[0m"
sudo apt install -y tree

if ! command -v git &> /dev/null
then
    echo -e "\033[31m installing git\033[0m"
    sudo apt install -y git
else
    echo -e "\033[31m git exists. skipping git installation\033[0m"
fi

echo echo -e "\033[31m setting git configuration\033[0m"
git config --global user.email "pkeugine@gmail.com"
git config --global user.name "Eugine Park"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=36000000'

if ! command -v curl &> /dev/null
then
    echo -e "\033[31m installing curl\033[0m"
    sudo apt install -y curl
else
    echo -e "\033[31m curl exists. skipping curl installation\033[0m"
fi

echo -e "\033[31m installing neovim\033[0m"
sudo apt install -y neovim

echo -e "\033[31m installing vim-plug\033[0m"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config --auto vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config --auto vim

echo -e "\033[31m installing net-tools\033[0m"
sudo apt install -y net-tools
echo -e "\033[31m installing ethtool\033[0m"
sudo apt install -y ethtool
# TODO: check if openssh-server is installed
# sudo apt install -y openssh-server

echo -e "\033[31m installing openJDK version 11\033[0m"
sudo apt install -y openjdk-11-jdk

echo -e "\033[31m installing node.js version 10\033[0m"
sudo apt install -y nodejs

echo -e "\033[31m installing npm\033[0m"
sudo apt install -y npm

echo -e "\033[31m installing yarn\033[0m"
sudo npm install --global yarn

echo -e "\033[31m installing nvm\033[0m"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

echo -e "\033[31m installing node.js v16.13.2\033[0m"
nvm install v16.13.2

echo -e "\033[31m installing docker\033[0m"
sudo apt install -y docker-ce

# sudo systemctl enable docker
