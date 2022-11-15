export ZSH="$HOME/.oh-my-zsh"

# zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# plugins
plugins=(
        # oh-my-zsh plugins
        sudo
        copybuffer
        copypath
        history
        dirhistory
        kubectl
        extract

        # external plugins
        zsh-autosuggestions
        zsh-history-substring-search
        zsh-syntax-highlighting
        zsh-z
        # fzf-zsh-plugin
        # fzf-tab
)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

##### GLOBAL CONFIGS #####

# editor
export EDITOR='lvim'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# flutter
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
export FLUTTER_GIT_URL=ssh://git@github.com/flutter/flutter.git

# android studio
export PKG_CONFIG_PATH=/usr/lib/pkgconfig
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/cmdline-tools/tools/bin:$ANDROID_SDK_ROOT/emulator:$PATH

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"

# external configs
# source "$HOME/.scripts.sh"
source "$HOME/.aliasrc"
# source "$HOME/.pathrc"
source "$HOME/.keybindsrc"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# airflow
export AIRFLOW_HOME="$HOME/airflow"
