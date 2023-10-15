lua << EOF
local navbuddy = require("nvim-navbuddy")
navbuddy.setup {
    lsp = {
        auto_attach = true,   -- If set to true, you don't need to manually use attach function        
    },
}

-- Style when a word is highlighted
vim.cmd([[hi! link LspReferenceText CursorColumn]])
vim.cmd([[hi! link LspReferenceRead CursorColumn]])
vim.cmd([[hi! link LspReferenceWrite CursorColumn]])

require("project_nvim").setup {  }
require('telescope').load_extension('projects')
require("symbols-outline").setup{
    \ autofold_depth = 2,
    \ keymaps = {fold="-",unfold="+",fold_all="f",unfold_all="u"},
  \ }

local ls = require('luasnip')
local haskell_snippets = require('haskell-snippets').all
ls.add_snippets('haskell', haskell_snippets, { key = 'haskell' })
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

require'nvim-web-devicons'.setup {
   override = {
        zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
        }
        };
   color_icons = true;
   default = true;
   strict = true;
   override_by_filename = {
        [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
        }
        };
   override_by_extension = {
        ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log"
        }
        };
}

-- O trecho abaixo tenta atachar o LSP quando um arquivo cabal é encontrado
--      no diretório corrente. Porém, não funcionou
-- Callback que é chamado quando o diretório corrente mudar
-- function on_cwd_change()
--   -- Verificar se um arquivo com a extensão CABAL existe
--   local cabal_file = vim.fn.glob(vim.fn.getcwd() .. "/*.cabal")
--   if #cabal_file > 0 then
--     -- Verificar se o arquivo com a extensão CABAL é compatível com o servidor LSP
--     local server_name = "hls"
-- 	vim.lsp.start({
-- 	   name = 'hls',
-- 	   cmd = {'haskell-language-server-wrapper-2.2.0.0.exe'},
-- 	   root_dir = vim.fs.dirname(vim.fs.find({'afirm.cabal'}, { upward = true })[1]),
-- })
-- 
--   end
-- end
-- 
-- Registrar o callback
--hasvim.api.nvim_command("autocmd BufEnter * lua on_cwd_change()")


-- require('lspconfig')['hls'].setup{
--      on_attach =function(client, bufnr)
--           navbuddy.attach(client, bufnr)
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
