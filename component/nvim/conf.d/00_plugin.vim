"######################################################################
"   plugin.vim
"           プラグイン設定ファイル
"           dein.vimを使用してプラグインを管理する
"           @see https://github.com/Shougo/dein.vim
"######################################################################


"Python3 support for deoplete.nvim
"let g:python3_host_prog = expand('$HOME') . '/.pyenv/shims/python'


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/Users/kozaki/.config/nvim/dein//repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/Users/kozaki/.config/nvim/dein/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

"" ここから使用したいプラグインを記述 #######################################

" vimproc
call dein#add('Shougo/vimproc.vim', {
            \ 'build': {
            \     'mac': 'make -f make_mac.mak',
            \     'linux': 'make',
            \     'unix': 'gmake',
            \    },
            \ })

" 一般プラグイン
call dein#add('banyan/recognize_charcode.vim')      " 文字コード判定
call dein#add('vim-scripts/gtags.vim')              " GNU Global
call dein#add('Align')                              " テキスト整形
call dein#add('taglist.vim')                        " ソースコードブラウザ
call dein#add('rking/ag.vim')                       " SilverSearcher
call dein#add('sudo.vim')                           " sudo

" Unite関連
call dein#add('Shougo/unite.vim')                   " ユーザインタフェース統合
call dein#add('Shougo/neomru.vim')                  " 最近使用したファイルの一覧管理
call dein#add('ujihisa/unite-colorscheme')          " カラースキーム変更
call dein#add('Shougo/vimfiler')                    " ファイラ
" vimfiler {{
let g:vimfiler_as_default_explorer = 1
" }}


" カラースキーム
call dein#add('altercation/vim-colors-solarized')   " Solarized
call dein#add('tomasr/molokai')                     " molokai
call dein#add('w0ng/vim-hybrid')                    " hybrid


" Ruby, Rails関連
call dein#add('tpope/vim-rails')                    " Rails向けのコマンドを提供する
call dein#add('tpope/vim-endwise')                  " Ruby向けにendを自動挿入
call dein#add('tomtom/tcomment_vim')                " コメントON/OFFを手軽に実行
call dein#add('nathanaelkane/vim-indent-guides')    " インデントに色を付けて見やすくする
call dein#add('vim-scripts/AnsiEsc.vim')            " ANSIカラー情報を色づけ


" その他
call dein#add('Lokaltog/vim-easymotion')            " EasyMotion
call dein#add('osyo-manga/vim-vigemo')              " vim-vigemo
call dein#add('Shougo/deoplete.nvim')               " deoplete


" ステータスライン表示
call dein#add('itchyny/lightline.vim')              " lightline


"" 使用したいプラグインの記述はここまで #####################################


" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------




"" ###################################################################
"" ここから各プラグインの設定 ########################################
"" ###################################################################

" vim-easymotion {{
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
nmap ' <Plug>(easymotion-s2)

let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_use_migemo = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
" }}


" lightline {{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left':  [ ['mode', 'paste'], ['readonly', 'filename', 'modified'] ],
      \   'right': [ ['lineinfo'], ['percent'], ['filetype'], ['fileformat', 'fileencoding'] ]
      \ },
      \ 'component_function': {
      \   'mode': 'MyMode',
      \ }
      \ }
function! MyMode()
  return  &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction
" }}


" deoplete {{
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" }}

