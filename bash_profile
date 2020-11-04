export PATH=$PATH:~/bin

function parse_git_branch () {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Bash Prompt Customization
STANDOUT=$(tput smso)
BOLD=$(tput bold)
CYAN=$(tput setaf 6)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
YELLOW=$(tput setaf 3)
PURPLE=$(tput setaf 5)
RESET=$(tput sgr0)

PS1="$CYAN\t $GREEN[$RED@$YELLOW\h$CYAN \W$GREEN]$RESET\$(parse_git_branch)$RESET \n\$ "

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# bash git completion per instructions here: https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Never leave tmux
_not_inside_tmux() {
  [[ -z "$TMUX" ]]
}

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running

# Aliases
alias turing="cd ~/Dropbox/Sebastian/Studies/Turing/"
alias sandlot="cd ~/dropbox/sebastian/sandlot/"
alias upcase="cd ~/dropbox/sebastian/studies/upcase/"
alias practice="cd ~/Dropbox/Sebastian/Studies/practice"
alias terakeet="cd ~/Dropbox/sebastian/terakeet"
alias dotfiles="cd ~/Dropbox/Sebastian/dotfiles"

# Enable history in IEx
export ERL_AFLAGS="-kernel shell_history enabled"
# Let IEx know what editor to use
export ELIXIR_EDITOR="tmux split-window -t 0 'vi +__LINE__ __FILE__'"

# asdf (https://asdf-vm.com/#/core-manage-asdf-vm)
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

export PATH="$HOME/.poetry/bin:$PATH"
