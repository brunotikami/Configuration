syntax on
filetype plugin on
filetype plugin indent on

colorscheme desert
autocmd FileType python setlocal et sta sw=4 sts=4

execute pathogen#infect()
set nocompatible
set showcmd
set mouse=a
set ruler
set cindent
set expandtab
set tabstop=4
set shiftwidth=4
set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
map <C-x> :NERDTreeToggle<CR>
set autoindent
set smartindent
set paste
set backspace=indent,eol,start
set textwidth=0
set wildmenu
set commentstring=\ #\ %s
set encoding=utf-8
set grepprg=grep\ -nH\ $*
let g:pydiction_location='~/.vim/after/ftplugin/pydiction/complete-dict'
autocmd FileType python set complete+=k~/.vim/syntax/python3.0.vim isk+=.,(
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"进行版权声明的设置
"添加或更新头
map <F4> :call TitleDet()<cr>'s
function AddTitle()
    call append(0,"#===============================================================#")
    call append(1,"#")
    call append(2,"# Author: mapleray")
    call append(3,"#")
    call append(4,"# gtalk/email: zhiwuliao@gmail.com")
    call append(5,"#")
    call append(6,"# My blog: http://mapleray.net")
    call append(7,"#")
    call append(8,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(9,"#")
    call append(10,"# Filename: ".expand("%:t"))
    call append(11,"#")
    call append(12,"# Description: ")
    call append(13,"#")
    call append(14,"#===============================================================#")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
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
