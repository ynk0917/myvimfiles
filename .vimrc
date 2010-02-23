"-*- encoding:utf-8 -*-

let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplmapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
"alt+n or alt+p to navigate between entries in QuickFix


set cinoptions=:0,g0
set nowritebackup
set cindent
set ai
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
set smartindent
colors ir_black

setl omnifunc=nullcomplete#Complete
autocmd FileType * setl omnifunc=nullcomplete#Complete
"autocmd FileType python setl omnifunc=pythoncomplete#Complete
autocmd FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setl omnifunc=htmlcomplete#CompleteTags noci
"autocmd FileType css setl omnifunc=csscomplete#CompleteCSS noci
autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setl omnifunc=phpcomplete#CompletePHP
autocmd FileType c setl omnifunc=ccomplete#Complete

autocmd FileType python set ai et sw=4 ts=4
autocmd FileType css set noai noci nosmarttab nosmartindent


"autocmd FileType css set


"autocmd FileType cpp set omnifunc=ccomplete#Complete

autocmd FileType .awesomerc set syntax conf
autocmd FileType rdf set syntax=xml
autocmd FileType xul set syntax=xml

filetype on
filetype plugin on
filetype indent on
set runtimepath+=~/.vim/textmateOnly
set runtimepath+=~/.vim/textmateOnly/after
set nocp

set tags+=~/.vim/stl.tags
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
nmap <F2> :make<CR>
nmap <F3> :make clean<CR>
"nmap <Tab> :bNext<CR>
nmap <C-t> :tabe .<CR>
nmap <C-w> :tabclose <CR>
nmap <Tab> gt
nmap <S-Tab> gT
nmap <F6> :set spell <CR>
autocmd BufRead,BufNewFIle *.py nmap <F2> :%w !python<CR>
autocmd BufRead,BufNewFIle *.rb nmap <F2> :%w !ruby<CR>
autocmd BufRead,BufNewFIle *.java nmap <F2> :!ant<CR>
nmap <F5> :NERDTreeToggle<CR>
autocmd FileType python map <F7> :s/^/#<CR>
autocmd FileType python map <F8> :s/^#//<CR>
autocmd FileType cpp map <F7> :s@^@//<CR>
autocmd FileType cpp map <F8> :s@^//@@<CR>
autocmd FileType java map <F7> :s@^@//<CR>
autocmd FileType java map <F8> :s@^//@@<CR>
autocmd FileType tex map <F7> :s@^@%<CR>
autocmd FileType tex map <F8> :s@^%@@<CR>
autocmd FileType tex colors h80
"map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
if has("gui_running")
	"set gfn=Bitstream\ Vera\ Sans\ mono\ 11
	set gfn=Monaco\ 14
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
nmap gf :tabedit <cfile><CR><F4>

"autocmd BufWinLeave *.* silent mkview
"autocmd BufWinEnter *.* silent loadview
