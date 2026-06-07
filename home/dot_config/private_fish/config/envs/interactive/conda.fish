function conda-init -d "initialize conda shell functions"
    if type conda | grep -q alias
        echo "initializing conda..."

        if test -f $HOME/miniforge3/bin/conda
            eval $HOME/miniforge3/bin/conda "shell.fish" "hook" $argv | source
        else
            if test -f "$HOME/miniforge3/etc/fish/conf.d/conda.fish"
                . "$HOME/miniforge3/etc/fish/conf.d/conda.fish"
            else
                set -x PATH "$HOME/miniforge3/bin" $PATH
            end
        end
    end
end

function pip -d pip
    if not set -q VIRTUAL_ENV
        conda-init
        functions -e pip
    end
    command pip $argv
end

function python -d python
    if not set -q VIRTUAL_ENV
        conda-init
        functions -e python
    end
    command python $argv
end

function pip3 -d pip3
    if not set -q VIRTUAL_ENV
        conda-init
        functions -e pip3
    end
    command pip3 $argv
end

function python3 -d python3
    if not set -q VIRTUAL_ENV
        conda-init
        functions -e python3
    end
    command python3 $argv
end

function py -d python3
    if not set -q VIRTUAL_ENV
        conda-init
        functions -e py
    end
    alias py python3
    command python3 $argv
end

function ipy -d ipython
    if not set -q VIRTUAL_ENV
        conda-init
        functions -e ipy
        alias ipy ipython
    end
    command ipython $argv
end

alias conda "conda-init; conda"

