lua << EOF
-- local navbuddy = require("nvim-navbuddy")
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
    end, opts)
    end,
}) 

require('lspconfig').grammarly.setup{filetypes={"tex","text","markdown"}}

-- This command is necessary to enable ':TexlabBuild' command
require'lspconfig'.texlab.setup{
settings = {
    texlab = {
        auxDirectory = "temp",
        chktex = {onEdit=true},
       forwardSearch = {
            executable='SumatraPDF-3.2-64.exe',
            args = {    "-reuse-instance",
            "%p",
            "-forward-search",
            "%f",
            "%l"
            }
            },
       }
    }
}
-- require('lspconfig')['hls'].setup{
--    filetypes = { 'haskell', 'lhaskell', 'cabal' },
--    on_attach = function(client, bufnr)
--         navbuddy.attach(client, bufnr)
--     end,
--     settings = {haskell={plugin={stan={globalOn=false}}}}
-- }
-- 
-- require('lspconfig')['hls'].setup{
--   filetypes = { 'haskell', 'lhaskell', 'cabal' },
-- -- Disables Stan lint plugin, because it is too verbose
--   settings = {
--         haskell = {
--              plugin = {
--                 class={codeActionsOn=true},
--                 stan= { globalOn = false },
--                 hlint={ codeActionsOn=true,diagnosticsOn=true},
--                 moduleName={globalOn=true},
--                 tactics={codeActionsOn=true},
--                 importLens={codeActionsOn=true},
--                 refineImports={globalOn=true,codeActionsOn=true,codeLensOn=true}
--             }
--         }
--     },
--     on_attach = function(client, bufnr)
--         navbuddy.attach(client, bufnr)
--     end,
-- }
-- Desabilita o virtual texto para warnins
--[[
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        spacing = 4,
        severity_limit = "Warnings",
    },
}
)
--]]

EOF

