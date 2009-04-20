"-*- encoding:utf-8 -*-

let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplmapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
"alt+n or alt+p to navigate between entries in QuickFix


set cinoptions=:0,g0
set nobackup
set nowritebackup
set cindent
set t_Co=256
syntax on
set ai
set sw=8
set ruler
set softtabstop=8
set tabstop=8

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
autocmd FileType css setl omnifunc=csscomplete#CompleteCSS noci
autocmd FileType xml setl omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setl omnifunc=phpcomplete#CompletePHP
autocmd FileType c setl omnifunc=ccomplete#Complete

autocmd FileType python set ai et sw=4 ts=4


"autocmd FileType css set


"autocmd FileType cpp set omnifunc=ccomplete#Complete

autocmd FileType .awesomerc set syntax conf
autocmd FileType rdf set syntax=xml
autocmd FileType xul set syntax=xml

filetype on
filetype plugin on
set runtimepath+=~/.vim/textmateOnly
set runtimepath+=~/.vim/textmateOnly/after
set nocp
filetype plugin on

set tags+=~/.vim/stl.tags
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
map <F2> :make<CR>
autocmd BufRead,BufNewFIle *.py map <F2> :%w !python<CR>
autocmd BufRead,BufNewFIle *.rb map <F2> :%w !ruby<CR>
autocmd BufRead,BufNewFIle *.java map <F2> :!ant<CR>
map <F5> :NERDTreeToggle<CR>
autocmd FileType python map <F7> :s/^/#<CR>/fjlsjfldddd<CR>
autocmd FileType python map <F8> :s/^#//<CR>/fldjfla<CR>
autocmd FileType cpp map <F7> :s@^@//<CR>/fjlfjldkdkdk<CR>
autocmd FileType cpp map <F8> :s@^//@@<CR>/JFldjflkicjvkj<CR>
autocmd FileType java map <F7> :s@^@//<CR>/fjlfjldkdkdk<CR>
autocmd FileType java map <F8> :s@^//@@<CR>/JFldjflkicjvkj<CR>
autocmd FileType tex map <F7> :s@^@%<CR>/fjlfjldkdkdk<CR>
autocmd FileType tex map <F8> :s@^%@@<CR>/fjlfjldkdkdk<CR>
autocmd FileType tex colors h80
"map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
if has("gui_running")
	set gfn=Bitstream\ Vera\ Sans\ mono\ 11
endif
set autochdir
