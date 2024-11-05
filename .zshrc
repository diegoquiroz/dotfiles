export PATH=${HOME}/.krew/bin:$HOME/bin:/Users/diego/.deno/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git macos docker-compose zsh-vi-mode zsh-diff-so-fancy)


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
alias cnvim="cd $HOME/.config/nvim && kitty @ set-tab-title --match title: Nvim config && nvim init.lua"
alias laptopmode="yabai --stop-service"
alias desktopmode="yabai --start-service"
alias l="eza --all --long --header --git --icons"
alias tree="eza --git --icons -T --git-ignore"
alias k="kubectl"
alias pn="pnpm"

alias git="hub"
alias gwa="git worktree add"

alias ssh="TERM=xterm-color ssh"

# Laravel stuff
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

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
      # kitty @ set-colors --all --configured ~/.config/kitty/themes/dracula.conf
    else
      # Day
      # kitty @ set-colors --all --configured ~/.config/kitty/themes/dracula.conf
      kitty @ set-colors --all --configured ~/Developer/forks/kitty_gruvbox_theme/gruvbox_light.conf
    fi
}

if [[ $TERM == 'xterm-kitty' ]]; then
    if [[ $OSTYPE == 'darwin24.0' ]]; then
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

# libpq (postgres) stuff
export PKG_CONFIG_PATH="/opt/homebrew/opt/libpq/lib/pkgconfig"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"


#
# Diff so fancy
#
# Configure git to use d-s-f for *all* diff operations
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
# Configure git to use d-s-f for `git add --patch`
git config --global interactive.diffFilter "diff-so-fancy --patch"

# asdf (version manager)
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# asdf end

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
