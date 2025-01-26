if test -f /Users/tom1484/miniforge3/bin/conda
    source ~/.config/fish/config/hooks/conda.fish
end

if not set -q VIRTUAL_ENV
    conda activate base
end
