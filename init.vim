" Vim scritp source: https://vim-bootstrap.com/ (partialmente usado)
"Para saber caminho do arquivo de inicialização: ":echo $MYVIMRC"

"Desabilitar linguagens que tem Language Server proprio
let g:polyglot_disabled = ['latex','tex','haskell','c/c++']

if has("win64") || has("win32") || has("win16")
	source ~/AppData/Local/nvim/pluglist.vim
	source ~/AppData/Local/nvim/config.vim
    source ~/AppData/Local/nvim/lsp_zero_cmp_mason.vim
    source ~/AppData/Local/nvim/lsp_config.vim
    source ~/AppData/Local/nvim/lsp_servers.vim
    source ~/AppData/Local/nvim/lsp_keymap.vim
    source ~/AppData/Local/nvim/popup.vim
" 	source ~/AppData/Local/nvim/coc-config.vim
"   source ~/AppData/Local/nvim/ale.vim
	source ~/AppData/Local/nvim/nerdtree.vim
	source ~/AppData/Local/nvim/airline.vim
	source ~/AppData/Local/nvim/mappings.vim
	source ~/AppData/Local/nvim/searcher.vim
    source ~/AppData/Local/nvim/telescope.vim
	source ~/AppData/Local/nvim/c-language.vim
	source ~/AppData/Local/nvim/latex.vim
else
	source ~/.config/nvim/pluglist.vim
	source ~/.config/nvim/config.vim	
	source ~/.config/nvim/coc-config.vim
	source ~/.config/nvim/nerdtree.vim
	source ~/.config/nvim/airline.vim
	source ~/.config/nvim/searcher.vim
	source ~/.config/nvim/c-language.vim
	source ~/.config/nvim/mappings.vim
    source ~/.config/nvim/ale.vim
    source ~/.config/nvim/lspconfig.vim
    source ~/.config/nvim/telescope.vim
	source ~/.config/nvim/latex.vim

endif

