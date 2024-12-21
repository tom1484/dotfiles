set -U fifc_exa_opts --icons --long --no-user --no-time

function trim_trailing_space
    # Get the last command line
    set -l last_command (commandline -p)
    # Trim trailing spaces
    set last_command (string trim $last_command)
    # Set the command line back without trailing spaces
    commandline -r $last_command
end

# Hook into the selection process
function fifc_select
    # Call your original selection command here
    fifc
    # Trim trailing space after selection
    trim_trailing_space
end
