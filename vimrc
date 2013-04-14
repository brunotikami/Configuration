set nocompatible
filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on
filetype on
autocmd FileType python setlocal et sta sw=4 sts=4

autocmd FileType python set complete+=k~/.vim/bundle/vim-python-syntax/syntax/python3.vim isk+=.,(

set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set title
colorscheme desert
set laststatus=2
set nobackup
set t_Co=256
let Powerline_symbols='compatible'
set ruler
let g:Powerline_symbols = 'fancy'
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


