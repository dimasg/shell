source $HOME/.config/fish/conf.d/abbr.fish

set -gx  PATH "$HOME/bin" $PATH "/usr/local/bin"

set -x EDITOR vim
set -x FZF_DEFAULT_COMMAND 'ag -g "" --hidden --ignore .git'

set -x NVM_DIR "$HOME/.nvm"
if [ $TERM_PROGRAM != "xvscode" ]
	[ -s "/usr/local/opt/nvm/nvm.sh" ] && sh "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
end

set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x DOTNET_CLI_TELEMETRY_OPTOUT 1
set -x DOTNET_WATCH_SUPPRESS_LAUNCH_BROWSER 1

# pnpm
set -x PNPM_HOME "/Users/dvg/Library/pnpm"
fish_add_path -pm $PNPM_HOME
# pnpm end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
