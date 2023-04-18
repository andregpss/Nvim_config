let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

call plug#begin()
"Plug-ins minimos
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nbouscal/vim-stylish-haskell'
Plug 'preservim/nerdtree'	"Outra implementação: Plug 'scrooloose/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection' "Testar
"-------------------Latex
Plug 'lervag/vimtex' 
    let g:tex_flavor='latex'

Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-commentary' 	"Atalhos para comentario
Plug 'tpope/vim-fugitive'		"GIT atalhos
Plug 'vim-airline/vim-airline'	"Barra de status
Plug 'vim-airline/vim-airline-themes' "Esquema de cores para barra de status
Plug 'airblade/vim-gitgutter' 	"indica com ~ as linhas alteradas deste o ultimo push
Plug 'vim-scripts/grep.vim'		"usa comando grep (do linux) dentro do vim
Plug 'Raimondi/delimitMate'		"Fecha aspas, parenteses, etc.
Plug 'majutsushi/tagbar'		"Mostra estrutura do código; Haskell nao é suportado 
								"NECESSARIO Instalar Exuberant Ctags?
								"NECESSARIO criar ~/.ctag para suportar .bib
Plug 'MarcWeber/hasktags'		"Reconhece tags do haskell
			"NECESSARIO compilar com Cabal e copiar executavel para dir do nvim.exe
Plug 'Yggdroot/indentLine'		"display the indention levels with thin vertical lines
Plug 'sheerun/vim-polyglot'	"Pacote para reconhecimento de diversas linguagens
Plug 'tpope/vim-rhubarb' 	" required by fugitive to :Gbrowse
							" Abre o arquivo atual no github
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-surround'

"Plug 'w0rp/ale' 				"Incompativel com o HIE Haskell Engine
"Plug 'avelino/vim-bootstrap-updater' "Acredito que atualiza o vimrc
"Plug 'jistr/vim-nerdtree-tabs' "Now togheter with nerd trees
"Plug 'vim-scripts/CSApprox'		"Adapta Colorshemes para uso em terminal
"Plug 'neovimhaskell/haskell-vim'

"Plug-Ins adicionais recomendados pelo vim-bootstrap
" FZF is a bundle of fzf-based commands and mappings
" fzf is a general-purpose command-line fuzzy finder.
" NECESSARY On Windows to download executable
if isdirectory('/usr/local/opt/fzf') 
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  "  Plug 'wbthomason/packer.nvim'
endif

"NECESSARIO construir dll com Mingw C:\MinGW\bin OU baixar versão pré-compilada.
"NECESSARIO Copiar algumas pastas para o dir 'runtime' do neovim
"Executa comandos do terminal dentro do vim. Ex: :VimProcBang ls -l *.cabal
"Achei desnecessario, pois aparentemente eh equivalente a ':terminal'
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

" Molokai color scheme 
Plug 'tomasr/molokai'

"Plug-ins secundários adicionados por mim
Plug 'vim-syntastic/syntastic'
"O devicons deve ser o ultimo; caso contrario, nao eh exibido no status
Plug 'ryanoasis/vim-devicons'
""Para salvar seções; acho desnecessario, por enquanto.
"" Vim-Session
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'

call plug#end()
