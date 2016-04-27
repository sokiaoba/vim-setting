"-------------------------------------------------------------------------------
" BASIC
"-------------------------------------------------------------------------------
set nobackup
set noswapfile
set showmode
set guifont=Osaka－等幅:h14
set encoding=utf-8
set fileencodings=utf8
set confirm
set noundofile
set visualbell t_vb=
let &t_Co=256
:set binary noeol

"-------------------------------------------------------------------------------
" APPERANCE
"-------------------------------------------------------------------------------
syntax on
set showmatch
set number
set ruler
set cmdheight=2
set showcmd
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
:set ttyfast
set laststatus=2
:set splitright
:colorscheme peachpuff

"-------------------------------------------------------------------------------
" MOVE
"-------------------------------------------------------------------------------
nnoremap 1 0
nnoremap 0 ^
nnoremap 9 $
nnoremap [ %
nnoremap ] %
vnoremap v $h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
set backspace=indent,eol,start

""-------------------------------------------------------------------------------
"" INDENT
""-------------------------------------------------------------------------------
set autoindent
set smartindent
set cindent
set tabstop=4 
set shiftwidth=4 
set fileformat=unix
set noexpandtab

"-------------------------------------------------------------------------------
" SEARCH
"-------------------------------------------------------------------------------
set hlsearch
set incsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"-------------------------------------------------------------------------------
" TABS
"-------------------------------------------------------------------------------
nnoremap <Space>t t
nnoremap <Space>T T
nnoremap t <Nop>
nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> tk :<C-u>tabclose<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>
set showtabline=2

"-------------------------------------------------------------------------------
" COMPLETION
"-------------------------------------------------------------------------------
let g:omni_sql_no_default_maps = 1
let g:ftplugin_sql_omni_key = '<Leader>sql'

"-------------------------------------------------------------------------------
" PLUGIUNS
"-------------------------------------------------------------------------------

"---
" NEO BUNDLE
"---
if 0 | endif
if &compatible
	set nocompatible
endif
set runtimepath^=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	NeoBundle 'thinca/vim-quickrun'
	NeoBundle 'Shougo/neocomplcache'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"---
" VIM-QUICKRUN
"---
let g:quickrun_config={'*': {'split': 'vertical'}}

"---
" NEOCOMPLCACHE
"---
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : ''
			\ }

"-------------------------------------------------------------------------------
" INDENT OF PYTHON FILE
"-------------------------------------------------------------------------------
" Somehow these don't work unless write here :(
autocmd Filetype python setl noexpandtab tabstop=4 shiftwidth=4
autocmd Filetype python setl nocindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
