# ==========================================
# 1. VARIÁVEIS DE AMBIENTE & PATH
# ==========================================
export DISABLE_AUTO_TITLE='true'
export EDITOR=nvim
export RUST_WITHOUT=rust-docs
export FLYCTL_INSTALL="$HOME/.fly"
export ASDF_DATA_DIR=$HOME/.asdf 

# Configuração Limpa do PATH (adiciona caminhos se existirem)
typeset -U path PATH # Garante que não haja duplicatas no PATH
path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$HOME/go/bin"
  "$ASDF_DATA_DIR/bin"
  "$ASDF_DATA_DIR/shims"
  "$FLYCTL_INSTALL/bin"
  "$path[@]"
)
export PATH

# ==========================================
# 2. HISTÓRICO
# ==========================================
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt inc_append_history
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ==========================================
# 3. OPÇÕES DO ZSH (CORE)
# ==========================================
setopt correct              # Correção automática de comandos
setopt extendedglob         # Globbing avançado
setopt nocaseglob           # Case insensitive globbing
setopt numericglobsort      # Ordenação numérica de arquivos
setopt autocd               # Entra na pasta apenas digitando o nome
setopt nobeep               # Sem bip sonoro
# Caracteres que fazem parte de uma palavra (para Ctrl+W etc)
WORDCHARS=${WORDCHARS//\/[&.;]}

# ==========================================
# 4. PLUGINS & FERRAMENTAS (CARREGAMENTO)
# ==========================================

# Configuração do FPATH
# Prioridade: 1. Seus completions manuais > 2. Plugins da comunidade > 3. Sistema
fpath=(
  "$HOME/.zsh/my-completions"
  "$HOME/.zsh/zsh-completions/src"
  $fpath
)

autoload -Uz compinit
local _comp_dumpfile="${ZDOTDIR:-$HOME}/.zcompdump"

# Verifica cache (performance)
local -a _valid_dump
_valid_dump=( "${_comp_dumpfile}"(N.mh-24) )

if (( $#_valid_dump )); then
    compinit -C
else
    compinit
    touch "$_comp_dumpfile"
fi

# Estilização do menu de completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Starship (Prompt)
eval "$(starship init zsh)"

# FZF (Fuzzy Finder)
eval "$(fzf --zsh)"

# Direnv (Ambientes virtuais automáticos)
eval "$(direnv hook zsh)"

# ==========================================
# 5. KEYBINDINGS (ATALHOS)
# ==========================================
bindkey -e # Modo Emacs (padrão)

# Navegação Básica (Home/End/Delete/Insert)
bindkey '^[[7~' beginning-of-line
bindkey '^[[H'  beginning-of-line
[[ -n "${terminfo[khome]}" ]] && bindkey "${terminfo[khome]}" beginning-of-line

bindkey '^[[8~' end-of-line
bindkey '^[[F'  end-of-line
[[ -n "${terminfo[kend]}" ]] && bindkey "${terminfo[kend]}" end-of-line

bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char

# Navegação por Palavras (Ctrl + Setas)
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[Oc'    forward-word
bindkey '^[Od'    backward-word
bindkey '^H'      backward-kill-word # Ctrl+Backspace

# Histórico (Page Up/Down)
bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward

# Atalho Shift+Tab (Undo)
bindkey '^[[Z' undo

# --- MEUS SCRIPTS ---
# Tmux Sessionizer (Opção 2 - Simulação de digitação)
# Ajustado para usar hífen (-) conforme criamos o arquivo
bindkey -s '^y' '^u~/.local/bin/tmux_sessionizer\n'

# ==========================================
# 6. ALIASES
# ==========================================
alias ls='ls --color'
alias ll='exa --icons -al' # Requer 'exa' instalado. Se não tiver, mude para 'ls -al'
alias t2="tree -aC -L 2 -I '.git'"
alias t3="tree -aC -L 3 -I '.git'"

# IMPORTANTE: Removi o --clean para carregar seu LazyVim corretamente
alias vim="nvim --clean" 
alias icat="echo && kitten icat"

# ==========================================
# 7. FUNÇÕES
# ==========================================

# Copiar código para IA (limpo e otimizado)
ia_copy() {
    local target_dir="."
    local ext="py"

    if [ -d "$1" ] && [ -n "$1" ]; then
        target_dir="$1"
        [ -n "$2" ] && ext="$2"
    elif [ -n "$1" ]; then
        ext="$1"
    fi

    echo "🔍 Buscando arquivos '.$ext' em '$target_dir'..."
    find "$target_dir" -type f -name "*.$ext" \
        -not -path '*/venv/*' \
        -not -path '*/.venv/*' \
        -not -path '*/.git/*' \
        -not -path '*/__pycache__/*' \
        -not -path '*/node_modules/*' \
        ! -name "__init__.$ext" \
        -exec printf "\n# ARQUIVO: %s\n" {} \; \
        -exec cat {} \; \
        | wl-copy

    echo "✅ Conteúdo copiado para o clipboard!"
}

# ==========================================
# 8. PLUGINS VISUAIS (SEMPRE NO FINAL)
# ==========================================
# Syntax Highlighting e Autosuggestions devem ser os últimos a carregar
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
