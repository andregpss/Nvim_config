lua << EOF
-- https://github.com/DanRoscigno/nvim-markdown-grammarly
require('lspconfig').grammarly.setup{
    cmd = { "C:\\hls\\grammarly-0.24.0\\extension\\node_modules\\.bin\\grammarly-languageserver", "--stdio" },
    filetypes={"tex","text","markdown"}}

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
    },
}

-- https://github.com/neovim/nvim-lspconfig/wiki/Comparison-to-other-LSP-ecosystems-(CoC,-vim-lsp,-etc.)
require'lspconfig'.hls.setup{
    settings = {
                 haskell = {
                 plugin={stan={globalOn=false}}
                    }
                },
 }

require'lspconfig'.clangd.setup{ }

-- TODO que isso funcione automaticamente para qualquer cliente lsp
-- require'lspconfig'.setup{on_attach=print('lspconfig attach')}

 -- local client = require("lspconfig").get_client(bufnr("%"))
 -- 
 -- client.on_attach = function(client, bufnr)
 --   -- Código que você deseja inserir no método on_attach
 -- end

-- Ideal: testar se o servidor suporta lens de forma a retirar esse filtro para arquivos Haskell
-- vim.cmd([[autocmd TextChanged,TextChangedI *.hs,*.tex lua vim.lsp.codelens.refresh()]])

 -- 
 -- require'lspconfig'.hls.setup{
 --   filetypes = { 'haskell', 'lhaskell', 'cabal' },
 --   rootPatterns={"*.cabal","stack.yaml","cabal.project","package.yaml"},
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
 --             },
 --             checkProject=true,
 --             checkParents='CheckOnSave',
 --             formattingProvider = "stylish-haskell"
 --         }
 --     },
 --     on_attach = function(client, bufnr)
 --         navbuddy.attach(client, bufnr)
 --     end,
 -- }

EOF
