#!/usr/bin/env bash

# Garante que o script rode a partir da raiz do repositório, não importa de onde foi chamado
cd "$(dirname "$0")" || exit

# Lista das pastas (pacotes) que o GNU Stow deve gerenciar
PACKAGES=(bin kitty nvim starship tmux zsh)

echo "=== Criando diretórios base ==="
# Importante para o Stow criar symlinks DOS ARQUIVOS e não DAS PASTAS INTEIRAS
mkdir -p ~/.config ~/.local/bin ~/.zsh/cache

echo "=== Aplicando symlinks com GNU Stow ==="
for pkg in "${PACKAGES[@]}"; do
  echo "Stowing: $pkg"
  # -R (Restow) limpa links antigos quebrados e refaz os novos
  stow -R "$pkg"
done

echo "=== Tudo pronto! Dotfiles aplicados. ==="
