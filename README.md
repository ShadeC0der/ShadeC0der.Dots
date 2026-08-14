# ShadeC0der.Dots

Mis dotfiles: la configuración real que uso a diario en Arch Linux con [HyDE](https://github.com/HyDE-Project/HyDE) (Hyprland). La config de Neovim nació como fork de [**Gentleman.Dots**](https://github.com/Gentleman-Programming/Gentleman.Dots) de [Gentleman Programming](https://github.com/Gentleman-Programming) — todo el crédito de esa base va para él y su comunidad.

## Estructura

| Carpeta | Qué es | Destino en el sistema | Método |
|---|---|---|---|
| `nvim/` | Neovim (LazyVim) — base Gentleman.Dots + mis cambios | `~/.config/nvim` | symlink |
| `zsh/` | `user.zsh` (mi capa sobre HyDE) y `.p10k.zsh` | `$ZDOTDIR/` | copia |
| `starship/` | Prompt Starship | `~/.config/starship/starship.toml` | symlink |
| `kitty/` | Terminal Kitty (integrada con HyDE) | `~/.config/kitty/` | copia |
| `git/` | `ignore` global + plantilla de `gitconfig` | `~/.config/git/` | copia |

**Symlink** para lo que solo toco yo; **copia** para lo que HyDE regenera —
un symlink ahí haría que HyDE sobrescribiera el repo al cambiar de tema.

> [!IMPORTANT]
> Con HyDE, **`ZDOTDIR=~/.config/zsh`**: zsh no lee `~/.zshrc` ni `~/.p10k.zsh`.
> Enlazar a `$HOME` no tiene efecto — es lo que rompió esta config en su día.
>
> - `zsh/user.zsh` — **mi configuración real**. HyDE la carga sin sobrescribirla.
> - `zsh/.zshrc` — `.zshrc` autónomo de oh-my-zsh, solo para máquinas **sin HyDE**.
>   En esta máquina no se usa: lo provee HyDE.
> - `starship.toml` se versiona, pero **hoy no se carga**: `user.zsh` hace
>   `unset HYDE_ZSH_PROMPT` y el prompt es Powerlevel10k.

## Cambios de nvim respecto a Gentleman.Dots

- Soporte completo de **Rust** (rustaceanvim + rust-analyzer con clippy, keymaps propios)
- Extras de LazyVim activados: **Python** (pyright + ruff), Astro, Tailwind, TOML, formatting con black
- Header del dashboard con lettering propio (figlet `delta_corps_priest_1`)
- Auto-guardado al salir de insert mode
- Keybindings de OpenCode remapeados bajo `<leader>ao*`
- Inlay hints activados, twilight desactivado, UI prompts con Snacks

## Uso

```bash
git clone git@github.com:ShadeC0der/ShadeC0der.Dots.git ~/Documentos/Proyectos/ShadeC0der.Dots
cd ~/Documentos/Proyectos/ShadeC0der.Dots

bash install.sh --dry-run   # ver qué haría
bash install.sh             # aplicarlo
```

El script detecta si hay HyDE (mirando `$ZDOTDIR`) y elige el destino correcto
para la config de zsh. Respalda `~/.config/nvim` si existe y no es un symlink.

Requiere oh-my-zsh y powerlevel10k instalados.

## Repos hermanos

Estos dotfiles son la parte **portable** (sirven en cualquier distro). Lo atado
a esta máquina vive aparte:

- **`dotfiles`** — escritorio: Hyprland, Waybar, dunst, rofi, SDDM, scripts de HyDE
- **`system-config`** — paquetes, arranque, `/etc`, servicios
- **`arch-vault`** — volcado bruto privado, del que se van migrando cosas a los otros tres

## Créditos

- La configuración de Neovim está basada en [Gentleman.Dots](https://github.com/Gentleman-Programming/Gentleman.Dots) de **Gentleman Programming** ([YouTube](https://youtube.com/@GentlemanProgramming) · [Twitch](https://twitch.tv/GentlemanProgramming) · [Discord](https://discord.gg/gentleman-programming)). Gracias también a todos los [contribuidores del proyecto original](https://github.com/Gentleman-Programming/Gentleman.Dots/graphs/contributors):

  [![Contributors](https://contrib.rocks/image?repo=Gentleman-Programming/Gentleman.Dots)](https://github.com/Gentleman-Programming/Gentleman.Dots/graphs/contributors)

- El entorno de escritorio (Hyprland, waybar, temas de kitty) es de [HyDE](https://github.com/HyDE-Project/HyDE).

## Licencia

MIT — igual que el proyecto original (ver [LICENSE](nvim/LICENSE)).
