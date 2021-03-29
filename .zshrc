export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/Users/diego/.oh-my-zsh"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx docker-compose zsh-vi-mode)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Remove '%' sign
unsetopt PROMPT_SP

## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
#typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off
#function p10k-on-pre-prompt() {}
#function p10k-on-post-prompt() {}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --type file --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# My stuff
neofetch|lolcat -t --force

alias web=~/Developer/shell/web
alias counter=~/Developer/shell/counter
alias sp=spotify
alias doom=~/.emacs.d/bin/doom
alias preview="qlmanage -p"
alias cnvim="nvim $HOME/.config/nvim/"
alias laptopmode="brew services stop yabai"
alias desktopmode="brew services start yabai"

export HOMEBREW_NO_AUTO_UPDATE=1
export EDITOR='nvim'
export GIT_EDITOR='nvim'

# Dotfiles git alias
alias dotfiles="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

alias darkMode="2>/dev/null defaults read -g AppleInterfaceStyle"

function checkDarkMode() {
    if [[ ( $(darkMode) =~ 'Dark' ) ]]; then
    	kitty @ set-colors --all --configured ~/.config/kitty/dracula.conf
    else
    	kitty @ set-colors --all --configured ~/.config/kitty/onehalf-light.conf
    fi
}

if [[ $TERM == 'xterm-kitty' && $OSTYPE == 'darwin20.0' ]]; then
    checkDarkMode
fi

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
# source "${VIRTUAL_ENV}/bin/activate"  # commented out by conda initialize
fi
export PATH="/usr/local/opt/llvm/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"
