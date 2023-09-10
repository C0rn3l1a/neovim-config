## Nacho's Neovim config
This is my personal neovim config that I use everyday. The purpose of this repo is for me to share my preferred neovim
config between multiple machines and for any interested person to fork it and use it if they wish to do so.

## Installation
1. Install Neovim using your [preferred method](https://github.com/neovim/neovim/wiki/Installing-Neovim), make sure to have nvim v0.9 at least installed.
2. Clone this repo in the config folder for neovim. (open neovim and type `:echo stdpath('config')` if you're not sure where it is)
3. Add [packer.nvim](https://github.com/wbthomason/packer.nvim) (Plugin Manager) with
   ```bash
   git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```
   or following their quickstart
4. Install [ripgrep](https://github.com/BurntSushi/ripgrep) (File search functionallity)
5. (optional) Install [Lazygit](https://github.com/jesseduffield/lazygit) for git support with <leader>G
6. After everything is installed, open neovim, skip all the errors and type `:PackerSync` to get all the plugins installed
7. Reopen Neovim and you should be good to go!

Some screenshots https://imgur.com/a/gW3jxXF

## Workflow
When installing a new plugin make sure to follow these instructions:
- Import in `packer.lua`
- add a comment on top of it with "{{name of library}} ({{what it is/does}})"
- If necessary create a `{{plugin}}.lua` file to add configurations and mappings to it

When creating remaps, try to follow these guidelines:
- Keep concepts separated in their own letters, for example, all telescope commands are started with `<leader>f`
- Document remaps with `which-key` so they appear in the cheats:heet
