let g:ale_linters_ignore = ['hls', 'cabal_ghc', 'cspell', 'ghc', 'ghc_mod', 'hdevtools', 'hie', 'hlint', 'stack_build', 'stack_ghc']
let g:airline#extensions#ale#enabled = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
let g:ale_completion_enabled = 1
"let g:ale_use_neovim_diagnostics_api = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

highlight clear ALEErrorLine
highlight link  ALEErrorLine Error
highlight ALEErrorSign guibg=#af0606
highlight ALEWarningLine guibg=#292222
highlight ALEWarningSign guibg=#c4c2c2
highlight ALEVirtualTextError guifg=#a50a0a
highlight ALEVirtualWarningEror guifg=#c1c1c1
"map ]a :ALENextWrap<CR>
"map [a :ALEPreviousWrap<CR>

"Highlight diagnostics
hi link ALEError Error
hi Warning term=underline cterm=underline ctermfg=Yellow gui=undercurl guisp=Gold
hi link ALEWarning Warning
hi link ALEInfo SpellCap

