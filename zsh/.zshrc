if [ -e "$HOME/.zshrc-local-early" ]; then
	source "$HOME/.zshrc-local-early"
fi

export PATH="$HOME/local/bin:$PATH"

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Key bindings
bindkey -e # Use emacs style editing

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## Prompt
eval "$(starship init zsh)"

alias vim=nvim
alias vi=nvim
export EDITOR=nvim

alias gc="git commit -v"
alias gca="git commit -av"

if [ -e "$HOME/.zshrc-local" ]; then
	source "$HOME/.zshrc-local"
fi
