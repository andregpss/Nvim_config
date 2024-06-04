""""""""""""""""""
" KNAP functions "
""""""""""""""""""
" F5 processes the document once, and refreshes the view "
inoremap <silent> <F1> <C-o>:lua require("knap").process_once()<CR>
vnoremap <silent> <F1> <C-c>:lua require("knap").process_once()<CR>
nnoremap <silent> <F1> :lua require("knap").process_once()<CR>

" F7 toggles the auto-processing on and off "
inoremap <silent> <F2> <C-o>:lua require("knap").toggle_autopreviewing()<CR>
vnoremap <silent> <F2> <C-c>:lua require("knap").toggle_autopreviewing()<CR>
nnoremap <silent> <F2> :lua require("knap").toggle_autopreviewing()<CR>

" F6 closes the viewer application, and allows settings to be reset "
inoremap <silent> <C-F2> <C-o>:lua require("knap").close_viewer()<CR>
vnoremap <silent> <C-F2> <C-c>:lua require("knap").close_viewer()<CR>
nnoremap <silent> <C-F2> :lua require("knap").close_viewer()<CR>

" F8 invokes a SyncTeX forward search, or similar, where appropriate "
inoremap <silent> <C-F4> <C-o>:lua require("knap").forward_jump()<CR>
vnoremap <silent> <C-F4> <C-c>:lua require("knap").forward_jump()<CR>
nnoremap <silent> <C-F4> :lua require("knap").forward_jump()<CR>

 
lua << EOF
local gknapsettings = {
    texoutputext = "pdf",
    textopdf = "pdflatex -interaction=batchmode -halt-on-error -synctex=1 %docroot%",
    textopdfviewerrefresh = "none",
    textopdfviewerlaunch = "sioyek --inverse-search \"nvim --headless -es\"  --new-window %outputfile%",
    -- textopdfviewerlaunch = "sioyek --inverse-search \"nvim --headless --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"\" --new-window %outputfile%",
    textopdfviewerrefresh = "none",
     textopdfforwardjump = "sioyek --inverse-search \"nvim --headless -es\" --reuse-window --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",   
    -- textopdfforwardjump = "sioyek --inverse-search \"nvim --headless -c \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"\" --reuse-window --forward-search-file %srcfile% --forward-search-line %line% %outputfile%",   
    textopdfshorterror = "A=%outputfile% ; LOGFILE=\"${A%.pdf}.log\"" }

    vim.g.knap_settings = gknapsettings

EOF
