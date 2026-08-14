#!/usr/bin/env bash

# Instala estos dotfiles en el sistema.
# Uso: bash install.sh [--dry-run]
#
# Dos estrategias según quién manda sobre el archivo:
#
#   SYMLINK  para lo que solo tocas tú (nvim, starship): editas el repo y el
#            cambio es inmediato, sin copiar nada.
#   COPIA    para lo que HyDE regenera (kitty, zsh): un symlink aquí haría que
#            HyDE sobrescribiera el repo al cambiar de tema. Se copia y punto.

set -euo pipefail

DOTS="$(dirname "$(realpath "$0")")"
DRY_RUN=0
[ "${1:-}" = "--dry-run" ] && DRY_RUN=1

GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; CYAN='\033[0;36m'; NC='\033[0m'
info()  { echo -e "${GREEN}[+]${NC} $1"; }
warn()  { echo -e "${YELLOW}[!]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }
step()  { echo -e "\n${CYAN}══ $1 ══${NC}"; }

run() { [ $DRY_RUN -eq 1 ] && echo "    → $*" || "$@"; }

[ $DRY_RUN -eq 1 ] && warn "modo simulación: no se modifica nada"

# ─── Neovim (symlink) ─────────────────────────────────────────────────────────

step "Neovim"

if [ -e "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
  BAK="$HOME/.config/nvim.bak-$(date +%Y%m%d-%H%M%S)"
  warn "~/.config/nvim existe y no es symlink → respaldando en $(basename "$BAK")"
  run mv "$HOME/.config/nvim" "$BAK"
fi
run ln -sfn "$DOTS/nvim" "$HOME/.config/nvim"
info "~/.config/nvim → repo"

# ─── Starship (symlink) ───────────────────────────────────────────────────────

step "Starship"

run mkdir -p "$HOME/.config/starship"
run ln -sfn "$DOTS/starship/starship.toml" "$HOME/.config/starship/starship.toml"
info "starship.toml → repo"
warn "HyDE solo carga starship si HYDE_ZSH_PROMPT está definida."
warn "En esta máquina user.zsh hace 'unset HYDE_ZSH_PROMPT' → el prompt es Powerlevel10k."

# ─── Zsh (copia: HyDE gestiona \$ZDOTDIR) ─────────────────────────────────────

step "Zsh"

ZDOT="${ZDOTDIR:-$HOME/.config/zsh}"

if [ -d "$ZDOT" ] && [ -f "$ZDOT/.zshrc" ]; then
  # Máquina con HyDE: él pone .zshrc y nosotros solo aportamos user.zsh y el prompt.
  run install -m 644 "$DOTS/zsh/user.zsh"  "$ZDOT/user.zsh"
  run install -m 644 "$DOTS/zsh/.p10k.zsh" "$ZDOT/.p10k.zsh"
  info "user.zsh y .p10k.zsh → $ZDOT"
else
  # Máquina sin HyDE: hace falta el .zshrc autónomo de oh-my-zsh.
  warn "sin \$ZDOTDIR de HyDE → instalando el .zshrc autónomo en \$HOME"
  run install -m 644 "$DOTS/zsh/.zshrc"    "$HOME/.zshrc"
  run install -m 644 "$DOTS/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
  info ".zshrc y .p10k.zsh → \$HOME"
  warn "requiere oh-my-zsh y powerlevel10k instalados"
fi

# ─── Kitty (copia: HyDE regenera hyde.conf y theme.conf) ──────────────────────

step "Kitty"

run mkdir -p "$HOME/.config/kitty"
for f in kitty.conf hyde.conf theme.conf; do
  [ -f "$DOTS/kitty/$f" ] && run install -m 644 "$DOTS/kitty/$f" "$HOME/.config/kitty/$f"
done
info "configs de kitty copiadas"
warn "hyde.conf y theme.conf los regenera HyDE al cambiar de tema: son un snapshot"

# ─── Git ──────────────────────────────────────────────────────────────────────

step "Git"

run mkdir -p "$HOME/.config/git"
run install -m 644 "$DOTS/git/ignore" "$HOME/.config/git/ignore"
info "~/.config/git/ignore"
warn "gitconfig y gitignore_global NO se instalan solos (llevan tu identidad):"
warn "  cp $DOTS/git/gitconfig $HOME/.gitconfig"

# ─── Tmux ─────────────────────────────────────────────────────────────────────

if [ -d "$DOTS/GentlemanTmux" ]; then
  step "Tmux"
  warn "GentlemanTmux se instala aparte, ver su README"
fi

echo
info "listo. Abre una shell nueva para recargar zsh."
