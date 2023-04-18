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

- COC
K - mostra documentação da função 	- COC
[g - próximo comentário lint		- HIE /coc
]g - comentário anterior lint		- HIE / coc
<leader>rn (coc-rename)
<c-space> to trigger completion - Coc
\f - formata código selecionado
:Format - formata todo o código do arquivo
<espaço>+a - mostra todo o diagnóstico/dicas do código 
<espaço>+o - mostra a relação de funções do arquivo
/p - aplica as correções do code lens (aquelas exibidas como texto virtual)
	OU add a fake signature like myFunction :: _, selected the _ character and then pressed \a.
gd (coc-definition)	
Abre a implementação da função
gy (coc-type-definition) 
Jump to type definition(s) of current symbol by invoke
gi (coc-implementation) 
Aparentemente não implementado. Acredito que é desnecessário devido aos dois acima.
gr (coc-references)	
Lista todas as referências no projeto para o termo em questão

- NerdTree
<F2> ou <Leader>v ou :NERDTreeFind	 
<F3> ou <Leader>n ou :NERDTreeToggle
hjkl - navega similar às teclas de navegação
r - atualiza o diretório corrente
m - mostra o menu
B - mostra/oculta os bookmarks
x - fecha o diretório corrente
X - fecha todos os diretórios abertos
e - abre o diretório corrente na janela principal
p - move para o diretório pai

- Comentários
gcc - comenta linha				- VIM-COMMENTARY
gc - comenta seleção				- VIM-COMMENTARY
:<inicio>,<fim>Commentary - commenta todas as linhas entre <inicio> e <fim>
:g/TODO/Commentary - move para o próximo TODO - VIM-COMMENTARY

- Stylish Haskell, HLint 
\qf - (quick fix) aplica sugestão de código do hlint em todo o código
\a - lista a sugestão/action para o comando onde o cursor está posicionado. Atenção que o menu popup aparece na frente da lista. É necessário pressionar algum dos botões para cima/para baixo
\ac - lista todas as dicas/actions
to - Apply one hint at cursor position (?)
ta - Apply all suggestions in the file (?)
:CocFix - idem a ‘ta’ (?)
<leader>gq - aplicar

- C Programming (Linguagem C)
[e, ]e (atalhos para navegar entre erros) (:lnext, :lprevious)
:Errors (abre janela de erros)	
F9 - Compila arquivos .c
F11 - Compila e executa arquivos .c

- VimTex
Compilar e ver PDF
\lt - tags do latex	-
\ll - compile latex
\lv - view pdf
\le - view latex erros
\lc - clear temporary files
Move
Move between section boundaries with [[, [], ][, and ]]
Move between environment boundaries with [m, [M, ]m, and ]M
Move between comment boundaries with [* and ]*
Move between matching delimiters with %
vim-surround
yssc <digitar comando> (envolve a linha posicionada com o comando). Ex: yssc textit
ysse <digitar environment> (idem para o environment). Ex: ysse tabular
ysee ou ysec (mesma coisa para a palavra posicionada)

- Grammarly (LSPConfig)
[d, ]d (navega entre os erros)
<space> e (mostra o menu flutuante)
<space> rn (rename)
<space> ca (code action; aplica as sugestões de alteração no código)

- Diversos (Git, Airline, Syntastic, Tabbar, Tagbar,FZV,VimProc)
Airline Tab
:echo g:airline_symbols - símbolos usados na linha de status
:AirlineTheme <theme>			
Tab, ShiftTab, \1, \2, \3			
:bnext, :bprevious, :bfirst			
:blast, :b10, :b <buffer-name>, :bdelete[!], :badd
Syntastic (Linguagem c)
:lnext, :lprevious (navega entre erros) - 	Syntastic
[e, ]e (atalhos para navegar entre erros)
:Errors (abre janela de erros)			Syntastic
TagBar
:tjump foo<tab>	- pula para tag		Tagbar
F8 - mostra tagbar				Tagbar
FZV, VimProc, VIM-FUGITIVE (git), rhubarb
:History - últimos arquivos usados		
:VimProcBang <comando do SO em uso>	
:G - git status						- 
:Gcommit, :Gpush, :Gpull				
:Git	
