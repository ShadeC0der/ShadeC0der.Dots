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

MIT — igual que el proyecto original (ver [LICENSE](GentlemanNvim/nvim/LICENSE)).
