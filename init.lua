vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.culopt = "both"
vim.opt.list = true

require('plugins')
require('nvim-web-devicons').setup()
require('lualine').setup{
  options = {
    theme = 'gruvbox'
  }
}
--require('lspconfig').setup{}
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
