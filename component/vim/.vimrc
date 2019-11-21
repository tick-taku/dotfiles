"######################################################################
" .vimrc
"       Vim用の設定ファイル (gVim用の設定は .gvimrc で行う)
"       分割された設定ファイル群(~/.vim/conf.d/*.vim)で設定を行う
"           - basic.vim     : 基本設定
"           - view.vim      : 見た目の設定
"           - plugin.vim    : プラグイン管理(NeoBundleを使用)
"           - uniterc.vim   : unite関連の設定
"           - mapping.vim   : キーバインド、マッピング
"           - color.vim     : 色定義
"           - func.vim      : ユーザ定義関数
"           ! home.vim      : 自宅環境で使用する場合の設定
"           ! work.vim      : 職場環境で使用する場合の設定
"
"               - : デフォルトで含まれるファイル
"               ! : デフォルトで含まれないため必要なら作成する
"                   gitリポジトリにも含まれない(.gitignoreで除外)
"######################################################################

" ~/.vim/conf.d/ 以下にある *.vim(分割された設定ファイル) を全て適用
set runtimepath+=~/.vim/
runtime! conf.d/*.vim

" gfでジャンプする用
" ~/.vim/conf.d/00_plugin.vim
" ~/.vim/conf.d/05_uniterc.vim
" ~/.vim/conf.d/10_basic.vim
" ~/.vim/conf.d/20_color.vim
" ~/.vim/conf.d/30_view.vim
" ~/.vim/conf.d/40_func.vim
" ~/.vim/conf.d/50_mapping.vim

