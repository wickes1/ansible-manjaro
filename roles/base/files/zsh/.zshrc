# ZSH
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
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
        zsh-completions
        zsh-history-substring-search
        zsh-syntax-highlighting
        zsh-z
)
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# Editor
export EDITOR='lvim'

# Global Envs
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

# External configs
source "$HOME/.aliasrc"
source "$HOME/.pathrc"
source "$HOME/.keybindsrc"
