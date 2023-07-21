### Create folders for installation
mkdir tmp

### Installations
# fish
sudo apt install -y fish
chsh -s $(which fish)

# fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
# starship
cargo install starship
# fzf.fish
fisher install PatrickF1/fzf.fish
# z
fisher install jethrokuan/z
# sponge
fisher install andreiborisov/sponge
# auto-pair
fisher install jorgebucaran/autopair.fish
# nvm
fisher install jorgebucaran/nvm.fish
nvm install v18.14.2
# mamba
wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh -O tmp/mamba.sh
sh tmp/mamba.sh
mamba init fish

### Configurations
cp -r config/* ~/.config/fish/

### Clean
rm -rf tmp
