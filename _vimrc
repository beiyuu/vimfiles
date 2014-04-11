set nocompatible          "不要兼容vi
filetype off              "必须的设置：

"Color Settings {
set colorcolumn=85           "彩色显示第85行
set t_Co=256                 "设置256色显示
set background=dark          "使用color solarized
set cursorline               "设置光标高亮显示
set cursorcolumn             "光标垂直高亮
set ttyfast
set ruler
set backspace=indent,eol,start

"}

"tab setting {
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"}

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set scrolloff=3
set fenc=utf-8
set autoindent
set hidden
set noswapfile
"set encoding=utf-8

"set laststatus=2
"set number                                    "显示行号
"set undofile                                  "无限undo
"set nowrap                                    "禁止自动换行
"autocmd! bufwritepost _vimrc source %         "自动载入配置文件不需要重启

"相对行号 要想相对行号起作用要放在显示行号后面
set relativenumber
"自动换行
set wrap
"GUI界面里的字体，默认有抗锯齿
set guifont=Inconsolata:h12
"将-连接符也设置为单词
set isk+=-

set ignorecase "设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch

set numberwidth=4          "行号栏的宽度
"set columns=135           "初始窗口的宽度
"set lines=50              "初始窗口的高度
"winpos 620 45             "初始窗口的位置

set whichwrap=b,s,<,>,[,]  "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

"===================================================
"修改leader键为逗号
let mapleader=","
imap jj <esc>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"修改vim的正则表达
nnoremap / /\v
vnoremap / /\v

"使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %

"折叠html标签 ,fold tag
nnoremap <leader>ft vatzf
"使用,v来选择刚刚复制的段落，这样可以用来缩进
nnoremap <leader>v v`]

"使用,w来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
nnoremap <leader>w <c-w>v<c-w>l
nnoremap <leader>wc <c-w>c
nnoremap <leader>ww <c-w>w

"tab切换
nnoremap <leader>t gt
nnoremap <leader>r gT
"使用<leader>空格来取消搜索高亮
nnoremap <leader><space> :noh<cr>

"html中的js加注释 取消注释
nmap <leader>h I//jj
nmap <leader>ch ^xx
"切换到当前目录
nmap <leader>q :execute "cd" expand("%:h")<CR>
"搜索替换
nmap <leader>s :,s///c

"取消粘贴缩进
nmap <leader>p :set paste<CR>
nmap <leader>pp :set nopaste<CR>

"文件类型切换
nmap <leader>fj :set ft=javascript<CR>
nmap <leader>fc :set ft=css<CR>
nmap <leader>fh :set ft=html<CR>
nmap <leader>fm :set ft=mako<CR>

"设置隐藏gvim的菜单和工具栏 F2切换
set guioptions-=m
set guioptions-=T
"去除左右两边的滚动条
set go-=r
set go-=L

map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


"Vundle Settings {
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Emmet.vim'
Bundle 'Auto-Pairs'
Bundle 'matchit.zip'
Bundle 'Tabular'
Bundle 'trailing-whitespace'
Bundle 'cakebaker/scss-syntax.vim'
Bundle "pangloss/vim-javascript"
Bundle "othree/html5.vim"
Bundle "beiyuu/vim-bundle-mako"
Bundle "ayang/AutoComplPop"
Bundle "vim-scripts/jinja--Yang"

Bundle "Solarized"
  colorscheme solarized
  let g:solarized_termtrans  = 1
  let g:solarized_termcolors = 256
  let g:solarized_contrast   = "high"
  let g:solarized_visibility = "high"

Bundle "ervandew/supertab"
  let g:SuperTabDefaultCompletionType = "<c-n>"

Bundle 'ctrlp.vim'
  let g:ctrlp_cmd = 'CtrlPMRU'

Bundle 'EasyMotion'
  let g:EasyMotion_leader_key = '<Leader><Leader>'

Bundle 'The-NERD-tree'
  "设置相对行号
  nmap <leader>nt :NERDTree<cr>:set rnu<cr>
  let NERDTreeShowBookmarks=1
  let NERDTreeShowFiles=1
  let NERDTreeShowHidden=1
  let NERDTreeIgnore=['\.$','\~$']
  let NERDTreeShowLineNumbers=1
  let NERDTreeWinPos=1

Bundle 'The-NERD-Commenter'
  let NERDShutUp=1
  "支持单行和多行的选择，//格式
  map <c-h> ,c<space>

Bundle 'UltiSnips'
  let g:UltiSnipsExpandTrigger="<c-j>"
  let g:UltiSnipsJumpForwardTrigger="<c-j>"
  let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"Bundle 'FencView.vim'
  "let g:fencview_autodetect=1
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'terryma/vim-multiple-cursors'
"Bundle '_jsbeautify'
  "nnoremap <leader>_ff :call g:Jsbeautify()<CR>
"Bundle 'nathanaelkane/vim-indent-guides'
  "let g:indent_guides_enable_on_vim_startup=1
  "let g:indent_guides_guide_size=1

"}
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

"放置在Bundle的设置后，防止意外BUG
filetype plugin indent on
syntax on
