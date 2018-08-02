filetype plugin indent on
set t_Co=256
syntax on
"画面の端で折り返さなくする
set nowrap
"ハイライトしてくれる
set hlsearch
"大文字小文字の区別を無視→検索の効率化
set ignorecase
"スマートケースを入れることで大文字検索は大文字小文字を区別しない
set smartcase
"改行したときに半角スペース8文字を自動挿入
set autoindent
"vim右下にカーソルのある場所（n行m列)を表示
set ruler
"行番号の表示
set number
"編集行の行番号をハイライト
set cursorline
"タブの表示
set list
"ファイル名の補完
set wildmenu
set history=5000
set showcmd

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab


set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
"------------------------------------------------------------
"マウス操作で範囲選択コピペができるように
"if has('mouse')
"   set mouse=a
"    if has('mouse_sgr')
"       set ttymouse=sgr
"   elseif v:version > 703 || v:version is 703 && has('patch632')
"        set ttymouse=sgr
"    else
"        set ttymouse=xterm2
"    endif
"endif
"---------------------------------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif
    if has('vim_starting')
        if &compatible
            set nocompatible               " Be iMproved
        endif
    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" ここにインストールするプラグインを書き込む
"カラースキームmolokai
NeoBundle 'tomasr/molokai'
"インデントの可視化
NeoBundle 'Yggdroot/indentLine'

NeoBundle 'challenger-deep-theme/vim'
"---------------------------------------------------
"関数名等の補完機能
if has('lua') " lua機能が有効になっている場合・・・・・・①
" コードの自動補完
NeoBundle 'Shougo/neocomplete.vim'
" スニペットの補完機能
NeoBundle "Shougo/neosnippet"
" スニペット集
NeoBundle 'Shougo/neosnippet-snippets'
endif
"----------------------------------------------------------
" neocomplete・neosnippetの設定
"----------------------------------------------------------
if neobundle#is_installed('neocomplete.vim')
" Vim起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化.
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
"3文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 3
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
"1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1   
"バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"
"エンターキーで補完候補の確定.
"スニペットの展開もエンターキーで確定・・・・・・②
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>": "<CR>"
"タブキーで補完候補の選択.
"スニペット内のジャンプもタブキーでジャンプ・・・・・・③
imap <expr><TAB> pumvisible() ? "<C-n>":neosnippet#jumpable()?"<Plug>(neosnippet_expand_or_jump)":"<TAB>"
endif
"---------------------------------------------------
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in.gvimrc!
call neobundle#end()

" Required:
filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to"                                  install them.
NeoBundleCheck

"-------------------------------------------------
"カラースキームmolokaiの設定

if neobundle#is_installed('molokai')
    colorscheme molokai 
endif

set t_Co=256 "iTerm2などすでに256色環境ならなくてもよい
syntax enable "構文に色をつける
"-------------------------------------------------
