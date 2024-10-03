require("lspconfig.util")
-- Mason setup
require("mason").setup()

-- Mason-LSPConfig setup
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pylsp", "clangd" },
})

-- Define the on_attach function to set key bindings
local on_attach = function(_, _)
    local opts = { noremap=true, silent=true }

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

-- LSPConfig setup
local lspconfig = require("lspconfig")

-- Lua LSP
lspconfig.lua_ls.setup{
    on_attach = on_attach,
}
--
-- Python LSP (python-lsp-server), need to install python3.12-venv first
lspconfig.pylsp.setup{
    on_attach = on_attach,
}
--
-- C++ LSP (clangd)
lspconfig.clangd.setup{
    on_attach = on_attach,
}

