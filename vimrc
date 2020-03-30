runtime! debian.vim

call plug#begin('~/.vim/plugged')
    Plug 'itchyny/calendar.vim'
    Plug 'preservim/nerdcommenter'
    Plug 'mbbill/echofunc'
    Plug 'Yggdroot/LeaderF'
    Plug 'jiangmiao/auto-pairs'
    Plug 'mhinz/vim-startify'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'Yggdroot/indentLine'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'ryanoasis/vim-devicons'
    Plug 'Chiel92/vim-autoformat'
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

map <F8> :call GenerateTags()<cr>
func! GenerateTags()
    exec '!ctags -R --fields=+lS'
endfunc

map <F11> :call Run()<cr> 
func! Run()
    exec 'w'
    if &filetype is 'cpp' || &filetype is 'c' || &filetype is 'cc'
        exec '!g++ -Wall -std=c++11 % -o %<'
        exec '!./%<'
    else
        echo 'Not a cpp or c file'
    endif
endfunc

map <F9> :call Compile()<cr>
func! Compile()
    exec 'w'
    if &filetype is 'cpp' || &filetype is 'c' || &filetype is 'cc'
        "exec '!ctags -R --fields=+lS'
        exec '!g++ -Wall -std=c++11 % -o %<'
    else
        echo 'Not a cpp or c file'
    endif
endfunc


map <F12> :call Settitle()<cr>Gi
map <C-A> ggvGl
map <Leader>pi :PlugInstall<cr>
map <Leader>ps :PlugStatus<cr>
map <C-K> <plug>NERDCommenterToggle
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

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
    let l = l + 1 | call setline(l, '#include <cmath>')
    let l = l + 1 | call setline(l, '#define mst(a,b) memset((a),(b),sizeof(a))')
    let l = l + 1 | call setline(l, '#define debug printf("debug\n")')
    let l = l + 1 | call setline(l, '#define INF 0x3f3f3f3f')
    let l = l + 1 | call setline(l, '#define lson lef,mid,rt<<1')
    let l = l + 1 | call setline(l, '#define rson mid+1,rig,rt<<1|1')
    let l = l + 1 | call setline(l, 'const int maxn=1e5+5;')
    let l = l + 1 | call setline(l, 'using namespace std;')
    let l = l + 1 | call setline(l , 'typedef long long ll;')
    let l = l + 1 | call setline(l, 'typedef unsigned long long ull;')
    let l = l + 1 | call setline(l, '')
endfunc

map ;y :!/mnt/c/Windows/System32/clip.exe<cr>u
map ;p :read !/mnt/c/Windows/System32/paste.exe <cr>i<bs><esc>l
map! ;p <esc>:read !/mnt/c/Windows/System32/paste.exe <cr>i<bs><esc>l
map <F2> :Autoformat<cr>
map <Leader>n :edit

" 完成补全后自动关闭函数原型提示窗口i
let g:ycm_autoclose_preview_window_after_completion=1 


" 当vim打开一个目录时, nerdtree自动使用
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" 打开新的窗口时, focus在buffer中而不是nerdtree
autocmd VimEnter * :wincmd l

" 当vim中没有其他文件, 只剩下nerdtree时, 自动关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

set noswapfile
