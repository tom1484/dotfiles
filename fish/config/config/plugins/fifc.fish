# gazorby/fifc

set -U fifc_exa_opts --icons --long --no-user --no-time

# function trim_trailing_space
#     # Get the last command line
#     set -l last_command (commandline -p)
#     # Trim trailing spaces
#     set last_command (string trim $last_command)
#     # Set the command line back without trailing spaces
#     commandline -r $last_command
# end

# Hook into the selection process
# function fifc_select
#     # Call your original selection command here
#     fifc
#     # Trim trailing space after selection
#     trim_trailing_space
# end

# functions --copy fifc fifc_original

# # Define a new fifc function
# function fifc_new
#     # fifc_original $argv  # Call the original ls with the same arguments
#     # trim_trailing_space
# end

# functions --erase fifc
# functions --copy fifc_new fifc

# Define a new fzf function
# function fzf_new
#     command fzf $argv | string trim
#     # trim_trailing_space
# end

# functions --copy fzf_new fzf
