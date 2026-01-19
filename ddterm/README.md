## Usage

Install desired profile using Gogh in GNOME Terminal:

```bash
# Clone the repo into "$HOME/src/gogh"
mkdir -p "$HOME/<SOMEWHERE>"
cd "$HOME/<SOMEWHERE>"
git clone https://github.com/Gogh-Co/Gogh.git gogh
cd gogh

# necessary in the Gnome terminal on ubuntu
export TERMINAL=gnome-terminal

# Enter theme installs dir
cd installs

# install themes
./kanagawa-wave.sh
```

Then apply the profile to ddterm by:

```bash
./apply-gnome-terminal-profile.sh "Kanagawa Wave"
```