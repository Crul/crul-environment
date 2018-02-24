nnoremap <silent> <Leader>jsaf $?function[ \(]<cr>V$%
nnoremap <silent> <Leader>jsab $?{<cr>V$%

nmap <silent> <Leader>jqid viwo<Esc>i#<Esc>ysiW"ysiW)i$<Esc>E
nmap <silent> <Leader>jqcl viwo<Esc>i.<Esc>ysiW"ysiW)i$<Esc>E

vnoremap <silent> <Leader>jsxv :call JsExtractVariable(visualmode(), 1)<cr>
nnoremap <silent> <Leader>jsxv :set opfunc=JsExtractVariable<CR>g@
function! JsExtractVariable(vt, ...) range
    let varname = input("Variable name: ")
    silent exec "normal ".SelectByMode(a:0)."c".varname."\<Esc>"
    silent exec "normal Ovar ".varname." = (\<Esc>pa);\<Esc>"
endfunction

vnoremap <silent> <Leader>jsxf :call JsExtractFunction(visualmode(), 1)<CR>
nnoremap <silent> <Leader>jsxf :set opfunc=JsExtractFunction<CR>g@
function! JsExtractFunction(type, ...) range
    let fnname = input("Function name: ")
    let fnargs = input("Function args: ")
    silent exec "normal ".SelectByModeFullLines(a:0)."dO".fnname."(".fnargs.");\<Esc>=="
    silent exec "normal ofunction ".fnname."(".fnargs.") {\<Esc>o}\<Esc>"
    silent exec "normal 0Pk$=%vaf"
endfunction

nnoremap <silent> <Leader>jsfte :call JsForToEach()<CR>
function! JsForToEach()
    let forinregex = '\s*for\s*(var\s*[^ ]*\s*in\s*[^ )]*)\s{'
    if GotoParentJsBlock(forinregex) > 0
        let [iterable, index, elemname] = JsGetForInParams()
    else
        let forregex = '\s*for\s*(var\s*[^ ]*\s*=\s*0\s*;*[^;]*\.length\s*;*[^)]*++)\s{'
        if GotoParentJsBlock(forregex) > 0
            let [iterable, index, elemname] = JsGetForParams()
        else
            echo "for NOT FOUND"
            return
        endif
    endif
    echo "XXX"

    silent exec "normal $va{\<Esc>'<"
    let fnname = input("Function name: ")
    if fnname == ""
        silent exec "normal \"_cc".iterable.".each(function(".index.", ".elemname.") {\<Esc>=="
        silent exec "normal $%a);\<Esc>"
        silent exec "normal 0va{\<Esc>'<"
    else
        silent exec "normal \"_cc".iterable.".each(".fnname.");\<Esc>=="
        silent exec "normal ofunction ".fnname."(".index.", ".elemname.") {\<Esc>"
        silent exec "normal k^"
    endif

    " TODO replace iterable[index] with elemname
    echo "TODO replace iterable[index] with elemname"
endfunction

function! JsGetForParams()
    silent exec "normal /for[^=]*=/e\<CR>b"
    let index = expand('<cword>')
    silent exec "normal /[^ ]*\.length\<CR>"
    let iterable = expand('<cword>')
    let elemname = JsGetForElemName(iterable, index)

    return [iterable, index, elemname]
endfunction

function! JsGetForInParams()
    silent exec "normal / in ./e\<CR>"
    let iterable = expand('<cword>')
    silent exec "normal bb"
    let index = expand('<cword>')
    let elemname = JsGetForElemName(iterable, index)

    return [iterable, index, elemname]
endfunction

function! JsGetForElemName(iterable, index)
    let elemname = "elem"
    silent exec "normal $vi{\<Esc>'<"
    let elemdefregex = "\\s[^\\s=]*\\s*=\\s*".a:iterable."\\[".a:index."\\]"
    let elemdefline = search("var".elemdefregex, "c", line("'>"))
    if elemdefline > 0
        silent exec "normal ".(elemdefline - 1)."G0"
        silent exec "normal /".elemdefregex."\<CR>2w"
        let elemname = expand('<cword>')
        silent exec "normal \"_dd"
    endif

    return elemname
endfunction

function! GotoParentJsBlock(regex)
    let ismatch = match(getline('.'), a:regex)
    if ismatch >= 0
        return 1
    endif

    let initialview = winsaveview()
    let lastlinenum = -1
    while 1
        silent exec "normal 0va{\<Esc>'<"
        let currlinenum = line('.')
        if lastlinenum == currlinenum
            call winrestview(initialview)
            silent exec "normal \<Esc>"
            return 0
        endif

        let ismatch = match(getline('.'), a:regex)
        if ismatch >= 0
            return 1
        endif

        let lastlinenum = currlinenum
    endwhile
endfunction
