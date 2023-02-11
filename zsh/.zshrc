# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.config/zsh/config/basic.zsh
source ~/.config/zsh/config/keymap.zsh
source ~/.config/zsh/config/command.zsh
source ~/.config/zsh/config/completion.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /home/tom1484/.config/broot/launcher/bash/br
