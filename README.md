# NeoVim Configuration
Neovim config files, including configurations for Latex, Haskell, Grammarly and C/C++
(https://dotfyle.com/andregpss)

## **Table Of Contents**
- [Install](#install)
- [Languages Shortcut](#languages-shortcuts)
- [General Shortcuts](#general-shortcuts)
- [Troubleshooting](#troubleshooting)

## Install
1. Latex (LSPConfig)
   - Latex compiler
   - SumatraPDF
   - Coc plugin (Necessary to complete citations and references)
   - TexLab
        - Download https://github.com/latex-lsp/texlab/releases
        - :CocInstall coc-texlab
2. Grammarly (LSPConfig)
   - Grammarly app (Premium user)
   - Grammarly language Server 
     - https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#grammarly
   - Node.js 14 (must be this version)
3. Haskell (LSPConfig)
   - GHC Compiler
   - Hasktags (Haskell tags)
   - Stylish haskell 
   - Haskell Language Server
4. C/C++ (ALE)
    - gcc compiler
    - ALE
5. Markdown Readme live view
   - npm install -g livedown
6. Advanced find
   - fzf (fuzzy)
   - fd (file system)
7. Other
    - Exuberant ctags (https://ctags.sourceforge.net/)
        - Not confuse Exuberant CTags with original CTags (that does not support any language nativelly)

## Languages Shortcuts

- **COC** (Haskell,Latex (TexLab))
	- Coc plugin is an LSP manager for Neovim that offers more advanced and customizable features. 
    - K - show the documentation for the current item
	- **[g, ]g** - move between lint comments
    - \cl - applies fix suggested by CodeLens 
    - \qf - quickfix window
    - \a - Code Action; lists on a popup the action to the command where the cursor is in.
    - \ac - lists all the code actions
    - \gq - applies (what?)
	- \p - applies code lens (aquelas exibidas como texto virtual)
        - Also used to add a function signature. Put the cursor on a function without signature and then press `\p` 
	- to - Apply one hint at cursor position (?)
	- ta - Apply all suggestions in the file (?)
    - ``<space>+a ``- shows all the code diagnostic  
	- ``<space>+o ``- shows the functions list in a file 
	- ``<leader>rn `` - rename
	- `<c-space> `to trigger completion - Coc
	- \f - format selected Code
	- :Format - format all the code in the current file
    - gd (coc-definition)	
	- gy (coc-type-definition) Jump to type definition(s) of current symbol by invoke
	- gi (coc-implementation) 
	- gr (coc-references)	Lists all the references for a type in a project

- **LSPConfig (Grammarly, Latex(TexLab))**
	- 	Neovim's native LSP support offers basic LSP functionality, many users prefer to use plugins like Coc to have a richer and more customizable experience.
    - 	[d, ]d - navegate between erros and warnings
	- 	``<space> e `` - shows the popup menu
	- 	``<space> ca `` - code action
    - 	``<space> q ``- diagnostic list
	- 	``<space> rn ``- rename
    - 	K, gd, gi, gr, `<ctrl>+k`,``<space>D ``

- **ALE (C Programming**)
	- [e, ]e - navegate the erros (Similar to :lnext, :lprevious)
	- [a, ]a - move between warnings
    - ``<ctrl>k ``,``<ctrl>j `` - move between wraps
    - :Errors - shows the error window 	
	- F9 - Compile .c files
	- F11 - Compile and Run .c files

[Up](#install)

## General Shortcuts

- **Navbuddy**
    - \b or :Navbuddy - theres an initial error, but it works when you move to the right ('l' key) 
    - j,k,h,l - move down, up, left, right
    - Some fonts does not have all the icons used by Navbuddy. One of the fonts that have all the icons is Agave Nerd Font.
    - There is an error when Navbuddy is called and the cursor is on the first line of a Haskell file.

- **NerdTree**
	- ``<F2>`` or ``<Leader>v `` or ``:NERDTreeFind ``	 
	- ``<F3>`` or ``<Leader>n `` or ``:NERDTreeToggle  ``
	- hjkl - navega similar às teclas de navegação
	- r - atualiza o diretório corrente
	- m - mostra o menu
	- B - mostra/oculta os bookmarks
	- x - fecha o diretório corrente
	- X - fecha todos os diretórios abertos
	- e - abre o diretório corrente na janela principal
	- p - move para o diretório pai	

- **Surround**
	- `yssc <digitar comando>` (envolve a linha posicionada com o comando). Ex: yssc textit
	- `ysse <digitar environment>`` `(idem para o environment). Ex: `ysse tabular`
	- `ysee ou ysec` (mesma coisa para a palavra posicionada)

- **Several plug-ins (Git, Airline, Syntastic, Tabbar, Tagbar,FZV,VimProc)**
	- Livedown Previews (Markdown, Readme)
        - :LivedownPreview 
	- Airline Tabs			
		- Tab, ShiftTab, \Tab, \1, \2, \3			
		- :bnext, :bprevious, :bfirst			
		- :blast, :b10, ``:b <buffer-name>``, :bdelete[!], :badd
    - Airline Theme
		- :echo g:airline_symbols - símbolos usados na linha de status
        - ``:AirlineTheme <theme>`` 
	- TagBar
		- F8 - mostra tagbar
	- FZV, VimProc, VIM-FUGITIVE (git), rhubarb
		- :History - últimos arquivos usados		
		- ``:VimProcBang <comando do SO em uso>``
	- Github
		- :G - git status
		- :Gcommit, :Gpush, :Gpull				
		- :Git
    - Tabularize
        - ``:Tab /= `` - Alinha(Tabula) verticalmente o símbolo ‘=’ em todas as linhas selecionadas

[Up](#install)

## Troubleshooting
- Coc
    - Auto-complete popup menu does not show LSP suggestions: 
        - After modifying the code, the options may take some time to load (Reference: https://github.com/neoclide/coc.nvim/wiki/F.A.Q ).
- HLS (Haskell)
    - Plugin doesn't work:
        - Create a `hie.yaml` file in the project's root folder.
        - There might be an issue with the .cabal file or the existing hie.yaml.
        - Run `haskell-language-server` or `haskell-language-server-wrapper` in the project's root folder and check for errors.
        - Open a code file in the interpreter and see the errors using the following command: `cabal repl <file name>`
    - The `hie.yaml` file seems to be incorrect.
        - Download a program that generates this file automatically from: https://github.com/Avi-D-coder/implicit-hie
    - It appears that the evaluated `.cabal` or ``.stack `` file is not the one in the project's root folder.
        - Check if there are any other files of these types in subfolders of the project; if so, remove those files from subfolders or from the root of the project.
    - Import is not recognized
        - Add module to `other-modules` clause in cabal
    - No cradle for module (module definition error)
        - Add component to `hie.yaml`
    - Does not show documentation for functions
        - The documentation on hover only works for the parts of the code that were saved and successfully compiled.
        - https://github.com/haskell/haskell-language-server/issues/52
- Latex
    - The LaTeX compiler has stopped working; the error log indicates that there is no error.
        - This happened due to an error in the document; delete the PDF file, recompile again, and pay attention to the error log.
    - New bibliographic references appear as `undefined reference` or on the refference shows ``??``
        - Delete the `bbl` file, recompile the project, a new 'bbl' version will be generated, and the reference will appear. If it doesn't work, delete all temporary files, including the pdf.
    - Bibliographic reference in the wrong format (There is an Error in LaTeX compilation):
        - Change the reference type from online to Misc.
    - In the bbl file: `Missing $ inserted`.
        - Open the `bbl` file and locate the line where the error is. This line contains an invalid character. For example, the character `_` should be `_`.

[Up](#install)
