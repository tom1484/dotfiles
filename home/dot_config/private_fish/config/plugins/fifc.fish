# gazorby/fifc

set -U fifc_exa_opts --icons --long --no-user --no-time

# Override autopair's Tab binding with fifc
# This runs after conf.d scripts, so it overrides autopair's binding
for mode in default insert
    bind --mode $mode \t _fifc
end

# Also handle future fish_key_bindings changes (which trigger autopair to rebind Tab)
function _fifc_rebind_tab --on-variable fish_key_bindings
    for mode in default insert
        bind --mode $mode \t _fifc
    end
end

# Fix trailing space issue: wrap _fifc to trim trailing space after completion
functions --copy _fifc _fifc_original

function _fifc
    _fifc_original $argv
    # Trim trailing space from the right side of command line
    commandline -r (string trim -r (commandline))
end
