set nocompatible

set term=screen-256color

" Leader
let mapleader = " "

" Avoid Esc Key
inoremap jj <Esc>

" Set clipboard
set clipboard=unnamed

" Enable mouse use in all modes
set mouse=a
set ttymouse=xterm2

" Show relative line numbers
set relativenumber

" Highlight column 80
" set colorcolumn=80

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround

" Set split directions
set splitbelow
set splitright

" Nice indent
imap <C-Return> <CR><CR><C-o>k<S-s>

" autocompletion
" imap <Tab> <C-x><C-o>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>+ :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" FZF Search
map <Leader>f :Files<CR>

" Emmet Completion
map <Leader>, <C-y>,

" Open tag in split
map <leader>\ :vsp <CR> <C-]>
map <leader>- :sp <CR> <C-]>

" vimwiki config
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/AutoComplPop'

Plug 'tpope/vim-endwise'

Plug 'Townk/vim-autoclose'
Plug 'alvan/vim-closetag'

Plug 'elixir-lang/vim-elixir'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'slashmili/alchemist.vim'

Plug 'vimwiki/vimwiki'

Plug 'ludovicchabant/vim-gutentags'

Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on

" Hide status bar
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <S-h> :call ToggleHiddenAll()<CR>

colorscheme gruvbox

" hi modemsg ctermfg=8 ctermbg=none cterm=none
" hi statusline ctermfg=10 ctermbg=none cterm=none
" hi statuslinenc ctermfg=8 ctermbg=none cterm=none

set fillchars+=vert:\ 

" Set statusline
set statusline=%=          " align left
set statusline+=%t         " filename
set statusline+=%m         " modified flag
set statusline+=%10(%l,%c%)\            " line and column
set statusline+=%P                        " percentage of file
