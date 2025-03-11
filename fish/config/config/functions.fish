function source_directory
    set script_folder $argv[1]

    if test -d $script_folder
        for script in $script_folder/*.fish
            if not string match -q -- "_*" (basename $script)
                source $script
            end
        end
    else
        echo "Folder $script_folder does not exist."
    end
end

function fish_remove_path
    # Expand the input path to an absolute path
    set -l target_path (readlink -f $argv[1])

    # Filter out the target path from fish_user_paths
    set -U fish_user_paths (for p in $fish_user_paths
        set -l abs_path (readlink -f $p)
        if test $abs_path != $target_path
            echo $p
        end
    end)
end

function load_env --description 'Load environment variables from a .env file'
    for line in (cat $argv[1] | sed '/^\s*#/d;/^\s*$/d')
        # Split the line on the first '=' character
        set -l key (echo $line | cut -d '=' -f 1)
        set -l value (echo $line | cut -d '=' -f 2-)
        # Export the variable to the environment
        set -gx $key $value
    end
end
