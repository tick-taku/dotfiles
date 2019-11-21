"######################################################################
" init.vim
"       NeoVim用の設定ファイル
"       分割された設定ファイル群(~/.config/nvim/conf.d/*.vim)で設定を行う
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

" ~/.config/nvim/conf.d/ 以下にある *.vim(分割された設定ファイル) を全て適用
set runtimepath+=~/.config/nvim/
runtime! conf.d/*.vim

