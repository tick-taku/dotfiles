"######################################################################
"   plugin.vim
"           プラグイン設定ファイル
"           NeoBundleを使用してプラグインを管理する
"           @see https://github.com/Shougo/neobundle.vim
"######################################################################

" NeoBundleを使用するためのスニペット
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif

call neobundle#begin(expand('~/.vim/bundle/'))
" インストールしたいプラグインのリストを書く
"   - GitHUBの場合は {ユーザ名}/{リポジトリ名}
"   - その他のgitリポジトリの場合はフルパスで
"   - SVN, Marcural も使える
"
" ここから #############################################################


" 一般プラグイン
NeoBundle 'banyan/recognize_charcode.vim'       " 文字コード判定
NeoBundle 'vim-scripts/gtags.vim'               " GNU Global
NeoBundle 'Align'                               " テキスト整形
NeoBundle 'taglist.vim'                         " ソースコードブラウザ
NeoBundle 'rking/ag.vim'                        " SilverSearcher
NeoBundle 'sudo.vim'                            " sudo

" Unite関連
NeoBundle 'Shougo/unite.vim'                    " ユーザインタフェース統合
NeoBundle 'Shougo/neomru.vim'                   " 最近使用したファイルの一覧管理
NeoBundle 'ujihisa/unite-colorscheme'           " カラースキーム変更
NeoBundle 'Shougo/vimfiler'                     " ファイラ
" vimfiler {{
let g:vimfiler_as_default_explorer = 1
" }}


" カラースキーム
NeoBundle 'altercation/vim-colors-solarized'    " Solarized
NeoBundle 'tomasr/molokai'                      " molokai
NeoBundle 'w0ng/vim-hybrid'                     " hybrid


" Ruby, Rails関連
NeoBundle 'tpope/vim-rails'                     " Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-endwise'                   " Ruby向けにendを自動挿入
NeoBundle 'tomtom/tcomment_vim'                 " コメントON/OFFを手軽に実行
NeoBundle 'nathanaelkane/vim-indent-guides'     " インデントに色を付けて見やすくする
NeoBundle 'vim-scripts/AnsiEsc.vim'             " ANSIカラー情報を色づけ


" vimproc
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }


" neocomplete {{
if has('lua')
    NeoBundleLazy 'Shougo/neocomplete.vim', {
        \ 'depends' : 'Shougo/vimproc',
        \ 'autoload' : { 'insert' : 1,}
        \ }

let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
endif
"}}


" vimshell {{
NeoBundleLazy 'Shougo/vimshell', {
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : {
  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
  \                   'VimShellExecute', 'VimShellInteractive',
  \                   'VimShellTerminal', 'VimShellPop'],
  \   'mappings' : ['<Plug>(vimshell_switch)']
  \ }}

nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>
" }}


" vim-indent-guides {{
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
"}}


" unite {{
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

nnoremap [unite]    <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]y  :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]f  :<C-u>Unite file_rec<CR>
nnoremap <silent> [unite]u  :<C-u>Unite file_mru buffer<CR>

" grep検索
nnoremap <silent> [unite]gr  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

 " grep検索結果の再呼出
nnoremap <silent> [unite]r  :<C-u>UniteResume search-buffer<CR>

 " unite grep に ag(The Silver Searcher) を使う
 if executable('ag')
     let g:unite_source_grep_command = 'ag'
     let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
     let g:unite_source_grep_recursive_opt = ''
 endif
" }}


" vim-easymotion {{
NeoBundle 'Lokaltog/vim-easymotion'
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)
nmap ' <Plug>(easymotion-s2)

"let g:EasyMotion_leader_key = '<Space><Space>'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_use_migemo = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
" }}

" Incremental migemo search
NeoBundle 'osyo-manga/vim-vigemo'

" ステータスライン表示
NeoBundle 'itchyny/lightline.vim'
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

" ############################################################# ここまで

" NeoBundleを使用するためのスニペット
filetype plugin indent on
"
"
call neobundle#end()
