### Create folders for installation
mkdir tmp

### Installations
# tmux
sudo apt install -y tmux
# tmp
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### Configurations
cp .tmux.conf ~/
mkdir -p ~/.tmux
cp -r config/* ~/.tmux/

### Clean
rm -rf tmp
