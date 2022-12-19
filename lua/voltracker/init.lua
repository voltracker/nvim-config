require('voltracker.set')
require('voltracker.plugins')
require('voltracker.remap')
require('nvim-web-devicons').setup()
require'alpha'.setup(require'alpha.themes.startify'.config)
require('lualine').setup{
  options = {
    theme = 'auto'
  }
}

-- from https://github.com/neovim/nvim-lspconfig/
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<Space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<Space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<Space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<Space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig').pyright.setup{
  on_attach = on_attach,
}
require('lspconfig').rust_analyzer.setup{
  on_attach = on_attach,
}
require('lspconfig').clangd.setup{
  on_attach = on_attach,
}
require('lspconfig').gopls.setup{
  on_attach = on_attach,
}
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
