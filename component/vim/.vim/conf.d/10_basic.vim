"######################################################################
"   basic.vim
"           基本設定
"           エディタ機能やVim自体の動作に関わる設定を行う
"######################################################################


" Ｃ言語スタイルのインデントを使用する
set cindent

" UTF-8をデフォルト文字コードセットに設定
set enc=utf-8

" ~/.vim/backupをバックアップ先ディレクトリに指定する
set backup
set backupdir=$HOME/.vim/backup
let &directory = &backupdir

" インクリメンタルサーチを有効にする
set incsearch

" 検索結果のハイライト表示を有効にする
set hlsearch

" 大文字と小文字を区別しない
set ignorecase

" ヤンクした際にクリップボードへ配置する
set clipboard=unnamed

" <TAB>を空白スペース文字に置き換える
set expandtab

" ファイル中の<TAB>を見た目4文字に展開する(既に存在する<TAB>の見た目の設定)
set tabstop=4

" インデントやシフトオペレータで挿入/削除されるインデントの幅を4文字分にする
set shiftwidth=4

" TABキーを押した際に挿入される空白の量を0文字分にする
set softtabstop=0

" スクロールした際に余白が５行分残るようにする
set scrolloff=5

" ビープ音を鳴らさない
set vb t_vb=

" ターミナル時でもマウスを使えるようにする
" set mouse=a
" set guioptions+=a
" set ttymouse=xterm2

" Undoファイルの出力先を設定
set undodir=$HOME/.vim/undo
