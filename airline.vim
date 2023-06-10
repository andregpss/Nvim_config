"*****************************************************************************
"" Convenience variables
"*****************************************************************************

"Tabs (Airline tab)
nnoremap <S-Tab>        : bprevious<CR>
nnoremap <Tab>          : bnext<CR>
nnoremap <leader><Tab>  : bdelete<CR>
nnoremap <silent> <S-t> : tabnew<CR> "Shift+t
noremap <Leader>te      : tabe <C-R>=expand("%:p:h") . "/" <CR> " Opens a tab edit command with the path of the currently edited file filled
nmap <leader>1          : bfirst<CR>
nmap <leader>2          : bfirst<CR>           : bn<CR>
nmap <leader>3          : bfirst<CR>           : 2bn<CR>
nmap <leader>4          : bfirst<CR>           : 3bn<CR>


" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" vim-airline
let g:airline_theme                      = 'murmur'
let g:airline#extensions#branch#enabled  = 1
let g:airline#extensions#ale#enabled     = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled  = 1
let g:airline_powerline_fonts            = 1
let g:airline_skip_empty_sections        = 1
let g:airline#extensions#ale#enabled     = 1


if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep     = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep                        = '>'
  let g:airline_left_alt_sep                    = '»'
  let g:airline_right_sep                       = '<'
  let g:airline_right_alt_sep                   = '«'
  let g:airline#extensions#branch#prefix        = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol      = 'ro'
  let g:airline#extensions#linecolumn#prefix    = '¶'
  let g:airline#extensions#paste#symbol         = 'Ã'
  let g:airline_symbols.linenr                  = '☰'
  let g:airline_symbols.branch                  = 'bra'
  let g:airline_symbols.paste                   = 'Ï'
  let g:airline_symbols.paste                   = 'Ã'
  let g:airline_symbols.paste                   = '∥'
  let g:airline_symbols.whitespace              = 'Ξ'
"else
  let g:airline#extensions#tabline#left_sep     = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_symbols.paste                   = 'Þ'
  let g:airline_symbols.crypt                   = ''
  let g:airline_left_sep                        = ''
  let g:airline_left_alt_sep                    = '»'
  let g:airline_right_sep                       = ''
  let g:airline_right_alt_sep                   = '«'
  let g:airline_symbols.branch                  = 'bra'
  let g:airline_symbols.readonly                = 'ro'
  let g:airline_symbols.linenr                  = ''
endif
