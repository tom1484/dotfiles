### Create folders for installation
mkdir tmp

### Update default packages
sudo apt update
sudo apt upgrade

### Additional packages
# basic utilities
sudo apt install -y \
	tree \
	net-tools
# compilation relevant
sudo apt install -y \
	build-essential \
	cmake \
	pkg-config

### Programming languages
# python
sudo apt install -y \
	python3-pip \
	python3.10-venv
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
# rust
curl https://sh.rustup.rs -sSf | sh
# golang
wget https://go.dev/dl/go1.20.linux-amd64.tar.gz -O tmp/go.tar.gz
sudo tar -C /usr/local -xzf tmp/go.tar.gz
# javascript
sudo apt install -y npm
sudo npm install --global yarn
# julia
wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.5-linux-x86_64.tar.gz -O tmp/julia.tar.gz
tar -C tmp/ -xzf tmp/julia.tar.gz
sudo mv tmp/julia-1.8.5 /usr/local/julia

### Configurations
sh zsh/setup.sh
sh tmux/setup.sh
sh nvim/setup.sh

### Clean
rm -rf tmp
