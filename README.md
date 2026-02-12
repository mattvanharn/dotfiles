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
bash bin/install

