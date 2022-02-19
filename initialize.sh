sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt upgrade

sudo apt install tree

sudo apt install git -y
git config --global user.email "pkeugine@gmail.com"
git config --global user.name "Eugine Park"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=36000000'

sudo apt install curl -y

sudo apt install neovim -y
# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo udate-alternatives --config vim

sudo apt install net-tools -y
sudo apt install ethtool -y
sudo apt install openssh-server -y

sudo apt install openjdk-11-jdk -y
# node 10 버전
sudo apt install nodejs -y
sudo apt install npm -y
sudo npm install --global yarn -y
# 여러 node 버전을 다운로드하고 관리하기 위해 nvm 설치
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
# 최신 node LTS
nvm install v16.13.2 -y
