" Vim scritp source: https://vim-bootstrap.com/ (partialmente usado)
"Para saber caminho do arquivo de inicialização: ":echo $MYVIMRC"

"Desabilitar linguagens que tem Language Server proprio
let g:polyglot_disabled = ['latex','tex','haskell','c/c++']

if has("win64") || has("win32") || has("win16")
	source ~/AppData/Local/nvim/pluglist.vim
	source ~/AppData/Local/nvim/nerdtree.vim
	source ~/AppData/Local/nvim/coc-config.vim
	source ~/AppData/Local/nvim/fonts.vim
	source ~/AppData/Local/nvim/plugins-config.vim
	source ~/AppData/Local/nvim/searcher.vim
	source ~/AppData/Local/nvim/c-language.vim
	source ~/AppData/Local/nvim/haskell.vim
    source ~/AppData/Local/nvim/grammarly.vim
	source ~/AppData/Local/nvim/mappings.vim
    source ~/AppData/Local/nvim/syntastic.vim
	source ~/AppData/Local/nvim/latex.vim
else
	source ~/.config/nvim/pluglist.vim
	source ~/.config/nvim/nerdtree.vim
	source ~/.config/nvim/coc-config.vim
	source ~/.config/nvim/fonts.vim
	source ~/.config/nvim/plugins-config.vim	
	source ~/.config/nvim/searcher.vim
	source ~/.config/nvim/c-language.vim
	source ~/.config/nvim/latex.vim
	source ~/.config/nvim/haskell.vim
    source ~/.config/nvim/grammarly.vim
	source ~/.config/nvim/mappings.vim
    source ~/.config/nvim/syntastic.vim
endif

"Destaca de Magenta(rosa) o codelens (isso tem que ser feito após colorscheme
highlight CocCodeLens ctermfg=Magenta guifg=#FF00FF
"Ignora os arquivos compilados
"set wildmode=list:longest,list:full "Desabilita o menu suspenso
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

set mouse=a
set inccommand=split

" change the direction of new splits
set splitbelow
set splitright

"%s/<palavra a ser substituida>/<palavra nova>/g
"let mapleader="\<space>"
"let <leader>sv :souce $MYVIMRC
"":Ag <palavra a ser buscada em todos os arquivos>
":hardcopy > <arquivo.pdg> "Gera cópia em pdf
"https://gist.github.com/0xadada/1ea7f96d108dcfbe75c9
