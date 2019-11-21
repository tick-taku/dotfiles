"######################################################################
" mapping.vim
"      Vim/gVim共通で使用するキーバインドを定義する
"      unite関連の設定は uniterc.vim で行なっている
"######################################################################

" .vimrcを編集する
command! Ev edit $MYVIMRC

" .vimrcを再読み込みする
command! Rv source $MYVIMRC

" バックアップディレクトリを開く
map qb :tabe $HOME/.vim/backup<ENTER> 

" 開いているファイルのディレクトリをカレントにする
map q\ :cd %:h<Enter><Enter>

" 現在行をコメント化 (/* */)
map qq 0i/* <ESC>$a */<ESC>

" 現在行をコメント化 (//)
map q/ 0i//<ESC>

" 開いているファイルのディレクトリをリスティング
map qd :e %:h<Enter>

" 新規タブを開く
map qt :tabnew<ENTER>

" 開いているファイルのパスをコピー
map qp :CopyPath<Enter>

" 次の要素
map <C-n> :cn<Enter>

" １つ前の要素
map <C-p> :cp<Enter>

" カーソル位置の単語を Gtags で検索
map <C-]> :GtagsCursor<Enter>

" カーソル位置の単語をAgで検索
map <C-h> :Ag <cword><Enter>

" Migemoでインクリメンタルサーチ
nmap <Space>/ <Plug>(vigemo-search)
