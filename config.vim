"Comandos ate linha 8 estavam junto com a configuração do Coc. Não sei se é
"dependente do Coc.
set hidden  " if hidden is not set, TextEdit might fail.
set nobackup " Some servers have issues with backup files, see #649
set nowritebackup
set cmdheight=2 " Better display for messages
set updatetime=300 " You will have bad experience for diagnostic messages when it's default 4000.
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes " always show signcolumns
set splitbelow
set splitright 
set cuc " Column highligh
silent! colorscheme molokai
"set encoding = utf8
set laststatus                         =2              " Status bar
set nu                                                " Shows line number column
set termguicolors
set iskeyword+=-                                       " Inclui o hifen como parte de uma palavra; Necess?rio para identificar a tag atual
set tabstop                            =4              " Tabs. May be overridden by autocmd rules
set softtabstop                        =0
set shiftwidth                         =4
set expandtab
set hlsearch                                           " Searching
set incsearch
set ignorecase
set smartcase
let no_buffers_menu                    =1
set mousemodel                         =popup
set t_Co                               =256
set guioptions                         =egmrti
set modeline                                           " Use modeline overrides
set modelines                          =10
set title
set titleold                           =               " Terminal
set titlestring                        =%F
set clipboard =unnamedplus
set linebreak                                          " Align text at left
set autoread

hi DiagnosticHint guifg=#06aa74
hi LspCodeLens guifg=#fc25df
hi LspCodeLensSeparator guifg=#25a3fc

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" executado sempre que um arquivo com a extensão .txt é lido ou criado.
" Configura a quebra de linha
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"executado com arquivo no formato make;quando pressionar a tecla Tab, o Vim insere um caractere de tabulação 
"executado sempre que o Vim lê ou cria um arquivo com o nome CMakeLists.txt
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END


" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Enable/disable wrapen mode pressing '\w'. 
" When disabled, 'j' and 'k' keys are used do navegate
" between the lines
let s:wrapenabled = 0
function! ToggleWrap()
  set wrap nolist
  if s:wrapenabled
    set nolinebreak
    unmap j
    unmap k
    unmap 0
    unmap ^
    unmap $
    let s:wrapenabled = 0
  else
    set linebreak
    nnoremap j gj
    nnoremap k gk
    nnoremap 0 g0
    nnoremap ^ g^
    nnoremap $ g$
    vnoremap j gj
    vnoremap k gk
    vnoremap 0 g0
    vnoremap ^ g^
    vnoremap $ g$
    let s:wrapenabled = 1
  endif
endfunction
map <leader>w :call ToggleWrap()<CR>


" O CSApprox é um plugin do Vim que permite que esquemas de cores projetados para o GVim funcionem no Vim em terminais,
"if has("gui_running")
""  if has("gui_mac") || has("gui_macvim")
""    set guifont=Menlo:h12
""    set transparency=7
""  endif
"else
"  let g:CSApprox_loaded = 0 "Setado para 0 pois me parece sem efeito.
"endif

"Haskell 
"StylishHaskell :%!stylish-haskell
"Para executar: <leader>gq
"setg formatprg=stylish-haskell

"
"%s/<palavra a ser substituida>/<palavra nova>/g
"let mapleader="\<space>"
"let <leader>sv :souce $MYVIMRC
"":Ag <palavra a ser buscada em todos os arquivos>
":hardcopy > <arquivo.pdg> "Gera cópia em pdf
"https://gist.github.com/0xadada/1ea7f96d108dcfbe75c9

"Indicado pelo hasktags, porém dá erro.
"let tags+=tagfile " tags,TAGS is the default setting so probably you don't have to do anything

"Plugin desabilitado
" session management
"let g:session_directory = "~/.config/nvim/session"
"let g:session_autoload = "no"
"let g:session_autosave = "no"
"let g:session_command_aliases = 1

"Sobrescrito pelo airline: airline#statusline(1)
"set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
"if exists("*fugitive#statusline")
"  set statusline+=%{fugitive#statusline()}
"endif

"" Copy/Paste/Cut
"if has('unnamedplus')
"  set clipboard=unnamed,unnamedplus
"endif
