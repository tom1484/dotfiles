### Create folders for installation
mkdir tmp

### Dependencies
sudo apt install -y libncurses-dev

### Installations
# fish
git clone https://github.com/fish-shell/fish-shell.git tmp/fish-shell
cd tmp/fish-shell && git checkout Integration_3.6.0
mkdir build && cd build
cmake .. && make -j4 && sudo make install
sudo ln -s /usr/local/bin/fish /usr/bin/fish
chsh -s $(which fish)

# fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# starship
curl -sS https://starship.rs/install.sh | sh
# tide
# fisher install IlanCosman/tide@v5
# fzf.fish
fisher install PatrickF1/fzf.fish
# z
# fisher install jethrokuan/z
# sponge
# fisher install andreiborisov/sponge
# auto-pair
# fisher install jorgebucaran/autopair.fish
# transient
fisher install zzhaolei/transient.fish

### Configurations
# cp .zshrc ~/
# mkdir -p ~/.config/zsh
# cp -r config/* ~/.config/zsh/

### Clean
# rm -rf tmp
