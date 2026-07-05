# ShadeC0der.Dots

Mis dotfiles: la configuración real que uso a diario en Arch Linux con [HyDE](https://github.com/HyDE-Project/HyDE) (Hyprland). La config de Neovim nació como fork de [**Gentleman.Dots**](https://github.com/Gentleman-Programming/Gentleman.Dots) de [Gentleman Programming](https://github.com/Gentleman-Programming) — todo el crédito de esa base va para él y su comunidad.

## Estructura

| Carpeta | Qué es | Destino en el sistema |
|---|---|---|
| `nvim/` | Neovim (LazyVim) — base Gentleman.Dots + mis cambios | `~/.config/nvim` |
| `zsh/` | `.zshrc` (oh-my-zsh + Powerlevel10k) y `.p10k.zsh` | `~/.zshrc`, `~/.p10k.zsh` |
| `starship/` | Prompt Starship | `~/.config/starship/starship.toml` |
| `kitty/` | Terminal Kitty (integrada con HyDE) | `~/.config/kitty/` |

> Los archivos de kitty (`hyde.conf`, `theme.conf`) los regenera HyDE al cambiar de tema; aquí guardo mi snapshot.

## Cambios de nvim respecto a Gentleman.Dots

- Soporte completo de **Rust** (rustaceanvim + rust-analyzer con clippy, keymaps propios)
- Extras de LazyVim activados: **Python** (pyright + ruff), Astro, Tailwind, TOML, formatting con black
- Header del dashboard con lettering propio (figlet `delta_corps_priest_1`)
- Auto-guardado al salir de insert mode
- Keybindings de OpenCode remapeados bajo `<leader>ao*`
- Inlay hints activados, twilight desactivado, UI prompts con Snacks

## Uso

```bash
git clone git@github.com:ShadeC0der/ShadeC0der.Dots.git ~/Proyectos/ShadeC0der.Dots
cd ~/Proyectos/ShadeC0der.Dots

# Neovim
mv ~/.config/nvim ~/.config/nvim.bak
ln -s "$PWD/nvim" ~/.config/nvim

# Zsh (requiere oh-my-zsh y powerlevel10k instalados)
ln -sf "$PWD/zsh/.zshrc" ~/.zshrc
ln -sf "$PWD/zsh/.p10k.zsh" ~/.p10k.zsh

# Starship
mkdir -p ~/.config/starship
ln -sf "$PWD/starship/starship.toml" ~/.config/starship/starship.toml
```

## Créditos

- La configuración de Neovim está basada en [Gentleman.Dots](https://github.com/Gentleman-Programming/Gentleman.Dots) de **Gentleman Programming** ([YouTube](https://youtube.com/@GentlemanProgramming) · [Twitch](https://twitch.tv/GentlemanProgramming) · [Discord](https://discord.gg/gentleman-programming)). Gracias también a todos los [contribuidores del proyecto original](https://github.com/Gentleman-Programming/Gentleman.Dots/graphs/contributors):

  [![Contributors](https://contrib.rocks/image?repo=Gentleman-Programming/Gentleman.Dots)](https://github.com/Gentleman-Programming/Gentleman.Dots/graphs/contributors)

- El entorno de escritorio (Hyprland, waybar, temas de kitty) es de [HyDE](https://github.com/HyDE-Project/HyDE).

## Licencia

MIT — igual que el proyecto original (ver [LICENSE](nvim/LICENSE)).
