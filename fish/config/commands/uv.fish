alias upip="uv pip"
alias up="uv run"

function act
    if test -f .venv/bin/activate.fish
        source .venv/bin/activate.fish
    end
end

alias deact="deactivate"
