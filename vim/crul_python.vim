autocmd BufRead,BufNewFile *.py set foldmethod=indent foldlevel=2 foldnestmax=2
autocmd BufRead,BufNewFile *.py set tabstop=2 expandtab shiftwidth=2 softtabstop=2

vnoremap <silent> <Leader>pyxv :call PyExtractVariable(visualmode(), 1)_python.vim
nnoremap <silent> <Leader>pyxv :set opfunc=PyExtractVariable<CR>g@
function! PyExtractVariable(vt, ...) range
    let varname = input("Variable name: ")
    silent exec "normal ".SelectByMode(a:0)."c".varname."\<Esc>"
    silent exec "normal O".varname." = (\<Esc>pa)\<Esc>"
endfunction

vnoremap <silent> <Leader>pyxf :call PyExtractFunction(visualmode(), 1)<CR>
nnoremap <silent> <Leader>pyxf :set opfunc=PyExtractFunction<CR>g@
function! PyExtractFunction(type, ...) range
    let fnname = input("Function name: ")
    let fnargs = input("Function args: ")
    silent exec "normal ".SelectByModeFullLines(a:0)."dO".fnname."(".fnargs.")\<Esc>=="
    silent exec "normal ]Mo\<CR>\<CR>def ".fnname."(".fnargs."):\<Esc><<"
    silent exec "normal o\<Esc>0gPo\<Esc>\<C-o>"
endfunction

