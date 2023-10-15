lua << EOF
-- Plugins shortcuts
vim.keymap.set('n','<leader>b',require('nvim-navbuddy').open )
vim.keymap.set('n','<leader>sy',":SymbolsOutline<CR>")

-- General shortcuts
 vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Lsp commands 
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        checkFeatures()
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
   
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,

}) 
function checkFeatures()
    local buffs = vim.lsp.buf_get_clients()

    if not(vim.tbl_isempty(buffs)) then
        for i,_ in pairs(buffs) do
            if  (buffs[i].server_capabilities["codeLensProvider"] ~=nil) then
                vim.lsp.codelens.refresh()
                vim.keymap.set('n', '<leader>cr', vim.lsp.codelens.run, opts)
                vim.cmd([[autocmd TextChanged,TextChangedI <buffer> lua vim.lsp.codelens.refresh()]])
            end 
            if (vim.lsp.buf_get_clients()[i].server_capabilities["documentHighlightProvider"] ~= nil) then
                -- Then, highlight current word on Normal and Insert modes
                vim.cmd([[autocmd CursorHold,CursorHoldI  <buffer> lua vim.lsp.buf.document_highlight()]])
                -- Clear highlight when cursor moves
                vim.cmd([[autocmd CursorMoved,CursorMovedI <buffer> lua vim.lsp.buf.clear_references()]])
            end
        end
    end
end 


