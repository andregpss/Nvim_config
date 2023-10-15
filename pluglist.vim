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
Plug 'sheerun/vim-polyglot'                     " A collection of language packs for Vim (Syntax highlighting, indentation, matching rules and mappings).
Plug 'shime/vim-livedown'                       " Preview Markdown Readme

" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Add extra features to LSPs 
" Plug 'dense-analysis/ale'                       " Used for GCC compiling
" Plug 'vim-syntastic/syntastic'
"Plug 'nbouscal/vim-stylish-haskell'

""Inserts various keymaps for snippets. I did not think it is interesting. 
" See snipets and their keymaps on: https://wolfgangmehner.github.io/vim-plugins/csupport.html 
"Plug 'WolfgangMehner/c-support' 

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'           
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'  " displaying function signatures with the current parameter emphasized 
Plug 'delphinus/cmp-ctags'

"Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'mrcjkb/haskell-snippets.nvim'
Plug 'VonHeikemen/lsp-zero.nvim'
" General features
Plug 'preservim/nerdtree'                      " Alternative implementation: Plug 'scrooloose/nerdtree'
Plug 'preservim/tagbar'                       " Mostra estrutura do código em uma barra vertical (atalho F8); Haskell nao é suportado
Plug 'PhilRunninger/nerdtree-visual-selection' " NerdTree key mappings
Plug 'vim-airline/vim-airline'                 " Status bar
Plug 'vim-airline/vim-airline-themes'          " Colour schemes for status bar 
Plug 'tomasr/molokai'                          " Molokai color scheme
Plug 'vim-scripts/grep.vim'                    " Use grep command (linux) into vim
Plug 'Yggdroot/indentLine'                     " Display the indention levels with thin vertical lines
Plug 'godlygeek/tabular'                       " Align text using :Tab
Plug 'Raimondi/delimitMate'                    " Closes parentheses, brackets, etc.
Plug 'tpope/vim-surround'                      " surroundings with parentheses, brackets, quotes, XML tags, and more. Commands: cs and ds
Plug 'ludovicchabant/vim-gutentags'            " (re)generate in background tag files as you work. When not using Gustentags, you must generate the tags manually.
Plug 'szw/vim-maximizer'                       " Maximizes and restores the current window
Plug 'tpope/vim-characterize' " Shows additional information about a character when `ga` is pressed
Plug 'mbbill/undotree' " visualizes the undo history and browse and switch between different undo branches
" Git features
Plug 'airblade/vim-gitgutter' " indica com ~ as linhas alteradas deste o ultimo push
Plug 'tpope/vim-rhubarb'      " required by fugitive to :Gbrowse
							  " Abre o arquivo atual no github
Plug 'tpope/vim-fugitive'     " GIT atalhos
Plug 'ahmedkhalf/project.nvim' " Project management
Plug 'simrat39/symbols-outline.nvim' " Barra com lista de símbolos

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
Plug 'nvim-tree/nvim-web-devicons' "Used by Telescope find_file

"Following plugs are necessary for NavBuddy plugin
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'
Plug 'numToStr/Comment.nvim'        " Optional
Plug 'SmiteshP/nvim-navbuddy'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' } 
Plug 'BurntSushi/ripgrep'
Plug 'luc-tielen/telescope_hoogle'
Plug 'fcying/telescope-ctags-outline.nvim'
Plug 'benfowler/telescope-luasnip.nvim'
" Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'smartpde/telescope-recent-files'
Plug 'FeiyouG/commander.nvim'
" Plug 'nvim-treesitter/nvim-treesitter',  {'do': ':TSUpdate'} "Removed
" because can not install langauges parsers, due that clang compiler,
" installed by LLVM, does not find `.h` files


"Plug 'lervag/vimtex' 
"    let g:tex_flavor='latex'
"Plug 'tpope/vim-commentary' 	"Atalhos para comentario

" Vim-Session
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'

"Plug 'MarcWeber/hasktags'           " Reconhece tags do haskell
			                        " NECESSARIO compilar com Cabal e copiar executavel para dir do nvim.exe

call plug#end()
