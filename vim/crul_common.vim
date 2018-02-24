let javaScript_fold=1
let mapleader = "º"

set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags
set encoding=utf-8 nobomb
set fileencoding=utf-8 nobomb
set foldmethod=syntax
set foldnestmax=3 foldlevel=4
set number relativenumber
set pythonthreedll=C:\Python35\python35.dll
set sessionoptions=blank,buffers,curdir,folds,resize,tabpages,winpos,winsize
set splitbelow
set splitright
set tabstop=4 expandtab shiftwidth=4 softtabstop=4
set timeoutlen=3000

" <Alt-ñ> mapped to <Ctrl-Alt-Shft-F12> in terminal (cmder/ConEmu)
map g<M-C-S-F12> g~
map <M-C-S-F12> ~
map! <M-C-S-F12> ~
imap <M-C-S-F12> ~
omap <M-C-S-F12> ~
cmap <M-C-S-F12> ~

inoremap jk <Esc>

:command! QA qa
:command! Qa qa
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Change window size
nnoremap <C-Up> <C-W>-
nnoremap <C-Down> <C-W>+
nnoremap <C-Left> <C-W><
nnoremap <C-Right> <C-W>>

" Move between windows
nnoremap <Up> <C-W>k
nnoremap <Down> <C-W>j
nnoremap <Left> <C-W>h
nnoremap <Right> <C-W>l

" Moving lines https://dockyard.com/blog/2013/09/26/vim-moving-lines-aint-hard
" Moving lines Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Moving lines Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Moving lines Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <F11> :tabprevious<CR>
nnoremap <F12> :tabnext<CR>

function! SelectByMode(isvisual)
    return (a:isvisual ? "`<v`>" : "`[v`]")
endfunction

function! SelectByModeFullLines(isvisual)
    return (a:isvisual ? "`<v`>" : "`[0v`]$")
endfunction

autocmd BufRead,BufNewFile */CursoRelatividadGeneralJavierGarcia/index.html nmap <silent> <Leader>newc gg?<h2 id="capitulo-\d<CR>/div <CR>%V%ky`>o<Esc>p/capitulo-\d/e<CR><C-X>/Capítulo \d/e<CR><C-A>"zyiw/capitulo-\d<CR><C-X>diti<CR><div class="grupo-formulas"><CR><span class="formula-titulo"><CR>(<Esc>"zpa.1) TITULO FORMULA<CR></span><CR><span class="formula"><CR>LaTeX ForMuLa<CR></span><CR></div><CR><Esc>=itgg?<\/ul><CR>?<li><CR>V3jy`>p/\d<CR><C-X>n<C-A>/index=\d/e<CR><C-A>?watch\?v=[^&]*?e<CR>ciwYOUTUBEVIDEOID<Esc>viw
