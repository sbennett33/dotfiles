set encoding=utf-8

inoremap jj <Esc>`^

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

let g:mapleader=' '

set number
set relativenumber
set cursorline
set cursorcolumn
set mouse=a

set hlsearch
set incsearch
set ignorecase
set smartcase

set splitbelow
set splitright

set nobackup
set noswapfile

set backspace=indent,eol,start
set clipboard=unnamed

set pastetoggle=<F2>

" auto resize windows
autocmd VimResized * :wincmd =

call plug#begin('~/.config/nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-projectionist'

Plug 'slashmili/alchemist.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomasr/molokai'
Plug 'tpope/vim-endwise'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'sbdchd/neoformat'
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" Session management
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
let g:session_directory="~/./session"
let g:session_autoload="no"
let g:session_autosave="no"
let g:session_autosave_periodic=2
let g:session_command_aliases=1

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <silent> <leader>f :FZF -m<CR>

Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_cache_dir = '~/.tags_cache'

Plug 'neomake/neomake'
autocmd! BufWritePost * Neomake
let g:neomake_elixir_enabled_makers = ['mix', 'credo']

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
" use tab for completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'vim-scripts/grep.vim'
nnoremap <silent> <leader>F :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db tags'
let Grep_Skip_Dirs = '.git _build cover node_modules deps doc'
set grepprg=ag\ --nogroup\ --nocolor

" Testing
Plug 'tpope/vim-dispatch'
Plug 'janko-m/vim-test'
let test#strategy = "dispatch"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
nmap <silent> <leader>c :cw

call plug#end()

set background=dark
syntax enable
colorscheme molokai
set termguicolors

nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<Space>
nnoremap <leader>sc :CloseSession<Space>

autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    'lib/*.ex':  {
\       'type': 'lib',
\       'skeleton': 'mod',
\       'alternate': 'test/{}_test.exs'
\    },
\    'test/*_test.exs':  {
\      'type': 'test',
\      'alternate': 'lib/{}.ex',
\      'skeleton': 'case'
\     },
\    'mix.exs':  {
\      'type': 'mix'
\     },
\    'config/*.exs':  {
\      'type': 'config'
\     },
\ })

augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END
