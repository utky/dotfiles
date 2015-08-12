" vim:set foldmethod=marker:
" Viに互換させたらアカンていう設定
set nocompatible

" Vundle Condiguration"{{{
"---------------------------------------------------------------------------
" ここからはVundle用の設定開始
"---------------------------------------------------------------------------

filetype plugin indent off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" originalrepos on github
Plugin 'gmarik/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/ctrlp-filer'
Plugin 'mattn/ctrlp-register'

" Git Plugin
Plugin 'tpope/vim-fugitive'

" Scala plugin
Plugin 'derekwyatt/vim-scala'

" Text editting plugin
Plugin 'glidenote/memolist.vim'

" Haskell plugin
Plugin 'dag/vim2hs'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'scrooloose/syntastic'

" UI Plugins
Plugin 'altercation/vim-colors-solarized'
"Plugin 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
Plugin 'bling/vim-airline'

Plugin 'vim-scripts/fcitx.vim'

call vundle#end()            " required
"
" Windows用でも.vimディレクトリをベースにしちゃう
if has('win32')
  set runtimepath^=$HOME/.vim
  set runtimepath+=$HOME/.vim/after
endif

filetype plugin on
filetype indent on
syntax on
"}}}

" Path Configuration {{{

let $PATH = expand('~/bin').':'.$PATH

" }}}

"---------------------------------------------------------------------------
" ヘルプのデフォルト言語
" （kanaさんのポリシーに従いデフォルトは英語）
"---------------------------------------------------------------------------
set helplang=en,ja

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"---------------------------------------------------------------------------
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" インクリメンタルサーチを行うかどうか
" noincsearch : OFF
" incsearch : ON
set noincsearch

" Edit Configuration"{{{
"---------------------------------------------------------------------------
" 編集に関する設定:
"---------------------------------------------------------------------------
" 自動行折り返しを行う桁数 
set textwidth=0
" (自動)インデントの各段階に使われる空白の数
set shiftwidth=2
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"}}}

" View Configuration"{{{
"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"---------------------------------------------------------------------------
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
set listchars=eol:<
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)
" カーソル行のハイライト（これgvimだけ？）
set nocursorline

"}}}

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"---------------------------------------------------------------------------
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
set backupdir=$HOME
set undodir=$HOME/.vimundo
" スワップファイルの設定
set directory=$HOME
" netrwにてファイラペインが左、エディタバッファが右で開く
let g:netrw_altv=1
let g:netrw_alto=1
let g:netrw_winsize=60



" Key Mapping Configuration"{{{
"---------------------------------------------------------------------------
" キーマッピングの設定
"---------------------------------------------------------------------------
let mapleader = 's'

" 挿入/ヴィジュアルモードの時にノーマルモードへと戻る
noremap! <silent> <S-CR> <ESC>
noremap! <silent> <C-k> <ESC>
vnoremap <silent> <S-CR> <ESC>
vnoremap <silent> <C-k> <ESC>
nnoremap <silent> <S-CR> o<ESC>

" 一般的なIDEライクな補完キー
inoremap <C-Space> <C-n>
inoremap <C-S-Space> <C-p>
inoremap <C-@> <ESC>

" タブの切り替えをChromeと合わせておく
nnoremap <silent> <C-Tab> :<C-u>tabn<CR>
nnoremap <silent> <C-S-Tab> :<C-u>tabp<CR>

" テキストの選択
" noremap H 0
" noremap L $
" ノーマルモードでの仮想行カーソル移動
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" スクリーン内での相対ジャンプ
" noremap <C-j> L 
" noremap <C-k> H 
" noremap <C-m> M 
" Anti-CTRL key
" noremap <Space>j <C-f>
" noremap <Space>k <C-b>
" nnoremap W <C-w>

" 括弧の自動補完
" inoremap { {}<Left>
" inoremap [ []<Left>
" inoremap " ""<Left>
" inoremap ' ''<Left>
" スペースキーショートカット
" nnoremap <silent> <Leader>m :<C-u>marks<CR>
" nnoremap <silent> <Leader>t :<C-u>tags<CR>

" VIMRCの編集用ヘルプキー
nnoremap <silent> <Leader>ev :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif<CR>
nnoremap <silent> <Leader>eg :<C-u>tabedit $MYGVIMRC<CR>
nnoremap <silent> <Leader>sg :<C-u>source $MYGVIMRC<CR>
" iabbrev ； ……
" iabbrev ： ——
" ここはunite.vim用に予約
" nnoremap <silent> <Leader>u :<C-u>Unite
"}}}

"---------------------------------------------------------------------------
" IME Controll Settings
"---------------------------------------------------------------------------
"if has('multi_byte_ime')
" highlight CursorIM guifg=NONE guibg=Purple
"fi

" ime setting
"if has('multi_byte_ime') || has('xim') || has('gui_macvim')
"  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
"endif

"---------------------------------------------------------------------------
" 関数
"---------------------------------------------------------------------------
function! s:Today()
  return strftime("%Y-%m-%d")
endfunction

function! s:Tstamp()
  return strftime("%Y-%m-%d %T")
endfunction

"---------------------------------------------------------------------------
" コマンド
"---------------------------------------------------------------------------


"---------------------------------------------------------------------------
" 自動コマンド
"---------------------------------------------------------------------------
" vimgrep実行と同時にQuickfixウィンドウを開く
augroup QuickfixListener
    autocmd!
    autocmd QuickfixCmdPost vimgrep cw
augroup END

augroup FileTypeSettings
    autocmd!
    autocmd FileType groovy 
          \setl tabstop=4
          \|setl shiftwidth=4
          \|setl expandtab
    autocmd FileType java 
          \setl tabstop=4
          \|setl shiftwidth=4
          \|setl expandtab
    autocmd FileType html
          \setl tabstop=4
          \|setl shiftwidth=4
          \|setl noexpandtab
    autocmd FileType javascript
          \setl tabstop=4
          \|setl shiftwidth=4
          \|setl noexpandtab
    autocmd FileType scheme
          \setl tabstop=2
          \|setl shiftwidth=2
          \|setl expandtab
augroup END

"---------------------------------------------------------------------------
" Input Method関連設定
"---------------------------------------------------------------------------
" 日本語入力固定モード
if has('mac')
  set noimdisableactivate
endif

" IMEモードの引き継ぎ
let g:IMState = 2
augroup InsertHookIME
    autocmd!
    autocmd InsertEnter * let &iminsert = g:IMState
    autocmd InsertLeave * let g:IMState = &iminsert|set iminsert=0 imsearch=0 
augroup END

" Markdownシンタックス
" augroup MarkdownSyntaxHook
"     autocmd!
"     au Syntax mkd source $VIMRUNTIME/syntax/markdown.vim
" augroup END

" 挿入モードでステータスラインの色を変更する
"let g:hi_insert = 'highlight StatusLine guifg=darkmagenta guibg=darkgray gui=bold ctermfg=blue ctermbg=darkgray cterm=none'
"let g:hi_normal = 'highlight StatusLine guifg=darkblue guibg=darkgray gui=none ctermfg=darkblue ctermbg=darkyellow cterm=none'

"if has('syntax')
"    augroup InsertHook
"    autocmd!
"	autocmd InsertEnter * silent exec g:hi_insert
"	autocmd InsertLeave * silent exec g:hi_normal
"    augroup END
"endif


"---------------------------------------------------------------------------
" Workspace Settings
"---------------------------------------------------------------------------
let g:ilyaletre_workspace_dir=expand('~/workspace')

"===========================================================================
" Plugin Configurations
"===========================================================================

" CtrlP"{{{
"---------------------------------------------------------------------------
" CtrlP
"---------------------------------------------------------------------------
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<c-h>'],
  \ 'PrtCurLeft()':         ['<c-b>'],
  \ 'PrtCurRight()':        ['<c-f>'],
  \ }
nnoremap <silent> <Leader>f :<C-u>CtrlP<CR>

"}}}

" Memolist"{{{
"---------------------------------------------------------------------------
" Memolist
"---------------------------------------------------------------------------
let g:memolist_path = expand('$MEMOLIST/posts')
let g:memolist_memo_suffix = "mkd"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 0
let g:memolist_qfixgrep = 0
let g:memolist_vimfiler = 1
let g:memolist_template_dir_path = expand('$MEMOLIST/templates')
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
"}}}

"---------------------------------------------------------------------------
" Quickrun
"---------------------------------------------------------------------------
noremap <silent> <Leader>r :<C-u>QuickRun<CR>

" airline {{{
"---------------------------------------------------------------------------
" airline
"---------------------------------------------------------------------------
let g:airline_theme='powerlineish'
" let g:airline_left_sep=''
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep=''
" let g:airline_right_sep = '◀'
" let g:airline_right_alt_sep = ''
let g:airline_branch_prefix = ' '
" let g:airline_readonly_symbol = ''
" let g:airline_linecolumn_prefix = ' '
" let g:airline_detect_whitespace=0 "disabled
let g:airline_powerline_fonts=1
let g:airline_enable_branch = 1

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"}}}

