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

" Languages resoureces, including LSP and CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Add extra features to LSPs 
Plug 'neovim/nvim-lspconfig'
Plug 'dense-analysis/ale'                       " Used for GCC compiling
Plug 'sheerun/vim-polyglot'                     " A collection of language packs for Vim (Syntax highlighting, indentation, matching rules and mappings).
Plug 'shime/vim-livedown'                       " Preview Markdown Readme
" Plug 'vim-syntastic/syntastic'

"Haskell
Plug 'MarcWeber/hasktags'           " Reconhece tags do haskell
			                        " NECESSARIO compilar com Cabal e copiar executavel para dir do nvim.exe
Plug 'nbouscal/vim-stylish-haskell'

" General features
Plug 'preservim/nerdtree'                      " Alternative implementation: Plug 'scrooloose/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection' " NerdTree key mappings
Plug 'vim-airline/vim-airline'                 " Status bar
Plug 'vim-airline/vim-airline-themes'          " Colour schemes for status bar 
Plug 'tomasr/molokai'                          " Molokai color scheme
Plug 'vim-scripts/grep.vim'                    " Use grep command (linux) into vim
Plug 'Yggdroot/indentLine'                     " Display the indention levels with thin vertical lines
Plug 'godlygeek/tabular'                       " Align text using :Tab
Plug 'Raimondi/delimitMate'                    " Closes parentheses, brackets, etc.
Plug 'tpope/vim-surround'                      " surroundings with parentheses, brackets, quotes, XML tags, and more. Commands: cs and ds
Plug 'ludovicchabant/vim-gutentags'            " (re)generate tag files as you work 
Plug 'majutsushi/tagbar'                       " Mostra estrutura do código; Haskell nao é suportado

" Git features
Plug 'airblade/vim-gitgutter' " indica com ~ as linhas alteradas deste o ultimo push
Plug 'tpope/vim-rhubarb'      " required by fugitive to :Gbrowse
							  " Abre o arquivo atual no github
Plug 'tpope/vim-fugitive'     " GIT atalhos

if isdirectory('/usr/local/opt/fzf') 
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:fzf_preview_command = '' " Disable commands on popup window. That commands conflicts with LSP commands.

"The Following command is necessary to install Vimproc (i think)
"make is utility for building and maintaining groups of programs.
let g:make = 'make'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}      " asynchronous execution library. Maybe a prerequisit for other plugins.

"O devicons must be the last plugin; otherwise, it is not shown on status.
"Verify if this is really correct.
Plug 'ryanoasis/vim-devicons'

"Following plugs are necessary for NavBuddy plugin
"Plug 'SmiteshP/nvim-navic'
"Plug 'MunifTanjim/nui.nvim'
"Plug 'numToStr/Comment.nvim'        " Optional
"Plug 'nvim-telescope/telescope.nvim' " Optional
"Plug 'SmiteshP/nvim-navbuddy'

"Plug 'lervag/vimtex' 
"    let g:tex_flavor='latex'
"Plug 'tpope/vim-commentary' 	"Atalhos para comentario

" Vim-Session
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'

call plug#end()
