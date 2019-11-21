"######################################################################
"   color.vim
"           カラースキーム、色定義に関する設定を行う
"######################################################################


" ターミナル環境用に256色を使えるようにする
set t_Co=256
if &term == 'screen-256color'
    " 背景の塗り潰しは行わない
    set t_ut=
endif

" シンタックスハイライトを有効にする
syntax on

" 起動時に適用するカラースキーム
colorscheme molokai

" 検索結果の表示色を変更
hi Search ctermbg=17
set cursorline
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=NONE
