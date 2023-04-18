"VEJA O HELP NO FIM DO ARQUIVO

" Vimtex config
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : 'temp',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],		
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
let g:vimtex_view_general_viewer = 'SumatraPDF-3.2-64.exe'

autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'

let g:tagbar_type_tex = {
    \ 'ctagstype' : 'latex',
    \ 'kinds'     : [
        \ 's:sections',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0,
\ }

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

"NECESSARIO executar comando ':helptags .' na primeira vez para criar tags
"NECESSARIO incluir arquivos iniciais dos projetos
let g:gutentags_project_root = ['main.tex']

"Para destacar os erros de compilação
let g:vimtex_quickfix_mode = 0
"let g:vimtex_syntax_conceal = 0

" Define error highlight group
"highlight link VimtexErrorLine Error
highlight VimtexWarning guifg=yellow
highlight VimtexError guifg=green
highlight VimtexErrorLine guifg=violet
" Set underline style for error highlighting
"highlight Error cterm=underline gui=underline

"let g:vimtex_complete_bib = { 'simple': 0 }

"Faz com que nenhuma tag (itálico, negrito) do Latex seja ocultada.
"let g:tex_conceal = ''
"let g:vimtex_syntax_conceal = {}

"Sublinha os textos em itálico e negrito
"Não está funcionado, mas se colocar direto no nvim, funciona
"hi texItalStyle cterm=underline gui=underline
"Usando o Arara como compilador.
"let g:vimtex_compiler_method = 'arara'
"Omite o log do Arara quando compila o tex
"let g:vimtex_compiler_arara = {'options' : ['-v'] }

"let g:vimtex_view_general_viewer = 'mupdf.exe'
"NECESSARIO instalar : ':CocInstall coc-vimtex'
"	Comando goto definition 'gd' não funciona. Utilizo tags para substituir isso.
"	Não consigo compilar apenas trechos do documento. Ex:
"			:1,10 VimtexCompileSelected
"NECESSARIO gerar executavel NVR do projeto 'https://github.com/mhinz/neovim-remote'
"NECESSARIO verificar o compilador 
" 	Latexmk
"		vem com 'miktex'. 
"		Ele utiliza o perl. É necessário instalar o Perl por fora.
"		Se houver erro na versão do Perl, coloque, no Path, o caminho para o Perl instalado como um dos primeiros paths verificados.
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

"NECESSARIO baixar viewer de pdf:
"	https://mupdf.com/ (bem simples)
"	SamantraPDF (mais completo que o anterior)"

"Testei o TEXLAB, mas não encontrava as referências a tags de outros arquivos
"	nem às referências bibliográficas.
"	Para instalar: ':CocInstall coc-texlab'
"	Acho que no texlab, a completação de código só funcionam após compilação gerar arquivos auxiliares.
"	Acho que os arquivos .aux não podem ser apagados pois servem para gerar estrutura lida quando digitamos '\ref'"		 
"	Por outro lado, com o texlab, é possível compilar capítulos separados, desde que use pacote subfiles do latex.
"	Exibe o pdf ao finalizar a compilação.

"Essa configuração usa o texlab; problemas ao completar \cite, \ref.
"call coc#config('latex', {
"  \   'lint.onChange': v:true,
"  \	  'latex.build.executable': 'arara',
"  \   'forwardSearch.executable': 'mupdf.exe',
"  \   'forwardSearch.args': ['--synctex-forward', '%l:1:%f', '%p'],
"  \   'build.args': ['-pdf', '-interaction=nonstopmode', '-synctex=1', '-pvc']
"  \ })
"nmap <F11> :CocCommand latex.Build<CR>  
