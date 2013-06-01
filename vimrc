set nocompatible
filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on
filetype on
autocmd FileType python setlocal et sta sw=4 sts=4

autocmd FileType python set complete+=k~/.vim/bundle/vim-python-syntax/syntax/python3.vim isk+=.,(

let g:solarized_termcolors=256
set number

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
call togglebg#map("<F5>")
set title
set background=dark
colorscheme solarized
set laststatus=2
set nobackup
set t_Co=256
let Powerline_symbols='compatible'
set ruler
let g:Powerline_symbols ='fancy'
set hlsearch
set incsearch
set showmode
set showcmd
set mouse=a
set foldmethod=indent
set foldlevel=99
set autoindent
set smartindent
set backspace=indent,eol,start
set encoding=utf-8
set cindent
set expandtab
set softtabstop=4
set shiftwidth=4
set paste
set tabstop=4
set commentstring=\ #\ %s
set completeopt+=longest


let g:pydoc_cmd = '/usr/bin/pydoc3.3' 
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 15
let g:ctags_path='~/.vim/ctags'

map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l
map <C-h> <c-w>h
map <C-x> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif




"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"进行版权声明的设置
"添加或更新头
map <F4> :call TitleDet()<cr>'s
function AddTitle()
    call append(0,"#############################################")
    call append(1,"#")
    call append(2,"# -*- coding:utf-8 -*-")
    call append(3,"#")
    call append(4,"# Author: mapleray")
    call append(5,"#")
    call append(6,"# gtalk/mail: zhiwuliao@gmail.com")
    call append(7,"#")
    call append(8,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(9,"#")
    call append(10,"# Filename: ".expand("%:t"))
    call append(11,"#")
    call append(12,"# Description: ")
    call append(13,"#")
    call append(14,"############################################")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction
