".vim以下のpermissionをsudo chown -R .vim

" ------------------------------------
" 表示設定
" ------------------------------------
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set tabstop=2 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set shiftwidth=2

" ------------------------------------
" 検索設定
" ------------------------------------
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

" ------------------------------------
" 便利にするやつ
" ------------------------------------
"y$で現在のポインタから行末までヤンクする
nnoremap Y y$
"長い行も表示してくれる
set display=lastline
"補完メニューサイズ
set pumheight=10
"括弧を見やすくする
set showmatch
set matchtime=1
"ステータスバー
set laststatus=2
set t_Co=256

" ------------------------------------
" NeoBundle設定
" ------------------------------------
"~/.vim/bundleに https://github.com/Shougo/neobundle.vim を入れる
set nocompatible
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" ------------------------------------
" ここからプラグイン導入
" ------------------------------------
"シンタックスハイライトプラグイン
NeoBundle 'scrooloose/syntastic'
"ファイル構造を見る
NeoBundle 'Shougo/unite.vim'
" ------------------------------------
" unite.vimの使い方
" ------------------------------------
":Unite file カレントディレクトリのファイルとディレクトリ一覧
":Unite file/new　ファイルの新規作成
":Unite file_mru　最近開いたファイルの一覧

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" ------------------------------------
" NERDTreeの使い方
" ------------------------------------
":NERDTreeで表示


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
"カラースキーム
NeoBundle 'tomasr/molokai'


":NeoBundleInstall  で導入
":NeoBundleUpdate  でアップデート

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" ------------------------------------
" カラースキーム
" ------------------------------------
syntax on "コードの色分け
colorscheme molokai
highlight Normal ctermbg=none

" ------------------------------------
" 入力補完プラグイン
" ------------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_dictionary_filetype_lists = {
\ 'default' : ''
\ }

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" ------------------------------------
" NERDTree設定
" ------------------------------------
"Ctrl + eでツリーを表示
nnoremap <silent><C-t> :NERDTreeToggle<CR>


"インデント見える化
"https://github.com/nathanaelkane/vim-indent-guides