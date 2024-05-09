# alias jupyter-notebook="~/.local/bin/jupyter-notebook --no-browser"
# alias jupyter-lab="~/.local/bin/jupyter-lab --no-browser"

# git alias
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gf="git fetch"
alias gr="git rebase"
alias gl="git log --oneline --graph --decorate --all"

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

