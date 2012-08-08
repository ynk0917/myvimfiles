"-*- encoding:utf-8 -*-

set nowritebackup
set t_Co=256
syntax on
set sw=4
set ruler
set softtabstop=4
set tabstop=4
set et
set modeline
set modelines=3

"set foldmethod=indent

set showmatch
set hls
set bk
set bdir=~/.backup
set bex=.bak
set fileencodings=utf-8,big5,gbk,sjis,euc-jp,euc-kr,utf-bom,iso8859-1
set enc=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set smarttab
"set smartindent
"set ai
"set cindent
colors desert256

setl omnifunc=nullcomplete#Complete
autocmd FileType * setl omnifunc=nullcomplete#Complete
"autocmd FileType python setl omnifunc=pythoncomplete#Complete
autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setl omnifunc=phpcomplete#CompletePHP
autocmd FileType c setl omnifunc=ccomplete#Complete

autocmd FileType python set ai et sw=4 ts=4
autocmd FileType css set noai noci nosmarttab nosmartindent


autocmd FileType .awesomerc set syntax conf
autocmd FileType rdf set syntax=xml
autocmd FileType xul set syntax=xml

filetype on
filetype indent on
filetype plugin on
set nocp

let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
nmap <F2> :make<CR>
nmap <F3> :make clean<CR>
nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :set spell <CR>
"nmap <Tab> :bNext<CR>
nmap <C-t> :tabe .<CR>
nmap <C-c> :tabclose <CR>
nmap <C-n> :cnext <CR>
nmap <C-p> :cprevious <CR>
nmap <Tab> gt
nmap <S-Tab> gT
autocmd BufRead,BufNewFIle *.py nmap <F2> :%w !python<CR>
autocmd BufRead,BufNewFIle *.rb nmap <F2> :%w !ruby<CR>
autocmd BufRead,BufNewFIle *.java nmap <F2> :!ant<CR>
autocmd FileType python map <F7> :s/^/#<CR>
autocmd FileType python map <F8> :s/^#//<CR>
autocmd FileType cpp map <F7> :s@^@//<CR>
autocmd FileType cpp map <F8> :s@^//@@<CR>
autocmd FileType cpp set tags+=~/.vim/stl.tags
autocmd FileType h set tags+=~/.vim/stl.tags
autocmd FileType java map <F7> :s@^@//<CR>
autocmd FileType java map <F8> :s@^//@@<CR>
autocmd FileType tex map <F7> :s@^@%<CR>
autocmd FileType tex map <F8> :s@^%@@<CR>
autocmd FileType tex colors h80
"map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
if has("gui_running")
	"set gfn=Bitstream\ Vera\ Sans\ mono\ 11
    if has("win32")
        set gfn=Monaco:h14
    else
        set gfn=Monaco\ 14
    endif
endif
if has("win32")
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	language messages zh_TW.utf-8
endif
set autochdir
set incsearch
let python_highlight_all = 1
nmap j gj
nmap k gk
nmap gf :tabedit <cfile><CR>
set ic
nmap .. 3Go

"autocmd BufWinLeave *.* silent mkview
"autocmd BufWinEnter *.* silent loadview
let g:EasyMotion_leader_key = ','
nnoremap <Leader>ff :FufFile! <CR>
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
set laststatus=2

function PyHeader()
    if getfsize(@%) <= 0
        execute "norm i#!/usr/bin/env python# -*- coding: utf-8 -*-"
    endif
endfunction


au BufRead,BufNewFile *.py call PyHeader()
