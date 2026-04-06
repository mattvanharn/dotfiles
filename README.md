# Dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

- `home/` — Shell configs (`.zshrc`, `.p10k.zsh`), stowed to `~`
- `config/` — App configs (bat, kitty overrides), stowed to `~/.config`
- `nvim/` — Neovim config, symlinked to `~/.config/nvim`
- `bin/` — Helper scripts (not stowed)

## Install

git clone https://github.com/mattvanharn/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash bin/setup

## Backup helper

One-time/periodic USB backup helper:

chmod +x ~/dotfiles/bin/backup-to-usb
~/dotfiles/bin/backup-to-usb --dry-run
~/dotfiles/bin/backup-to-usb

Default target:

/run/media/$USER/Ventoy/backup

Add `--with-projects` to also include `~/Projects`.

## Restore helper

Safety-first restore helper (defaults to dry-run preview):

chmod +x ~/dotfiles/bin/restore-from-usb
~/dotfiles/bin/restore-from-usb
~/dotfiles/bin/restore-from-usb --apply

Restore a specific backup timestamp:

~/dotfiles/bin/restore-from-usb --timestamp 2026-02-20_141500 --apply

Add `--with-projects` to also restore `~/Projects`.

