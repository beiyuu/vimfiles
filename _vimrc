"必须的设置：
filetype off
"不要兼容vi
set nocompatible

"使用color solarized
set background=dark
colorscheme solarized
"terminal下面的背景问题
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"

set modelines=0


"tab键的设定
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"一些其他的设定
"字符设置
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set encoding=utf-8
set scrolloff=3
"新建文件编码
set fenc=utf-8
set autoindent
set hidden
"设置光标高亮显示
set cursorline
set cursorcolumn
set ttyfast
set ruler
set backspace=indent,eol,start
"set laststatus=2
"相对行号 要想相对行号起作用要放在显示行号后面
set relativenumber
"显示行号
"set number
"无限undo
"set undofile
"自动换行
set wrap
"禁止自动换行
"set nowrap
"GUI界面里的字体，默认有抗锯齿
set guifont=Inconsolata:h12
"自动载入配置文件不需要重启
"autocmd! bufwritepost _vimrc source %
"将-连接符也设置为单词
set isk+=-


"设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set ignorecase
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch


"加入html标签配对
"runtime macros/matchit.vim 

"以下设置用来是vim正确显示过长的行
"set textwidth=80
"set formatoptions=qrnl
"彩色显示第85行
set colorcolumn=85
"设置256色显示
set t_Co=256


"行号栏的宽度
set numberwidth=4
"初始窗口的宽度
"set columns=135
"初始窗口的高度
"set lines=50
"初始窗口的位置
"winpos 620 45 

"匹配括号的规则，增加针对html的<>
"set matchpairs=(:),{:},[:],<:>
"让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set whichwrap=b,s,<,>,[,]

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

"===================================================
"leader键的功能设置
"修改leader键为逗号
let mapleader=","
"esc的映射
imap jj <esc>
"屏蔽掉讨厌的F1键
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
"使用<leader>t来控制Tab的切换
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
"跳转到该行的指定百分比处,30g| 跳转到该行30%处
nnoremap <expr> g<Bar> '<Esc>' . float2nr( round( (col('$')-1) * min([100, v:count]) / 100.0)) . '<Bar>'

"取消粘贴缩进
nmap <leader>p :set paste<CR>
nmap <leader>pp :set nopaste<CR>

"文件类型切换
nmap <leader>fj :set ft=javascript<CR>
nmap <leader>fc :set ft=css<CR>
nmap <leader>fx :set ft=xml<CR>
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

"===================================================
"插件的设置

"Indent Guides设置
let g:indent_guides_guide_size=1


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'ctrlp.vim'
Bundle 'AutoClose'
Bundle 'ZenCoding.vim'
Bundle 'matchit.zip'
Bundle 'ShowTrailingWhitespace'
Bundle 'Tabular'

Bundle 'Valloric/YouCompleteMe'

"jsbeautify的设置
Bundle '_jsbeautify'
nnoremap <leader>_ff :call g:Jsbeautify()<CR>  

"EasyMotion设置
Bundle 'EasyMotion'
let g:EasyMotion_leader_key = '<Leader><Leader>' 

"Fencview的初始设置
"Bundle 'FencView.vim'
"let g:fencview_autodetect=1

"NerdTree的设置 并且相对行号显示
Bundle 'The-NERD-tree'
nmap <leader>nt :NERDTree<cr>:set rnu<cr>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=1

"对NERD_commenter的设置
Bundle 'The-NERD-Commenter'
let NERDShutUp=1
"支持单行和多行的选择，//格式
map <c-h> ,c<space>

Bundle 'UltiSnips'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"放置在Bundle的设置后，防止意外BUG
filetype plugin indent on
"打开高亮 syntax enable
syntax on
