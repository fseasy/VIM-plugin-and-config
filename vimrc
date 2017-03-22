" == Using Vundle for Plugin Managing. ==
" Vundle config start.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Previous config.
set t_ku=OA
set t_kd=OB
set t_kr=OC
set t_kl=OD
set nocp
let autosave=5
set sw=4
set ts=4
set softtabstop=4
set smarttab
set smartindent
set nu
set et
syntax on
set backspace=indent,eol,start
filetype indent on
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8
set noeb vb t_vb=
" avoid ctrl + space 's bad effictive
imap <Nul> <Space>
" avoid the case when typing `#` for comment in Python, the cursor run to the
" - start of the line.
" - see http://stackoverflow.com/questions/2063175/comments-go-to-start-of-line-in-the-insert-mode-in-vim
au! FileType python setl nosmartindent

colorscheme desert
set background=dark

" NERDTree config
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" 定位到编辑窗口 
autocmd VimEnter * wincmd p

" powerline
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\
set laststatus=2

" indent guides 
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=lightgrey
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"添加作者信息
map <F4> ms:call AddAuthor()<cr>'S
function AddAuthor()
    let n=1
    while n < 11
        let line = getline(n)
        if line=~'[#]*\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    if &filetype == 'sh'
        call AddTitleForShell()
    elseif &filetype == 'python'
        call AddTitleForPython()
    else
        call AddTitleForC()
    endif

endfunction


function UpdateTitle()
    normal m'
    execute '/* Last modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
    normal mk
    execute '/* Filename\s*:/s@:.*$@\=": ".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." |echohl None
endfunction

function AddTitleForC()
    call append(0,"/**********************************************************")
    call append(1," * Author        : xu wei")
    call append(2," * Email         : readonlyfile@hotmail.com")
    call append(3," * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(4," * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(5," * Filename      : ".expand("%:t"))
    call append(6," * Description   : ")
    call append(7," * *******************************************************/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

"" add comment for Python
function AddTitleForPython()
    call append(0,"'''")
    call append(1,"# * Author        : xu wei")
    call append(2,"# * Email         : readonlyfile@hotmail.com")
    call append(3,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(4,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"# * Filename      : ".expand("%:t"))
    call append(6,"# * Description   : ")
    call append(7,"'''")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

"" add conment for shell
function AddTitleForShell()
    call append(0,"#!/bin/bash")
    call append(1,"# **********************************************************")
    call append(2,"# * Author        : xu wei")
    call append(3,"# * Email         : readonlyfile@hotmail.com")
    call append(4,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(6,"# * Filename      : ".expand("%:t"))
    call append(7,"# * Description   : ")
    call append(8,"# **********************************************************")
endfunction


