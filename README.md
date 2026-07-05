# ShadeC0der.Dots

Mi configuración personal de entorno de desarrollo, basada en un fork de [**Gentleman.Dots**](https://github.com/Gentleman-Programming/Gentleman.Dots) de [Gentleman Programming](https://github.com/Gentleman-Programming). Todo el crédito de la base va para él y su comunidad — este fork solo adapta la configuración a mi gusto, principalmente en lo visual y en soporte de lenguajes.

## ¿Qué incluye?

- **Neovim** (LazyVim) con LSP, autocompletado e integración con IA — el foco principal de este fork
- **Shells**: Fish, Zsh, Nushell
- **Multiplexores**: Tmux, Zellij
- **Emuladores de terminal**: Alacritty, Kitty, Ghostty
- **Prompt**: Starship

## Cambios respecto al original

- Soporte completo de **Rust** (rustaceanvim + rust-analyzer con clippy, keymaps propios)
- Extras de LazyVim activados: **Python** (pyright + ruff), Astro, Tailwind, TOML, formatting con black
- Auto-guardado al salir de insert mode
- Keybindings de OpenCode remapeados bajo `<leader>ao*`
- Inlay hints activados, twilight desactivado, UI prompts con Snacks
- Ajustes visuales varios (en progreso)

## Uso

```bash
git clone https://github.com/ShadeC0der/ShadeC0der.Dots ~/ShadeC0der.Dots

# Respaldar la config actual y enlazar la de Neovim
mv ~/.config/nvim ~/.config/nvim.bak
ln -s ~/ShadeC0der.Dots/GentlemanNvim/nvim ~/.config/nvim
```

Para la instalación completa del entorno (shells, terminales, multiplexores) el instalador TUI del proyecto original sigue siendo la mejor opción: ver la [guía de instalación de Gentleman.Dots](https://github.com/Gentleman-Programming/Gentleman.Dots#quick-start).

## Documentación útil (del proyecto original)

- [Keymaps de Neovim](https://github.com/Gentleman-Programming/Gentleman.Dots/blob/main/docs/neovim-keymaps.md)
- [Instalación manual](https://github.com/Gentleman-Programming/Gentleman.Dots/blob/main/docs/manual-installation.md)
- [Referencia de herramientas](https://github.com/Gentleman-Programming/Gentleman.Dots/blob/main/docs/tools.md)

## Créditos

Este proyecto es un fork de [Gentleman.Dots](https://github.com/Gentleman-Programming/Gentleman.Dots), creado por **Gentleman Programming**:

- **YouTube**: [@GentlemanProgramming](https://youtube.com/@GentlemanProgramming)
- **Twitch**: [GentlemanProgramming](https://twitch.tv/GentlemanProgramming)
- **Discord**: [Gentleman Programming Community](https://discord.gg/gentleman-programming)

Gracias a todos los que han contribuido al proyecto original:

[![Contributors](https://contrib.rocks/image?repo=Gentleman-Programming/Gentleman.Dots)](https://github.com/Gentleman-Programming/Gentleman.Dots/graphs/contributors)

## Licencia

MIT — igual que el proyecto original (ver [LICENSE](Gentleman 89341 4909  
 04573 37643  
 267 28884 18883 772  
 57 788888884 188888887. 74  
 48 788888888884 188888888887 85  
 7 88888888888884 18888888888888 8.  
 6 888888888888884 1888888888888880 7.  
 7 08888 68884 18887 58881 7  
 48 888 884 188 788 65
884 188  
 6878887 884 188 4888787
58 8888 8884 1888 88882 56
8 78888888888888884 18888888888888888 71
.5 6888888888888884 1888888888888887 42  
 47 888888888888884 188888888888888 758  
 7 8888888888662 .668888888888 8  
 57 388888880 088888884 74  
 8373 6888884 1888886 273  
 03570 .753  
 2 13583 08541.2 Nvim/nvim/LICENSE)).
