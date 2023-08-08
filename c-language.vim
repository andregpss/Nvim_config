"C Language	(Detalhes no arquivo do drive)
"		:CocInstall coc-clangd
"Baixar clang e clangd: http://releases.llvm.org/download.html
"Inclur na pasta do projeto o arquivo 'compile_flags.txt' o seguinte:
"	-IC:\\MinGW\\include
"	-IC:\\MinGW\\lib\\gcc\\mingw32\\8.2.0\\include

au BufEnter *.c set makeprg=gcc\ -g\ %\ -o\ %< 
au filetype c nnoremap <F9> :call CompileGcc()<CR>

func! CompileGcc()
    exec "w" 
    make			
endfunc
au filetype c nnoremap <F11> :call CompileGccExec()<CR>
func! CompileGccExec()
    exec "w" 
    make
	exec "terminal %:r.exe"		
endfunc
autocmd TermOpen * startinsert "Abre o terminal jah em modo de insercao

lua << EOF
--[[
local navbuddy = require("nvim-navbuddy")
require("lspconfig").clangd.setup{    
        on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
    end
}
--]]
EOF

"Alternativa para compilar e executar em C
"autocmd filetype c nnoremap <F9> :w <bar> exec '!gcc % -o %:r.exe' <bar> exec '!%:r.exe'<CR>
