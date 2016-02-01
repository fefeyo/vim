"#####表示設定#####
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

"#####便利にする#####
"y$で現在のポインタから行末までヤンクする
nnoremap Y y$
"長い行も表示してくれる
set display=lastline
"補完メニューサイズ
set pumheight=10
"括弧を見やすくする
set showmatch
set matchtime=1



"ここからプラグイン管理
set nocompatible
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" ここに入れたいプラグインを記入
"シンタックスハイライトプラグイン
NeoBundle 'scrooloose/syntastic'
"ファイル構造を見る
NeoBundle 'Shougo/unite.vim'
" ファイルをtree表示してくれる
":NERDTreeで表示
NeoBundle 'scrooloose/nerdtree'
"ステータスライン強化プラグイン
NeoBundle 'itchyny/lightline.vim'
"Snippet
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
"Emmet
NeoBundle 'mattn/emmet-vim'
"自動括弧閉じ
NeoBundle 'Townk/vim-autoclose'


":NeoBundleInstall  で導入
":NeoBundleUpdate  でアップデート


call neobundle#end()
filetype plugin indent on



"Gitから追加するプラグイン

"Molokai
"https://github.com/tomasr/molokai

"インデント見える化
"https://github.com/nathanaelkane/vim-indent-guides