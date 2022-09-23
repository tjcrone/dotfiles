" sources by file type
"autocmd FileType cpp source ~/.vim/after/ftplugin/cpp.vim
"autocmd FileType tex source ~/.vim/after/ftplugin/tex.vim

" custom syntax definitions
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd! BufNewFile,BufRead *.html,*.htm setlocal ft=php
autocmd! BufNewFile,BufRead *_in setlocal ft=matlab

" color
colorscheme peachpuff

" modelines
set modeline
set modelines=5

" show partial wrapped lines
set display=lastline

" search highlighting
set hlsearch

syntax on
 set nocompatible
 set backspace=2

" proper wrapping
set wrap lbr
set textwidth=0
set wrapmargin=0

" key remapping for wrapped text
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" testing
set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set guifont=Monaco:h11
set guifontwide=NSimsun:h12

" line numbers
set number
highlight LineNr ctermfg=235
