lua << EOF

-- NavBuddy
local navbuddy = require("nvim-navbuddy")
navbuddy.setup {
    lsp = {
        auto_attach = true,   -- If set to true, you don't need to manually use attach function        
    },
}
vim.keymap.set('n','<leader>b',require('nvim-navbuddy').open )

-- Style when a word is highlighted
vim.cmd([[hi! link LspReferenceText CursorColumn]])
vim.cmd([[hi! link LspReferenceRead CursorColumn]])
vim.cmd([[hi! link LspReferenceWrite CursorColumn]])

-- Focus (navegate between windows)
require("focus").setup()
local focusmap = function(direction)
    vim.keymap.set('n', '<Leader>'..direction, function()
        require('focus').split_command(direction)
    end, { desc = string.format('Create or move to split (%s)', direction) })
end

-- Use `<Leader>h` to split the screen to the left, same as command FocusSplitLeft etc
focusmap('h')
focusmap('j')
focusmap('k')
focusmap('l')

require("ibl").setup()
require('lsp-notify').setup({
       notify = require('notify'),
    })

-- Wilder improves menu
local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

local gradient = {     
  '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
  '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
  '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
  '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
}

for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
end

wilder.set_option('renderer', wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        highlights = {
          border = 'Normal', -- highlight to use for the border
          gradient = gradient,
        },
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
        border = 'rounded',     -- Moldura ao redor do menu
        pumblend = 10,      -- Transparência
        left = {' ', wilder.popupmenu_devicons()}, -- Ícones
        right = {' ', wilder.popupmenu_scrollbar()}, -- Barra de rolagem
        highlighter = wilder.highlighter_with_gradient({  -- Gradiente
            wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
            }),
        })
    ))


-- Executar o comando Telescope Project na inicialização do neovim
vim.api.nvim_exec([[
  augroup TelescopeProjectOnOpen
    autocmd!
    autocmd VimEnter * Telescope projects
  augroup END
]], false)

require("project_nvim").setup {  }
require('telescope').load_extension('projects')

require("symbols-outline").setup{
     autofold_depth = 2, 
     keymaps = {fold="-",unfold="+",fold_all="f",unfold_all="u"}, 
}
vim.keymap.set('n','<leader>sy',":SymbolsOutline<CR>")

local ls = require('luasnip')
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end, 
    {silent = true}
)


local haskell_snippets = require('haskell-snippets').all
ls.add_snippets('haskell', haskell_snippets, { key = 'haskell' })

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

-- NeoTree: Closes NeoTree after opennig a file
require("neo-tree").setup({
    event_handlers = {

        {
                event = "file_opened",
                handler = function(file_path)
                require("neo-tree.command").execute({ action = "close" })
                end
        },
        {
                event = "neo_tree_buffer_enter",
                handler = function(arg)
                vim.opt.number = true
                end,
        },
        {
                event = "neo_tree_window_after_open",
                handler = function(args)
                if args.position == "left" or args.position == "right" then
                    vim.cmd("wincmd =")
                    end
                    end
        },
        {
                event = "neo_tree_window_after_close",
                handler = function(args)
                if args.position == "left" or args.position == "right" then
                    vim.cmd("wincmd =")
                    end
                    end
        }
        },
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "diagnostics",
      },
      -- These are the defaults
      diagnostics = {
        auto_preview = { -- May also be set to `true` or `false`
          enabled = false, -- Whether to automatically enable preview mode
          preview_config = {}, -- Config table to pass to auto preview (for example `{ use_float = true }`)
          event = "neo_tree_buffer_enter", -- The event to enable auto preview upon (for example `"neo_tree_window_after_open"`)
        },
        bind_to_cwd = true,
        diag_sort_function = "severity", -- "severity" means diagnostic items are sorted by severity in addition to their positions.
                                         -- "position" means diagnostic items are sorted strictly by their positions.
                                         -- May also be a function.
        follow_current_file = { -- May also be set to `true` or `false`
          enabled = true, -- This will find and focus the file in the active buffer every time
          always_focus_file = false, -- Focus the followed file, even when focus is currently on a diagnostic item belonging to that file
          expand_followed = true, -- Ensure the node of the followed file is expanded
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          leave_files_open = false, -- `false` closes auto expanded files, such as with `:Neotree reveal`
        },
        group_dirs_and_files = true, -- when true, empty folders and files will be grouped together
        group_empty_dirs = true, -- when true, empty directories will be grouped together
        show_unloaded = true, -- show diagnostics from unloaded buffers
        refresh = {
          delay = 100, -- Time (in ms) to wait before updating diagnostics. Might resolve some issues with Neovim hanging.
          event = "vim_diagnostic_changed", -- Event to use for updating diagnostics (for example `"neo_tree_buffer_enter"`)
                                            -- Set to `false` or `"none"` to disable automatic refreshing
          max_items = 10000, -- The maximum number of diagnostic items to attempt processing
                             -- Set to `false` for no maximum
    },
  },
})

-- UFO
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

local ftMap = {
    vim = 'indent',
    python = {'indent'},
    git = ''
}
local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local totalLines = vim.api.nvim_buf_line_count(0)
    local foldedLines = endLnum - lnum
    local suffix = ("  %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    local rAlignAppndx =
        math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
    suffix = (" "):rep(rAlignAppndx) .. suffix
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

require('ufo').setup({
    open_fold_hl_timeout = 150,
    close_fold_kinds_for_ft = {'imports', 'comment'},
    fold_virt_text_handler = handler,
    preview = {
        win_config = {
            border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
            },
            mappings = {
                scrollU = '<C-u>',
                scrollD = '<C-d>',
                jumpTop = '[',
                jumpBot = ']'
            }
            },
            provider_selector = function(bufnr, filetype, buftype)
            -- if you prefer treesitter provider rather than lsp,
            -- return ftMap[filetype] or {'treesitter', 'indent'}
            return ftMap[filetype]

            -- refer to ./doc/example.lua for detail
            end
})
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set('n','-',"<cmd>foldclose<CR>",{desc="Close code fold"})
vim.keymap.set('n','+',"<cmd>foldopen<CR>",{desc="Open code fold"})
vim.keymap.set('n','zk',function()
local winid = require('ufo').peekFoldedLinesUnderCursor()
if not winid then
    vim.lsp.buf.hover()
end
end, {desc = "Peek Fold"}
)

vim.cmd([[hi default link UfoPreviewSbar PmenuSbar]])
vim.cmd([[hi default link UfoPreviewThumb PmenuThumb]])
vim.cmd([[hi default link UfoPreviewWinBar UfoFoldedBg]])
vim.cmd([[hi default link UfoPreviewCursorLine Visual]])
vim.cmd([[hi default link UfoFoldedEllipsis Comment]])
vim.cmd([[hi default link UfoCursorFoldedLine CursorLine]])
-- hi default UfoFoldedFg guifg=Normal.foreground
-- hi default UfoFoldedBg guibg=Folded.background




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
