export PATH=$HOME/bin:/Users/diego/.deno/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx docker-compose zsh-vi-mode)


source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8
# Remove '%' sign
unsetopt PROMPT_SP

# ZSH-VI-MODE configs
function zvm_before_init() {
  zvm_bindkey viins '^[[A' history-beginning-search-backward
  zvm_bindkey viins '^[[B' history-beginning-search-forward
  zvm_bindkey vicmd '^[[A' history-beginning-search-backward
  zvm_bindkey vicmd '^[[B' history-beginning-search-forward
}

zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --type file --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# My stuff

alias web=~/Developer/shell/web
alias counter=~/Developer/shell/counter
alias sp=spotify
alias doom=~/.emacs.d/bin/doom
alias preview="qlmanage -p"
alias cnvim="nvim $HOME/.config/nvim/init.vim"
alias laptopmode="brew services stop yabai"
alias desktopmode="brew services start yabai"
alias l="exa --all --long --header --git"

export HOMEBREW_NO_AUTO_UPDATE=1
export EDITOR='nvim'
export GIT_EDITOR='nvim'
export VISUAL=$EDITOR
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Dotfiles git alias
alias dotfiles="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

alias darkMode="2>/dev/null defaults read -g AppleInterfaceStyle"

function checkDarkMode() {
    if [[ ( $(darkMode) =~ 'Dark' ) ]]; then
    	#kitty @ set-colors --all --configured ~/.config/kitty/primer-dark.conf
    	#kitty @ set-colors --all --configured ~/.config/kitty/material-ocean.conf
    	kitty @ set-colors --all --configured ~/.config/kitty/onehalf-dark.conf
    else
    	kitty @ set-colors --all --configured ~/.config/kitty/material-lighter.conf
    	#kitty @ set-colors --all --configured ~/.config/kitty/primer-light.conf
    fi
}

if [[ $TERM == 'xterm-kitty' ]]; then
    if [[ $OSTYPE == 'darwin20.0' ]]; then
        checkDarkMode
        neofetch|lolcat -t --force
    else
    	kitty @ set-colors --all --configured ~/.config/kitty/primer-dark.conf

    fi
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
#cd $HOME
