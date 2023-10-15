"VEJA O HELP NO FIM DO ARQUIVO

"Uso do vim-surround; inclui comando ys?c e ys?e
augroup latexSurround 
  autocmd!   
  autocmd FileType tex call s:latexSurround() 
augroup END 
function! s:latexSurround() 
  let b:surround_{char2nr("e")} 
    \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}" 
  let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction

"let g:tagbar_type_bib = { 'ctagstype' : 'bibtex'}
"
"Faz com que nenhuma tag (itálico, negrito) do Latex seja ocultada.
"let g:tex_conceal = ''
"let g:vimtex_syntax_conceal = {}

" Opção 1 de plugin para Latex 
"---------- TEXLAB -------------
"   Ver aquivo lspconfig.vim 

" Opção 2
" --------- VIMTEX ---------------
"  1) Install plugins 'Coc' and 'Vimtex'
"  3) On vim, execute ':CocInstall coc-vimtex'
"  2) Retirar os comentários desse bloco: '<>,<>:norm x

"filetype plugin indent on
"syntax enable
"let maplocalleader = ","
"
"let g:vimtex_compiler_progname = 'nvr'
"let g:vimtex_compiler_latexmk = {
""        \ 'build_dir' : 'temp',
""        \ 'callback' : 1,
""        \ 'continuous' : 1,
""        \ 'executable' : 'latexmk',
""        \ 'hooks' : [],		
""        \ 'options' : [
""        \   '-verbose',
""        \   '-file-line-error',
""        \   '-synctex=1',
""        \   '-interaction=nonstopmode',
""        \ ],
""        \}
"let g:vimtex_view_general_viewer = 'SumatraPDF-3.2-64.exe'
"
"autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'
"
""Para destacar os erros de compilação
"let g:vimtex_quickfix_mode = 0
""let g:vimtex_syntax_conceal = 0
"let g:vimtex_view_general_options
""    \ = '-reuse-instance -forward-search @tex @line @pdf'
"
""TESTAR a opção acima com o valor: '--unique file:@pdf\#src:@line@tex'
"
"" Define error highlight group
""highlight link VimtexErrorLine Error
"highlight VimtexWarning guifg=yellow
"highlight VimtexError guifg=green
"highlight VimtexErrorLine guifg=violet
""------------------ VIMTEX END -------------

" ----------------------ARARA COMPILADOR----
"Usando o Arara como compilador.
"let g:vimtex_compiler_method = 'arara'
"Omite o log do Arara quando compila o tex
"let g:vimtex_compiler_arara = {'options' : ['-v'] }

"	Não consigo compilar apenas trechos do documento. Ex:
"			:1,10 VimtexCompileSelected
"NECESSARIO gerar executavel NVR do projeto 'https://github.com/mhinz/neovim-remote'
"	Arara 
"		vem com o miktex; acho que usa o java;
"		Necessário incluir o comando abaixo na primeira linha do main.tex
" % arara: pdflatex if (changed("tex") || missing("pdf")): {
" % arara: --> interaction: nonstopmode,
" % arara: --> synctex: yes
" % arara: --> }
" % arara: bibtex  if (missing("bbl") || found("log", "Citation"))
" % arara: pdflatex if (found("log", "Rerun")) : {
" % arara: --> interaction: nonstopmode,
" % arara: --> synctex:yes
" % arara: --> }
" % arara: pdflatex if (found("log", "Rerun")): {
" % arara: --> interaction: nonstopmode,
" % arara: --> synctex: yes
" % arara: --> }
" % arara: clean: { extensions: [ aux, lof, lot, gz, toc, idx, blg, dvi, ps, yaml ] }
