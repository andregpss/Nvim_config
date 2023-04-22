" Usado no C e no Latex
"Desabilitar linguagens que tem Language Server proprio
"let g:syntastic_ignore_files = ['.hs','.c','.cpp','.h']
let g:syntastic_mode_map = {
    \ "mode": "active",
        \ "passive_filetypes": [".hs","haskell","cabal"] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2  
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0
" Enable error highlighting in Syntastic
let g:syntastic_enable_highlighting = 1
" Define error highlight group
highlight link SyntasticErrorLine Error 
" Set underline style for error highlighting
"highlight Error cterm=underline gui=underline

