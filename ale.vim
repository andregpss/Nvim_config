let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

"Let disabled to not conflit with LSP completion!
let g:ale_pattern_options = {'\.hs$': {'ale_enabled': 0},'\.cabal$': {'ale_enabled': 0},'\.tex$': {'ale_enabled': 0}}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

highlight clear ALEErrorLine
highlight link  ALEErrorLine Error
highlight ALEErrorSign guibg=#af0606
highlight ALEWarningLine guibg=#292222
highlight ALEWarningSign guibg=#c4c2c2
highlight ALEVirtualTextError guifg=#a50a0a
highlight ALEVirtualWarningEror guifg=#c1c1c1
map ]a :ALENextWrap<CR>
map [a :ALEPreviousWrap<CR>

"Highlight diagnostics
hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

"Alternative command to disable ALE for a king of file 
" autocmd FileType haskell let g:ale_disable_linters = 1
" autocmd FileType haskell let g:ale_disable_signs = 1
" autocmd FileType haskell let g:ale_completion_enabled = 0
" autocmd FileType haskell let g:ale_completion_autoimport = 0
" autocmd FileType latex let g:ale_disable_linters = 1
" autocmd FileType latex let g:ale_disable_signs = 1
" autocmd FileType latex let g:ale_completion_enabled = 0
" autocmd FileType latex let g:ale_completion_autoimport = 0

"let g:ale_linters_ignore = ['hls', 'cabal_ghc', 'cspell', 'ghc', 'ghc_mod', 'hdevtools', 'hie', 'hlint', 'stack_build', 'stack_ghc', 'chktex', 'lacheck', 'texlab']
"let g:ale_linters = {'latex': []}

" The commands below disable completion for all files
"let g:ale_completion_enabled = 0 
"let g:ale_completion_autoimport = 0
" let g:ale_popup_menu_enabled = 0
"let g:ale_use_neovim_diagnostics_api = 1
