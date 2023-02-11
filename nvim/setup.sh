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

### Configurations

### Clean
rm -rf tmp
