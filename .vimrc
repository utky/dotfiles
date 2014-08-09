" vim:set foldmethod=marker:
" Viに互換させたらアカンていう設定
set nocompatible

" NeoBundle Condiguration"{{{
"---------------------------------------------------------------------------
" ここからはneobundle用の設定開始
"---------------------------------------------------------------------------

filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/unite-build'
NeoBundle 'utky/unite-build-gradle.vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'thinca/vim-quickrun'

NeoBundle 'tpope/vim-fugitive'

NeoBundle 'glidenote/memolist.vim'

" TweetVim
NeoBundle 'basyura/bitly.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'yomi322/neco-tweetvim'
NeoBundle 'yomi322/unite-tweetvim'
NeoBundleLazy 'basyura/TweetVim', { 'depends' :
      \ ['basyura/twibill.vim', 'tyru/open-browser.vim'],
      \ 'autoload' : { 'commands' : 'TweetVimHomeTimeline' }}
      " \ ['basyura/twibill.vim', 'tyru/open-browser.vim', 'yomi322/neco-tweetvim'] }

" metarw-tumblr
NeoBundle 'kana/vim-metarw'
NeoBundle 'hara/vim-metarw-tumblr'

" haskell
NeoBundleLazy "dag/vim2hs",                  {"autoload" : { "filetypes" : ["haskell"] }}
NeoBundleLazy "eagletmt/ghcmod-vim",         {"autoload" : { "filetypes" : ["haskell"] }}
NeoBundleLazy "eagletmt/unite-haddock",      {"autoload" : { "filetypes" : ["haskell"] }}
NeoBundleLazy "ujihisa/neco-ghc",            {"autoload" : { "filetypes" : ["haskell"] }}
NeoBundleLazy "ujihisa/unite-haskellimport", {"autoload" : { "filetypes" : ["haskell"] }}

" UI Plugins
NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'bling/vim-airline'

" NeoBundleLazy 'c9s/perlomni.vim'
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
let mapleader = ' '

" 挿入/ヴィジュアルモードの時にノーマルモードへと戻る
noremap! <silent> <S-CR> <ESC>
noremap! <silent> <C-k> <ESC>
vnoremap <silent> <S-CR> <ESC>
vnoremap <silent> <C-k> <ESC>
nnoremap <silent> <S-CR> o<ESC>

" 一般的なIDEライクな補完キー
inoremap <C-Space> <C-n>
inoremap <C-S-Space> <C-p>
inoremap <silent> <expr> <C-d> Today()
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
" コマンド
"---------------------------------------------------------------------------
command! -nargs=* Build Unite build <args>


"---------------------------------------------------------------------------
" 自動コマンド
"---------------------------------------------------------------------------
" vimgrep実行と同時にQuickfixウィンドウを開く
augroup QuickfixListener
    autocmd!
    " autocmd QuickfixCmdPost vimgrep cw
augroup END

augroup FileTypeSettings
    autocmd!
    autocmd FileType groovy setl tabstop=4|setl shiftwidth=4|setl expandtab
    autocmd FileType java setl tabstop=4|setl shiftwidth=4|setl expandtab
    autocmd FileType html setl tabstop=4|setl shiftwidth=4|setl noexpandtab
    autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl noexpandtab
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
" 関数
"---------------------------------------------------------------------------
function! Today()
  return strftime("%Y-%m-%d %T")
endfunction

function! Tstamp()
  return strftime("%Y-%m-%d %T")
endfunction

"---------------------------------------------------------------------------
" Workspace Settings
"---------------------------------------------------------------------------
let g:ilyaletre_workspace_dir=expand('~/workspace')

"===========================================================================
" Plugin Configurations
"===========================================================================

" Unite Vim"{{{
"---------------------------------------------------------------------------
" Unite Basic
"---------------------------------------------------------------------------
" Starting with insert mode when open unite buffer.
let g:unite_enable_start_insert=1

" Prefer vertical splitting
let g:unite_enable_split_vertically=0

" Set unite work directory
let g:unite_data_directory=expand('~/.unite')

" 
let g:unite_kind_openable_lcd_command="lcd"


nnoremap <silent> <Leader>r :<C-u>Unite register -buffer-name=registers<CR>
nnoremap <silent> <Leader>b :<C-u>Unite buffer -buffer-name=buffers<CR>
nnoremap <silent> <Leader>o :<C-u>Unite outline -buffer-name=outline<CR>
nnoremap <silent> <Leader>ff :<C-u>Unite file_rec/async:! -buffer-name=files<CR>
nnoremap <silent> <Leader>fd :<C-u>Unite directory -buffer-name=explorer<CR>
nnoremap <silent> <Leader>tt :<C-u>Unite tweetvim -buffer-name=tweetvim<CR>
nnoremap <silent> <Leader>ub :<C-u>Build -buffer-name=build<CR>
"}}}

" VimFiler"{{{
"---------------------------------------------------------------------------
" VimFiler
"---------------------------------------------------------------------------
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_enable_auto_cd=1
let g:vimfiler_split_action="right"
let g:vimfiler_split_rule="topleft"
"let g:vimfiler_max_filename_width=50

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

nnoremap <silent> <Leader>fe :<C-u>VimFiler -buffer-name=explorer -split -toggle -winwidth=65 -no-quit -auto-cd<CR>

"}}}

" Neocomplcache"{{{
"---------------------------------------------------------------------------
" Neocomplcache
"---------------------------------------------------------------------------
" Launches neocomplcache automatically on vim startup.
" Note that switching off neocon achieves to make inserting character comfortably.
let g:neocomplcache_enable_at_startup = 1
" Manually boot though enable on startup
let g:neocomplcache_disable_auto_complete = 1

let g:neocomplcache_max_list = 20

inoremap <expr><C-Space>  neocomplcache#start_manual_complete()

"}}}

" Memolist"{{{
"---------------------------------------------------------------------------
" Memolist
"---------------------------------------------------------------------------
let g:memolist_path="~/Dropbox/memolist"
let g:memolist_memo_suffix = "markdown"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1
let g:memolist_qfixgrep = 0
let g:memolist_vimfiler = 1
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
"}}}

"---------------------------------------------------------------------------
" Vimshell
"---------------------------------------------------------------------------
noremap <silent> <Leader>s :<C-u>VimShellPop -buffer-name="vimshell"<CR>
let g:vimshell_popup_height = 25
let g:vimshell_prompt = "vimshell$ "
let g:vimshell_secondary_prompt = "%%"
let g:vimshell_user_prompt = 'getcwd()'
" let g:vimshell_user_prompt = ''



"---------------------------------------------------------------------------
" TweetVim
"---------------------------------------------------------------------------
nnoremap <silent> <Leader>ts :<C-u>TweetVimSay<CR>
nnoremap <silent> <Leader>th :<C-u>TweetVimHomeTimeline<CR>

"---------------------------------------------------------------------------
" Quickrun
"---------------------------------------------------------------------------
noremap <silent> <Leader>r :<C-u>QuickRun<CR>


"---------------------------------------------------------------------------
" metarw-tumblr
"---------------------------------------------------------------------------
let g:metarw#tumblr#default_hostname = 'ilyaletre.tumblr.com'

" airline {{{
"---------------------------------------------------------------------------
" airline
"---------------------------------------------------------------------------
let g:airline_theme='powerlineish'
"let g:airline_left_sep=''
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = ''
"let g:airline_right_sep=''
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = ''
let g:airline_branch_prefix = ' '
let g:airline_readonly_symbol = ''
let g:airline_linecolumn_prefix = ' '
let g:airline_detect_whitespace=0 "disabled
let g:airline_powerline_fonts=1
let g:airline_enable_branch = 1

"}}}

