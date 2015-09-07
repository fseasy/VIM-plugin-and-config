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
" avoid ctrl + space 's bad effictive
imap <Nul> <Space>

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


