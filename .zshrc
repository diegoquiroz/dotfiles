export PATH=${HOME}/.krew/bin:$HOME/bin:/Users/diego/.deno/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git macos docker-compose zsh-vi-mode)


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
alias cnvim="cd $HOME/.config/nvim && kitty @ set-tab-title --match title: Nvim config && nvim init.vim"
alias laptopmode="brew services stop yabai"
alias desktopmode="brew services start yabai"
alias l="eza --all --long --header --git --icons"
alias tree="eza --git --icons -T"
alias k="kubectl"
alias pn="pnpm"

alias git="hub"
alias gwa="git worktree add"

# Platzi stuff
alias mss="make ssh-dev"
alias mst="make start-dev"
alias mstop="make stop-dev"
# alias core="conda activate core38 && cd $HOME/Developer/platzi/Platzi/django && kitty @ set-tab-title Platzi Core"
# alias landings-hasura="conda activate core38 && cd $HOME/Developer/platzi/MS-Landings-Hasura && kitty @ set-tab-title MS-Landings-Hasura"
# alias landings="conda activate core38 && cd $HOME/Developer/platzi/MS-Landings && kitty @ set-tab-title MS-Landings"
# alias kraven="conda activate core38 && cd $HOME/Developer/platzi/MS-Kraven && kitty @ set-tab-title MS-Kraven"
alias core="cd $HOME/Developer/platzi/Platzi/django && kitty @ set-tab-title Platzi Core"
alias landings-hasura="cd $HOME/Developer/platzi/MS-Landings-Hasura && kitty @ set-tab-title MS-Landings-Hasura"
alias landings="cd $HOME/Developer/platzi/MS-Landings && kitty @ set-tab-title MS-Landings"
alias kraven="cd $HOME/Developer/platzi/MS-Kraven && kitty @ set-tab-title MS-Kraven"

# Bekka stuff
alias bekka="cd $HOME/Developer/bekka/microservices && kitty @ set-tab-title Bekka"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

# Leadsales stuff
alias services="cd $HOME/Developer/leadsales/services && kitty @ set-tab-title LS Services"
alias integrations="cd $HOME/Developer/leadsales/leadsales-integrations && kitty @ set-tab-title LS Integrations"
alias lsfront="cd $HOME/Developer/leadsales/leadsales && kitty @ set-tab-title LS Front"
alias wiki="cd $HOME/Developer/leadsales/wiki && kitty @ set-tab-title LS Wiki"

export HOMEBREW_NO_AUTO_UPDATE=1
export EDITOR='nvim'
export GIT_EDITOR='nvim'
export VISUAL=$EDITOR
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.local/bin
export DOCKER_BUILDKIT=1

# Dotfiles git alias
alias dotfiles="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

alias darkMode="2>/dev/null defaults read -g AppleInterfaceStyle"

function checkDarkMode() {
    if [[ ( $(darkMode) =~ 'Dark' ) ]]; then
      # Night
      kitty @ set-colors --all --configured ~/Developer/forks/kitty_gruvbox_theme/gruvbox_dark.conf
    else
      # Day
      kitty @ set-colors --all --configured ~/Developer/forks/kitty_gruvbox_theme/gruvbox_light_soft.conf
    fi
}

if [[ $TERM == 'xterm-kitty' ]]; then
    if [[ $OSTYPE == 'darwin23.0' ]]; then
        checkDarkMode
        neofetch|lolcat -t --force
    else
    	kitty @ set-colors --all --configured ~/Developer/forks/github-nvim-theme/terminal/kitty/github_dark.conf
    fi
fi

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
# source "${VIRTUAL_ENV}/bin/activate"  # commented out by conda initialize
fi
export PATH="/usr/local/opt/llvm/bin:$PATH"


# NVM stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



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

export PATH="/usr/local/opt/node@16/bin:$PATH"
# alias gcc=gcc-11

# Created by `pipx` on 2022-07-03 22:48:01
export PATH="$PATH:/Users/diego/.local/bin"

# pnpm
export PNPM_HOME="/Users/diego/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export GITHUB_TOKEN="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"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"


# Herd injected PHP binary.
export PATH="/Users/diego/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/diego/Library/Application Support/Herd/config/php/82/"

. /opt/homebrew/opt/asdf/libexec/asdf.sh
