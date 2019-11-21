"######################################################################
"   view.vim
"           見た目の設定
"           Vimの外観や見た目の表示方法に関する設定を行う
"           カラースキームや色定義に関する設定は別途 color.vim で行う
"######################################################################

" 使用するフォントと大きさ
set guifont=Ricty\ Discord\ 10
set guifontwide=Ricty\ Discord\ 10

" 行番号を表示する
set number

" 全角スペースを分かりやすく表示する
highlight ZenkakuSpace cterm=underline ctermfg=lightmagenta guibg=lightmagenta
match ZenkakuSpace /　/

" TAB文字/行末の半角スペースを表示する
set lcs=tab:>.,trail:_,extends:\
set list
highlight SpecialKey cterm=NONE ctermfg=cyan guifg=cyan

" ステータスラインの表示変更
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}:%{&fenc!=''?&fenc:&enc}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

