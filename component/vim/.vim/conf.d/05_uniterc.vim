"######################################################################
"   uniterc.vim
"           unite関連の設定ファイル
"           @see https://github.com/Shougo/unite.vim
"######################################################################

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
