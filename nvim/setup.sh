### Create folders for installation
mkdir tmp

### Installations
# neovim
sudo apt install gettext
git clone https://github.com/neovim/neovim tmp/neovim
cd tmp/neovim && make -j4 CMAKE_BUILD_TYPE=Release
sudo make install && cd ../..
# tree-sitter
cargo install tree-sitter-cli
# ripgrep
cargo install ripgrep
# pylsp
pip3 install python-lsp-server

### Configurations
mkdir -p ~/.config/nvim
cp -r config/* ~/.config/nvim/

### Clean
rm -rf tmp
