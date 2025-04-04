# original: https://gist.github.com/klazuka/cf516db5eab564704527 
#
# Change the terminal title automatically based on current process / working-directory
#
# The main improvement over the default 'fish_title' behavior
# is that I use the name of the current git repo, if any, as
# opposed to the raw working-directory
function fish_title
    if [ $TERM_PROGRAM = 'zed' ] || [ $TERM_PROGRAM = 'vscode' ]
        return
    end

    set -l command (echo $_)

    if test $command = "fish"
        # we are sitting at the fish prompt

        if git rev-parse --git-dir &> /dev/null
            # we are inside a git directory, so use the name of the repo as the terminal title

            set -l git_dir (git rev-parse --git-dir)
            if test $git_dir = ".git"
                # we are at the root of the git repo
                echo (basename (pwd))
            else
                # we are at least one level deep in the git repo
                echo (basename (dirname $git_dir))
            end
        else
            # we are NOT inside a git repo, so just use the working-directory
            echo (basename (pwd))
        end
    else
        # we are busy running some non-fish command, so use the command name
        echo $command
    end
end
