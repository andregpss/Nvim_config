"search for the keyword under the cursor in the current directory
"<C-R><C-W> command is the same as expand('<cword>') 
map <F7> :vimgrep <C-R><C-W> *<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>


" Abra FZF em janela popup
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"Comando find conforme abaixo sรณ funciona no LINUX
"let $FZF_DEFAULT_COMMAND = "find * -path '*/.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"Defalt: g:grepprg = findstr /n $* nul
"	/n mostra numero da linha
"	$	Posição da expresão linha: fim da linha
"	*	Repetir: zero ou mais ocorrências da classe ou caractere anterior
if has("win64") || has("win32") || has("win16")
	let g:grepprg = "findstr /s /i /n"
	map <F6> :execute "grep " . expand("<cword>") . " *.*" <bar> cw <CR>
	let $FZF_DEFAULT_COMMAND ="dir /s /b" 
else 
	let $FZF_DEFAULT_COMMAND ="ls"
endif

if executable('fd')
	"NECESSÁRIO baixar executavel fd em github.com/sharkdp/fd
	let $FZF_DEFAULT_COMMAND ="fd --type f -E dist -E dist-newstyle -E stack"
endif

" The Silver Searcher
"	NECESSARIO baixar: choco install ag
" ag --ignore "*.aux" --ignore "*.bbl" hughes
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git  -g ""'
  set grepprg=ag\ --ignore=*.aux\ --ignore=*.bbl\ --ignore=*.bcf\ --ignore=tags\ --ignore=trash\ --nogroup\ --nocolor
  map <F6> :execute "grep " . expand("<cword>")  <bar> cw <CR>
endif

"let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
"if executable('ag')
"  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
"  set grepprg=ag\ --nogroup\ --nocolor
"endif

" ripgrep
"if executable('rg')
"  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
"  set grepprg=rg\ --vimgrep
"  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"endif

" grep.vim
"nnoremap <silent> <leader>f :Rgrep<CR>
"let Grep_Default_Options = '-IR' "I=Process a binary file; 
					"R=read and process all files in that directory, recursively
"let Grep_Skip_Files = '*.log *.db'
"let Grep_Skip_Dirs = '.git node_modules dist dist-newstyle .idea .stack-work'

"Grep_Skip_Dirs and Grep_Skip_Files only used in the command started with "R":
" ragrep, regrep, rfgrep, rgrep
"let g:Grep_Skip_Dirs = 'dist stack .git node_modules dist-newstyle .idea .stack-work'
"let g:grep_skip_files = '*.bak *.log *.out *.aux tags *.db *.bcf'
