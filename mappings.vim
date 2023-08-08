map ]e :lnext<CR>
map [e :lprevious<CR>

nnoremap <leader>b :lua require('nvim-navbuddy').open() <CR>
"Elimina o atalho para a tecla Tab no modo de inserção.
"inoremap <Tab> <Tab>

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>
"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

"Moves the current linhe down or up
nnoremap <c-m> :m .+1<CR>==
nnoremap <c-n> :m .-2<CR>==
inoremap <c-m> <Esc>:m .+1<CR>==gi
inoremap <c-n> <Esc>:m .-2<CR>==gi
vnoremap <c-m> :m '>+1<CR>gv=gv
vnoremap <c-n> :m '<-2<CR>gv=gv

"" Switching windows. Ex: the first command maps Ctrl+j to execute Ctrl-w+j,
"  i.e.,  move the cursor to the window below the current one.
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" maximize current split or return to previous
noremap <C-w>m :MaximizerToggle<CR>


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

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sc :CloseSession<CR>
nnoremap <leader>sd :DeleteSession<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
"Ctrl-P in command-line mode to insert the path of the current file's directory followed by a slash.
"Necessary to enter ':' before Ctrl-P
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

"YY copies the visually selected text into the clipboard register.
noremap YY "+y<CR>
"XX copies the current line into the system clipboard register. 
noremap XX "+x<CR>

"\p pastes the contents of the system clipboard before the current cursor position
noremap <leader>p "+gP<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"Executa o comando tag mais a palavra atual.
nmap <leader>d :exec "tag ".expand("<cword>")<CR>

"nmap gm :LivedownToggle<CR>
" move the selected block of text down one line.
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

"" Vmap for maintain Visual Mode after shifting > and <
"vmap < <gv
"vmap > >gv
"nnoremap <silent> <leader>b :Buffers<CR>
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

