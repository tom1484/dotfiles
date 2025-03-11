if test -f ~/miniforge3/bin/conda
    source ~/.config/fish/hooks/conda.fish
end

if not set -q VIRTUAL_ENV
    conda activate base
end
