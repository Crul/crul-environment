runtime macros/matchit.vim " Extend matching with %

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-underscore'
Plug 'bps/vim-textobj-python'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'jasonlong/vim-textobj-css'

" Declare the list of plugins.
Plug 'tpope/vim-sensible'   " Default configuration
Plug 'tpope/vim-sleuth'     " Detect indentation
Plug 'elzr/vim-json'        " Visualization
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'    " Because coercion
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister' 
Plug 'dominikduda/vim_current_word' " Highlighting CONFIG AFTER call plug#end()

Plug 'MarcWeber/vim-addon-mw-utils' " vim/snipmate dependency
Plug 'tomtom/tlib_vim'              " vim/snipmate dependency
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" TODO maybes:

" Plug 'hougo/deoplete.nvim'        " <Tab> completion options
" Plug 'ervandew/supertab'          " <Tab> completion options
" Plug 'yggdroot/indentline'        " Show indentation vertical lines
" Plug 'mattn/emmet-vim'            " ul>3*li.menu-opt>a
" Plug 'w0rp/ale'                   " Lint

" Plug 'tpope/vim-fugitive'         " GIT
" Plug 'jreybert/vimagit'           " GIT
" Plug 'airblade/vim-gitgutter'     " GIT

" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" Plug 'xolox/vim-session'          " Sessions manual/periodic saving
" Plug 'tpope/vim-obsession'        " Sessions always updated

" Plug 'tpope/vim-projectionist'    " Choose one
" Plug 'thaerkh/vim-workspace'      " Choose one

Plug 'gcavallanti/vim-noscrollbar'
function! CrulScrollbar()
    return noscrollbar#statusline(24, '-', '#')
endfunction

Plug 'yuttie/comfortable-motion.vim'
let g:comfortable_motion_interval = 2000 / 60   " Default 1000/60
let g:comfortable_motion_friction = 300         " Default 80
let g:comfortable_motion_air_drag = 1           " Default 2
nnoremap <silent> C-U> <C-U> :call CrulScrollbar()<CR> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> C-D> <C-D> :call CrulScrollbar()<CR> :call comfortable_motion#flick(100)<CR>

Plug 'ctrlpvim/ctrlp.vim'
" cmder fix https://github.com/Maximus5/ConEmu/issues/641
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>
cnoremap <Char-0x07F> <BS>
let g:ctrlp_max_files = 1000
let g:ctrlp_max_depth = 5
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()': ['<Char-0x07F>', '<c-h>']
\ }

Plug 'itchyny/lightline.vim'
if $ISCONEMU == 1
    " https://conemu.github.io/en/VimXterm.html
    set term=xterm
    set termencoding=utf8
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    set t_Co=256
endif
let g:lightline = {
            \ 'colorscheme': 'default',
            \ 'active': {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'gitbranch', 'readonly', 'filename', 'modified' ]
            \   ],
            \   'right': [
            \     [ 'lineinfo' ],
            \     [ 'noscrollbar', 'fileencoding' ]
            \   ]
            \ },
            \ 'inactive': {
            \   'left': [ [ 'filename' ] ],
            \   'right': [
            \     [ 'lineinfo' ],
            \     [ 'noscrollbar', 'fileencoding' ]
            \   ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head',
            \   'noscrollbar': 'CrulScrollbar'
            \ },
            \ }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" vim_current_word config - SHOULD BE AFTER call plug#end()
hi CurrentWord ctermbg=53
hi CurrentWordTwins ctermbg=127 cterm=none
