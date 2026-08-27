# Dotfiles

Personal macOS application configuration for:

- AeroSpace
- Ghostty
- Herdr
- Neovim
- Yazi

Each directory mirrors its destination under `~/.config`.

## Install

Install [GNU Stow](https://www.gnu.org/software/stow/), clone this repository,
then run the following command from the repository root. Back up any existing
configuration directory before running it.

```sh
stow -t "$HOME" aerospace ghostty herdr nvim yazi
```
