" setting

 set number
 set whichwrap=b,s,h,l,<,>,[,],~ " $B%+!<%=%k$N:81&0\F0$G9TKv$+$i<!$N9T$N9TF,$X$N0\F0$,2DG=$K$J$k(B
 set cursorline " $B%+!<%=%k%i%$%s$r%O%$%i%$%H(B
 set encoding=utf-8
 scriptencoding utf-8
 set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
 set fileformats=unix,dos,mac
 set ambiwidth=double
 set nobackup
 set noswapfile
 set autoread
 set hidden
 set showcmd

"For visual
 set cursorline
" set cursorcolumn
 set virtualedit=onemore
" set smartindent
 set visualbell
 set showmatch
 set laststatus=2
 set wildmode=list:longest

"Tab
 set expandtab " $B%?%VF~NO$rJ#?t$N6uGrF~NO$KCV$-49$($k(B
 set tabstop=2 " $B2hLL>e$G%?%VJ8;z$,@j$a$kI}(B
 set shiftwidth=2 " smartindent$B$GA}8:$9$kI}(B
 set softtabstop=2 " $BO"B3$7$?6uGr$KBP$7$F%?%V%-!<$d%P%C%/%9%Z!<%9%-!<$G%+!<%=%k$,F0$/I}(B
 set autoindent "$B<+F0$G%$%s%G%s%H(B

"$B?'$r$D$1$k(B
 syntax on

 set wildmenu " $B%3%^%s%I%b!<%I$NJd40(B
 set history=5000 " $BJ]B8$9$k%3%^%s%IMzNr$N?t(B

"$BJ8;zNs8!:w(B
set incsearch " $B%$%s%/%j%a%s%?%k%5!<%A(B. $B#1J8;zF~NOKh$K8!:w$r9T$&(B
set ignorecase " $B8!:w%Q%?!<%s$KBgJ8;z>.J8;z$r6hJL$7$J$$(B
set smartcase " $B8!:w%Q%?!<%s$KBgJ8;z$r4^$s$G$$$?$iBgJ8;z>.J8;z$r6hJL$9$k(B
set hlsearch " $B8!:w7k2L$r%O%$%i%$%H(B

" $B9T$,@^$jJV$7I=<($5$l$F$$$?>l9g!"9TC10L$G$O$J$/I=<(9TC10L$G%+!<%=%k$r0\F0$9$k(B
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

"$B%Z!<%9%H;~$N<+F0%$%s%G%s%H$NL58z2=(B
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"$B%^%&%9$NM-8z2=(B
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

" For Python
set clipboard=unnamed
set showmatch " $B3g8L$NBP1~4X78$r0l=VI=<($9$k(B


"NeoBundle(vim$B%W%i%0%$%s$N4IM}(B)
if has('vim_starting')
    " $B=i2s5/F0;~$N$_(Bruntimepath$B$K(BNeoBundle$B$N%Q%9$r;XDj$9$k(B
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundle$B$,L$%$%s%9%H!<%k$G$"$l$P(Bgit clone$B$9$k(B
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" $B%$%s%9%H!<%k$9$k(BVim$B%W%i%0%$%s$r0J2<$K5-=R(B
" NeoBundle$B<+?H$r4IM}(B
NeoBundleFetch 'Shougo/neobundle.vim'
"----------------------------------------------------------
" $B$3$3$KDI2C$7$?$$(BVim$B%W%i%0%$%s$r5-=R$9$k(B
" $B%+%i!<%9%-!<%`(Bmolokai
NeoBundle 'tomasr/molokai'
"----------------------------------------------------------
" molokai$B$N@_Dj(B
"----------------------------------------------------------
"if neobundle#is_installed('molokai') " molokai$B$,%$%s%9%H!<%k$5$l$F$$$l$P(B
"    colorscheme molokai " $B%+%i!<%9%-!<%`$K(Bmolokai$B$r@_Dj$9$k(B
"endif

set t_Co=256 " iTerm2$B$J$I4{$K(B256$B?'4D6-$J$iL5$/$F$bNI$$(B
syntax enable " $B9=J8$K?'$rIU$1$k(B
" $B%9%F!<%?%9%i%$%s$NI=<(FbMF6/2=(B
NeoBundle 'itchyny/lightline.vim'
"----------------------------------------------------------
" $B%9%F!<%?%9%i%$%s$N@_Dj(B
"----------------------------------------------------------
set laststatus=2 " $B%9%F!<%?%9%i%$%s$r>o$KI=<((B
set showmode " $B8=:_$N%b!<%I$rI=<((B
set showcmd " $BBG$C$?%3%^%s%I$r%9%F!<%?%9%i%$%s$N2<$KI=<((B
set ruler " $B%9%F!<%?%9%i%$%s$N1&B&$K%+!<%=%k$N8=:_0LCV$rI=<($9$k(B

" $BKvHx$NA43Q$HH>3Q$N6uGrJ8;z$r@V$/%O%$%i%$%H(B
NeoBundle 'bronson/vim-trailing-whitespace'
" $B%$%s%G%s%H$N2D;k2=(B
NeoBundle 'Yggdroot/indentLine'

"----------------------------------------------------------
" $B%$%s%9%H!<%k(B
"----------------------------------------------------------
if has('lua') " lua$B5!G=$,M-8z$K$J$C$F$$$k>l9g(B
    " $B%3!<%I$N<+F0Jd40(B
    NeoBundle 'Shougo/neocomplete.vim'
    " $B%9%K%Z%C%H$NJd405!G=(B
    NeoBundle "Shougo/neosnippet"
    " $B%9%K%Z%C%H=8(B
    NeoBundle 'Shougo/neosnippet-snippets'
endif

"----------------------------------------------------------
" neocomplete$B!&(Bneosnippet$B$N@_Dj(B
"----------------------------------------------------------
if neobundle#is_installed('neocomplete.vim')
    " Vim$B5/F0;~$K(Bneocomplete$B$rM-8z$K$9$k(B
    let g:neocomplete#enable_at_startup = 1
    " smartcase$BM-8z2=(B. $BBgJ8;z$,F~NO$5$l$k$^$GBgJ8;z>.J8;z$N6hJL$rL5;k$9$k(B
    let g:neocomplete#enable_smart_case = 1
    " 3$BJ8;z0J>e$NC18l$KBP$7$FJd40$rM-8z$K$9$k(B
    let g:neocomplete#min_keyword_length = 3
    " $B6h@Z$jJ8;z$^$GJd40$9$k(B
    let g:neocomplete#enable_auto_delimiter = 1
    " 1$BJ8;zL\$NF~NO$+$iJd40$N%]%C%W%"%C%W$rI=<((B
    let g:neocomplete#auto_completion_start_length = 1
    " $B%P%C%/%9%Z!<%9$GJd40$N%]%C%W%"%C%W$rJD$8$k(B
    inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

    " $B%(%s%?!<%-!<$GJd408uJd$N3NDj(B. $B%9%K%Z%C%H$NE83+$b%(%s%?!<%-!<$G3NDj(B
    imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
    " $B%?%V%-!<$GJd408uJd$NA*Br(B. $B%9%K%Z%C%HFb$N%8%c%s%W$b%?%V%-!<$G%8%c%s%W(B
    imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif


" $B9=J8%(%i!<%A%'%C%/(B
NeoBundle 'scrooloose/syntastic'

"----------------------------------------------------------
" Syntastic$B$N@_Dj(B
"----------------------------------------------------------
" $B9=J8%(%i!<9T$K!V(B>>$B!W$rI=<((B
let g:syntastic_enable_signs = 1
" $BB>$N(BVim$B%W%i%0%$%s$H6%9g$9$k$N$rKI$0(B
let g:syntastic_always_populate_loc_list = 1
" $B9=J8%(%i!<%j%9%H$rHsI=<((B
let g:syntastic_auto_loc_list = 0
" $B%U%!%$%k$r3+$$$?;~$K9=J8%(%i!<%A%'%C%/$r<B9T$9$k(B
let g:syntastic_check_on_open = 1
" $B!V(B:wq$B!W$G=*N;$9$k;~$b9=J8%(%i!<%A%'%C%/$9$k(B
let g:syntastic_check_on_wq = 1

" Pythonscript$BMQ(B. $B9=J8%(%i!<%A%'%C%/$K(Bsita$B$r;HMQ(B
let g:syntastic_python_checkers = ['pyflakes', 'pep8']


"----------------------------------------------------------
call neobundle#end()

" $B%U%!%$%k%?%$%WJL$N(BVim$B%W%i%0%$%s(B/$B%$%s%G%s%H$rM-8z$K$9$k(B
filetype plugin indent on

" $BL$%$%s%9%H!<%k$N(BVim$B%W%i%0%$%s$,$"$k>l9g!"%$%s%9%H!<%k$9$k$+$I$&$+$r?R$M$F$/$l$k$h$&$K$9$k@_Dj(B
NeoBundleCheck
