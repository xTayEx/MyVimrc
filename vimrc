" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
call plug#begin('~/.vim/plugged')
    "Plug 'itchyny/lightline.vim'
    Plug 'Yggdroot/LeaderF'
    Plug 'jiangmiao/auto-pairs'
    Plug 'mhinz/vim-startify'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'Yggdroot/indentLine'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'ryanoasis/vim-devicons'
call plug#end()
if has("syntax")
  syntax on
endif
set laststatus=2


if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set number
syntax on
colorscheme monokai
set mouse=a
set encoding=utf-8
filetype indent on
set autoindent
set tabstop=4
set expandtab
set softtabstop=4
set smarttab
set showmatch
filetype on
filetype plugin on
filetype indent on
set shiftwidth=4
set linespace=0
set noshowmode
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let mapleader=','
set encoding=utf8
set termencoding=utf-8
map <F3> :NERDTreeToggle<CR>
let g:startify_custom_header=
    \ 'startify#center(startify#fortune#cowsay())'


let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "+",
    \ "Untracked" : "*",
    \ "Renamed"   : "→",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "×",
    \ "Dirty"     : "😥",
    \ "Clean"     : "😊",
    \ 'Ignored'   : "I",
    \ "Unknown"   : "?"
    \ }

nnoremap <Leader>ve :vsp /etc/vim/vimrc<cr>
nnoremap <Leader>vs :source /etc/vim/vimrc<cr>
map <C-N> :bn<cr>
map <C-P> :bp<cr>
map <Leader>bd :bd<cr>
nnoremap <Leader>1 :b1<cr>
nnoremap <Leader>2 :b2<cr>
nnoremap <Leader>3 :b3<cr>
nnoremap <Leader>4 :b4<cr>
nnoremap <Leader>5 :b5<cr>
nnoremap <Leader>6 :b6<cr>
nnoremap <Leader>7 :b7<cr>
nnoremap <Leader>8 :b8<cr>
nnoremap <Leader>9 :b9<cr>
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

let g:Lf_StlSeparator={'left': '', 'right': '', 'font:': 'consola NF'}

map <F11> :call Run()<cr> 
func! Run()
    exec 'w'
    if &filetype is 'cpp' || &filetype is 'c' || &filetype is 'cc'
        exec '!g++ -Wall -std=c++11 % -o %<'
        exec '!./%<'
    else
        echo 'Not Cpp or C file'
    endif
endfunc

map <F9> :call Compile()<cr>
func! Compile()
    exec 'w'
    if &filetype is 'cpp' || &filetype is 'c' || &filetype is 'cc'
        exec '!g++ -Wall -std=c++11 % -o %<'
    else
        echo 'Not Cpp or C file'
    endif
endfunc

map <F12> :call Settitle()<cr>

func! Settitle()
    let l = 0
    let l = l + 1 | call setline(l, '#include <iostream>')
    let l = l + 1 | call setline(l, '#include <cstdio>')
    let l = l + 1 | call setline(l, '#include <algorithm>')
    let l = l + 1 | call setline(l, '#include <cstring>')
    let l = l + 1 | call setline(l, '#include <string>')
    let l = l + 1 | call setline(l, '#include <vector>')
    let l = l + 1 | call setline(l, '#include <map>')
    let l = l + 1 | call setline(l, '#include <stack>')
    let l = l + 1 | call setline(l ,'#include <queue>')
    let l = l + 1 | call setline(l, '#include <set>')
    let l = l + 1 | call setline(l, '#include <cctype>')
    let l = l + 1 | call setline(l, '#define mst(a,b) memset((a),(b),sizeof(b))')
    let l = l + 1 | call setline(l, '#define debug printf("debug\n")')
    let l = l + 1 | call setline(l, '#define INF 0x3f3f3f3f')
    let l = l + 1 | call setline(l, '#define lson lef,mid,rt<<1')
    let l = l + 1 | call setline(l, '#define rson mid+1,rig,rt<<1|1')
    let l = l + 1 | call setline(l, 'const int maxn=1e5+5;')
    let l = l + 1 | call setline(l, 'using namespace std;')
    let l = l + 1 | call setline(l , 'typedef long long ll;')
    let l = l + 1 | call setline(l, 'typedef unsigned long long ull;')
endfunc

