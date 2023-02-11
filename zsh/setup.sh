### Create folders for installation
mkdir tmp

### Installations
# zsh
sudo apt install -y zsh
chsh -s $(which zsh)
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
# zsh-autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# autojump
git clone https://github.com/wting/autojump.git tmp/autojump
cd tmp/autojump && ./install.py && cd ../..
# git-fuzzy
git clone https://github.com/bigH/git-fuzzy.git ~/.oh-my-zsh/plugins/git-fuzzy
sudo apt install bc

### Configurations
cp .zshrc ~/
mkdir -p ~/.config/zsh
cp -r config/* ~/.config/zsh/

### Clean
rm -rf tmp
