### Create folders for installation
mkdir tmp

### Update default packages
sudo apt update
sudo apt upgrade

### Additionals
# basic utilities
sudo apt install -y \
	tree \
	net-tools \
	curl
# compilation relevant
sudo apt install -y \
	build-essential \
	cmake \
	pkg-config

### Programming languages
# python
sudo apt install -y \
	python3-pip \
	python3-venv
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
# rust
curl https://sh.rustup.rs -sSf | sh
# golang
wget https://go.dev/dl/go1.20.linux-amd64.tar.gz -O tmp/go.tar.gz
sudo tar -C /usr/local -xzf tmp/go.tar.gz
# node
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
nvm install 18.14.2 --default
npm install --global yarn pnpm
# julia
wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.5-linux-x86_64.tar.gz -O tmp/julia.tar.gz
tar -C tmp/ -xzf tmp/julia.tar.gz
sudo mv tmp/julia-1.8.5 /usr/local/julia

### CLI utilities
# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# fd
sudo apt install -y fd-find
# bat
sudo apt install bat
sudo ln -s /usr/bin/batcat /usr/bin/bat
# broot
cargo install --locked broot
broot

### Configurations
cd ./zsh && sh ./setup.sh && cd ../
cd ./zsh && sh ./setup.sh && cd ../
cd ./zsh && sh ./setup.sh && cd ../

### Clean
rm -rf tmp
