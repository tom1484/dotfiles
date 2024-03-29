# push/pull Documents
# alias pd='~/.config/zsh/script/push_documents.sh'
# alias pp='~/.config/zsh/script/pull_documents.sh'

# easy push
# alias update-repo="~/.config/zsh/script/update-repo.sh"
#
# alias set-go-path="~/.config/zsh/script/set-go-path.sh"
# alias create-go-project="~/.config/zsh/script/create-go-project.sh"
#
# alias jupyter-notebook="~/.local/bin/jupyter-notebook --no-browser"
# alias jupyter-lab="~/.local/bin/jupyter-lab --no-browser"

# git alias
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gf="git fetch"
alias gr="git rebase"

alias gfz="git fuzzy"

if type -q exa
    alias ls="exa"
end
if type -q nvim
    alias vim="nvim"
end
# if type -q rip
#     alias rm="rip"
# end

# esp-idf
alias get_idf=". $HOME/esp/esp-idf/export.fish"

