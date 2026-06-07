function find_disable_files
    set dir (realpath $argv[1])
    set config_dir (realpath ~/.config)
    set disable_files
    while test $dir != / -a $dir != $config_dir
        if test -f "$dir/.disable"
            set disable_files $disable_files $dir/.disable
        end
        set dir (dirname $dir)
    end
    echo $disable_files
end

function read_disable_files
    set disable_files (find_disable_files $argv[1])
    set -l disable_files (string split " " $disable_files)

    if test -z "$disable_files"
        return
    end

    set all_disabled_files
    for disable_file in $disable_files
        set dir (dirname $disable_file)
        for line in (cat $disable_file | grep -v '^\s*#' | grep -v '^\s*$')
            set all_disabled_files $all_disabled_files $dir/$line
        end
    end
    echo $all_disabled_files
end

function source_directory
    set script_folder $argv[1]

    set disabled_files (read_disable_files $script_folder)
    set -l disabled_files (string split " " $disabled_files)

    if test -d $script_folder
        for script in $script_folder/*.fish
            if not string match -q -- "_*" (basename $script)
                set path (realpath $script)
                if not contains -- $path $disabled_files
                    source $script
                end
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
