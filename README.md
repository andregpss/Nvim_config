# Nvim_config
Neovim config files, including configurations for Latex, Haskell, Grammarly and C/C++
(https://dotfyle.com/andregpss)

It is necessary to install the following external apps:

1. Latex 
   - Latex compiler
   - SumatraPDF
2. Grammarly
   - Grammarly app (Premium user)
   - Grammarly language Server 
     - https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#grammarly
   - Node.js 14 (must be this version)
3. Haskell
   - GHC Compiler
   - Hasktags (Haskell tags)
   - Stylish haskell 
   - Haskell Language Server
4. Advanced find
   - fzf (fuzzy)
   - fd (file system)
5. Other
    - ctags
6. Maybe necessary (test)
   - Texlab (Latex LSP)
   - MuPDF (Alternate PDF viewer)
   - MuTool (PDF editing)

MAIN SHORTCUTS
- VimTex
  - \lt - tags do latex	-
  - \ll - compile latex
  - \lv - view pdf
  - \le - view latex erros
  - \lc - clear temporary files
  - Move
    - Move between section boundaries with [[, [], ][, and ]]
    - Move between environment boundaries with [m, [M, ]m, and ]M
    - Move between comment boundaries with [* and ]*
    - Move between matching delimiters with %
  - vim-surround
    - yssc <digitar comando> (envolve a linha posicionada com o comando). Ex: yssc textit
    - ysse <digitar environment> (idem para o environment). Ex: ysse tabular
    - ysee ou ysec (mesma coisa para a palavra posicionada)
- Grammarly (LSPConfig)
  - [d, ]d (navega entre os erros)
  - space> e (mostra o menu flutuante)
  - <space> rn (rename)
  - <space> ca (code action; aplica as sugestões de alteração no código)
-Other
  - Airline Tab
    - :echo g:airline_symbols - símbolos usados na linha de status
  - :AirlineTheme <theme>			
    - Tab, ShiftTab, \1, \2, \3			
    - :bnext, :bprevious, :bfirst			
    - :blast, :b10, :b <buffer-name>, :bdelete[!], :badd
  - Syntastic (Linguagem c)
    - :lnext, :lprevious (navega entre erros) - 	Syntastic
    - [e, ]e (atalhos para navegar entre erros)
    - :Errors (abre janela de erros)			Syntastic
  - TagBar
    - :tjump foo<tab>	- pula para tag		Tagbar
    - F8 - mostra tagbar				Tagbar
  - FZV, VimProc, VIM-FUGITIVE (git), rhubarb
    - :History - últimos arquivos usados		
    - :VimProcBang <comando do SO em uso>	
    - :G - git status						- 
    - :Gcommit, :Gpush, :Gpull				
    - :Git	
