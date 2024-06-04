lua << EOF

local telescope = require('telescope')


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n','<leader>tc',":Telescope commander<CR>")

telescope.load_extension('hoogle')
telescope.load_extension('luasnip')

telescope.setup{
    extensions = {
        ctags_outline = {
           ft_opt = {
                tex = '--tex-kinds=sub',
            },
        },
    },
}
telescope.load_extension('ctags_outline')

telescope.load_extension('file_browser')
vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)
-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true }
)


telescope.load_extension('recent_files')
-- Recent Files shortcut
--vim.api.nvim_set_keymap("n", "<Leader><Leader>",
--  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]], {noremap = true, silent = true})

local commander = require('commander')
commander.setup({
  integration = {
    telescope = {
      enable = true,
      -- Optional, you can use any telescope supported theme
      theme = require("telescope.themes").commander 
    }
  }
})
commander.clear() -- If not clear, commands appear twice after reload this lua script

commander.add({
        {
            desc = "Find into current file",
            cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
            keys = { "n", "<leader>fl" },
        },  {
            desc = "Find Files on current directory and subdirectories",
            cmd = "<CMD>Telescope find_files<CR>",
            keys = { "n", "<leader>ff" },
        },{
            desc = "File Browser",
            keys = { "n", "<leader>tb" },
            cmd ="<cmd>Telescope file_browser<CR>"
        },{
            desc = "Recent files oppened",
            keys = { "n", "<leader>rf" },
            cmd ="<cmd>lua require('telescope').extensions.recent_files.pick()<CR>"
        },{
            desc = "Projects",
            keys = { "n", "<leader>tp" },
            cmd = "<CMD>Telescope projects<CR>"
        }, { 
            desc = "Key maps",
            keys = { "n", "<leader>tk" },
            cmd = "<CMD>Telescope keymaps<CR>"
        }, { 
            desc = "Diagnostics",
            keys = { "n", "<leader>td" },
            cmd = "<CMD>Telescope diagnostics<CR>"
        }, { 
            desc = "Quickfix",
            keys = { "n", "<leader>tq" },
            cmd = "<CMD>Telescope quickfix<CR>"
        }, {
            desc = "CTags",
            keys = { "n", "<leader>tg" },
            cmd = "<CMD>Telescope ctags_outline<CR>"
        }, {
            desc = "LSP Show document symbols",
            cmd = "<CMD>Telescope lsp_document_symbols<CR>",
            keys = {"n", "<leader>ss"},
        }, {
            desc = "Commands History",
            cmd = "<CMD>Telescope command_history<CR>",
            keys = {"n", "<leader>ch"},
        },{ 
            desc = "Lua Snips",
            keys = { "n", "<leader>tl" },
            cmd = "<CMD>Telescope luasnip<CR>"
        }, { 
            desc = "Cores",
            keys = { "n", "<leader>to" },
            cmd = "<CMD>Telescope colorscheme<CR>"
        }, {
            desc = "All commands",
            cmd = "<CMD>Telescope<CR>",
            keys = {"n","<leader>ta"},
        }
    })

-- telescope.load_extension('coc')
-- require("telescope").setup({
--   extensions = {
--     coc = {
--         theme = 'ivy',
--         prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
--     }
--   },
-- })

EOF
