"-------------------------------------------------------------------------------
" BASIC
"-------------------------------------------------------------------------------
set nobackup
set noswapfile
set showmode
set guifont=Osaka-Mono:h14
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
set expandtab

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

if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('tomasr/molokai')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('thinca/vim-quickrun')
  call dein#add('scrooloose/nerdtree')
  call dein#add('keith/swift.vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('fatih/vim-go')
  call dein#add('tomlion/vim-solidity')
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

:colorscheme molokai

"-------------------------------------------------------------------------------
" neocomplete.vim
"-------------------------------------------------------------------------------

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"-------------------------------------------------------------------------------
" INDENT OF PYTHON FILE
"-------------------------------------------------------------------------------
" Somehow these don't work unless write here :(
autocmd Filetype python setl noexpandtab tabstop=4 shiftwidth=4
autocmd Filetype python setl nocindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
