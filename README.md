# neovim dotfiles/configs

my current config for neovim, currently using a catppuccin colorscheme and treesitter for some funky syntax highlighting

# to use

install [packer.nvim](https://github.com/wbthomason/packer.nvim) by running:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

copy all config files to `~/.config/nvim/`

open `nvim` and run the command `:PackerInstall`

# Packages

- Packer
- lsp-zero
- lualine
- telescope
- treesitter
