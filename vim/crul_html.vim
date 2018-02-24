autocmd BufRead,BufNewFile *.html set foldmethod=indent
autocmd BufRead,BufNewFile *.html set tabstop=2 expandtab shiftwidth=2 softtabstop=2

command! HtmlJs normal viwo<Esc>i<script src="<Esc>ea"></script><Esc>^
nnoremap <Leader>htmlcss :HtmlCss<CR>

command! HtmlCss normal viwo<Esc>i<link rel="stylesheet" type="text/css" href="<Esc>ea.css"><Esc>^
nnoremap <Leader>htmljs :HtmlJs<CR>
