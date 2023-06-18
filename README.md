# NeoVim Configuration
Neovim config files, including configurations for Latex, Haskell, Grammarly and C/C++
(https://dotfyle.com/andregpss)

## **Table Of Contents**
- [Install](#install)
- [Languages Shortcut](#languages-shortcuts)
- [General Shortcuts](#general-shortcuts)
- [Troubleshooting](#troubleshooting)

## Install
1. Latex
   - Latex compiler
   - SumatraPDF
   - Coc plugin (Necessary to complete citations and references)
   - Plugin:
    1. TexLab (**Best** option; LSPConfig)
        - Download https://github.com/latex-lsp/texlab/releases
        - :CocInstall coc-texlab
    2. Vimtex (Other option)
        - Install 'lervag/vimtex' 
        - :CocInstall coc-vimtex
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
    - ctags

## Languages Shortcuts

- **COC** (Haskell,Latex (TexLab))
	- Coc plugin is an LSP manager for Neovim that offers more advanced and customizable features. 
    - K - mostra documentação da função
	- **[g, ]g** - move between lint comments
    - \cl - applies fix suggested by CodeLens 
    - \qf - quickfix window
    - \a - Code Action; lists on a popup the action to the command where the cursor is in.
    - \ac - lists all the code actions
    - \gq - applies
	- \p - aplica as correções do code lens (aquelas exibidas como texto virtual) 
	- to - Apply one hint at cursor position (?)
	- ta - Apply all suggestions in the file (?)
    - <espaço>+a - mostra todo o diagnóstico/dicas do código 
	- <espaço>+o - mostra a relação de funções do arquivo
	- <leader>rn (coc-rename)
	- <c-space> to trigger completion - Coc
	- \f - formata código selecionado
	- :Format - formata todo o código do arquivo
    - gd (coc-definition)	
	- gy (coc-type-definition) Jump to type definition(s) of current symbol by invoke
	- gi (coc-implementation) Aparentemente não implementado. Acredito que é desnecessário devido aos dois acima.
	- gr (coc-references)	Lista todas as referências no projeto para o termo em questão

- **LSPConfig (Grammarly, Latex(TexLab))**
	- 	Neovim's native LSP support offers basic LSP functionality, many users prefer to use plugins like Coc to have a richer and more customizable experience.
    - 	[d, ]d (navegate between erros and warnings)
	- 	<space> e (mostra o menu flutuante)
	- 	<space> ca (code action; aplica as sugestões de alteração no código)
    - 	<space> q (diagnostic list)
	- 	<space> rn (rename)
    - 	K, gd, gi, gr, ctrl+k,<space>D,

- **ALE (C Programming**)
	- [e, ]e (atalhos para navegar entre erros) (:lnext, :lprevious)
	- [a, ]a (move between warnings)
    - <ctrl>k,<ctrl>j (move between wraps)
    - :Errors (abre janela de erros)	
	- F9 - Compila arquivos .c
	- F11 - Compila e executa arquivos .c

[Up](#install)

## General Shortcuts

- **Navbuddy**
    - :Navbuddy - theres an initial error, but it works when you move to the right ('l' key) 
    - j,k,h,l - move down, up, left, right

- **NerdTree**
	- <F2> ou <Leader>v ou :NERDTreeFind	 
	- <F3> ou <Leader>n ou :NERDTreeToggle
	- hjkl - navega similar às teclas de navegação
	- r - atualiza o diretório corrente
	- m - mostra o menu
	- B - mostra/oculta os bookmarks
	- x - fecha o diretório corrente
	- X - fecha todos os diretórios abertos
	- e - abre o diretório corrente na janela principal
	- p - move para o diretório pai	

- **Comments**
	- gcc - comenta linha				- VIM-COMMENTARY
	- gc - comenta seleção				- VIM-COMMENTARY
	- :<inicio>,<fim>Commentary - commenta todas as linhas entre <inicio> e <fim>
	- :g/TODO/Commentary - move para o próximo TODO - VIM-COMMENTARY

- vim-surround
	- yssc <digitar comando> (envolve a linha posicionada com o comando). Ex: yssc textit
	- ysse <digitar environment> (idem para o environment). Ex: ysse tabular
	- ysee ou ysec (mesma coisa para a palavra posicionada)

- **Several plug-ins (Git, Airline, Syntastic, Tabbar, Tagbar,FZV,VimProc)**
	- Livedown Previews (Markdown, Readme)
        - :LivedownPreview 
	- AirlineTheme <theme>			
		- Tab, ShiftTab, \Tab, \1, \2, \3			
		- :bnext, :bprevious, :bfirst			
		- :blast, :b10, :b <buffer-name>, :bdelete[!], :badd
	- TagBar
		- F8 - mostra tagbar				Tagbar
	- FZV, VimProc, VIM-FUGITIVE (git), rhubarb
		- :History - últimos arquivos usados		
		- :VimProcBang <comando do SO em uso>	
	- Github
		- :G - git status						- 
		- :Gcommit, :Gpush, :Gpull				
		- :Git
    - Airline Tab
		-	:echo g:airline_symbols - símbolos usados na linha de status
 
[Up](#install)

## Troubleshooting
- Coc
    - Auto-complete popup menu does not show LSP suggestions: 
        - After modifying the code, the options may take some time to load (Reference: https://github.com/neoclide/coc.nvim/wiki/F.A.Q ).
- HLS (Haskell)
    - Plugin doesn't work:
        - Create a `hie.yaml` file in the project's root folder.
        - There might be an issue with the .cabal file or the existing hie.yaml.
        - Run 'haskell-language-server' or 'haskell-language-server-wrapper' in the project's root folder and check for errors.
        - Open a code file in the interpreter and see the errors using the following command: cabal repl <file name>
    - The 'hie.yaml' file seems to be incorrect.
        - Download a program that generates this file automatically from: https://github.com/Avi-D-coder/implicit-hie
    - It appears that the evaluated '.cabal' or '.stack' file is not the one in the project's root folder.
        - Check if there are any other files of these types in subfolders of the project; if so, remove those files from subfolders or from the root of the project.
- Latex

[Up](#install)
