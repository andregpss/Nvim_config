map ]e :lnext<CR>
map [e :lprevious<CR>

"Elimina o atalho para a tecla Tab no modo de inserção.
"Até então, havia um atalho definido: coc#refresh()
"Local onde o atalho é definido: ~/AppData/Local/nvim-data/plugged/coc.nvim/autoload/coc/ui.vim
inoremap <Tab> <Tab>
" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"Airline tab
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Tab>   :bnext<CR>
nnoremap <leader><Tab>   :bdelete<CR>
"Shift+t
nnoremap <silent> <S-t> :tabnew<CR>
"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
nmap <leader>1 :bfirst<CR>
nmap <leader>2 :bfirst<CR>:bn<CR>
nmap <leader>3 :bfirst<CR>:2bn<CR>
nmap <leader>4 :bfirst<CR>:3bn<CR>

"" Switching windows. Ex: the first command maps Ctrl+J to execute Ctrl-w+j,
"  i.e.,  move the cursor to the window below the current one.
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>
nnoremap <leader>sd :DeleteSession<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sc :CloseSession<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

nmap gm :LivedownToggle<CR>

"Executa o comando tag mais a palavra atual.
nmap <leader>d :exec "tag ".expand("<cword>")<CR>

"if has('macunix')
"  " pbcopy for OSX copy/paste
""  vmap <C-x> :!pbcopy<CR>
""  vmap <C-c> :w !pbcopy<CR><CR>
"endif
"
"" Buffer nav
"noremap <leader>z :bp<CR>
"noremap <leader>q :bp<CR>
"noremap <leader>x :bn<CR>
"noremap <leader>w :bn<CR>
"
"" Close buffer
"noremap <leader>c :bd<CR>
" snippets
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"
"let g:UltiSnipsEditSplit="vertical"

"Não Funciona; O view é chamado durante a compilação.
"nmap <F10> :VimtexCompile <CR> \<bar> :VimtexView<CR>

