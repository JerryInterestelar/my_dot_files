# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

#pyenv
#
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias pdf='apvlv'
alias ll='exa --icons -al'
alias cat='bat'
alias icat="echo && kitten icat"
alias config="git --git-dir=$HOME/codes/.dotfiles/.git --work-tree=$HOME"

export PATH=~/.local/bin:$PATH

export EDITOR=nvim

export PATH=~/.cargo/bin/:$PATH
