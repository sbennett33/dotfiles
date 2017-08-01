set term=screen-256color

" Leader
let mapleader = ","

" Avoid Esc Key
inoremap jj <Esc>

" Set clipboard
set clipboard=unnamed

" Enable mouse use in all modes
set mouse=a
set ttymouse=xterm2

" Show relative line numbers
:set relativenumber

" Highlight column 80
set colorcolumn=80

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
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Vim Test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>

" make test commands execute using dispatch.vim
let test#strategy = "vtr"

" close test window
nnoremap <leader>kr :VtrKillRunner<CR>

" focus the test window
nnoremap <leader>j :VtrFocusRunner<CR>

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
Plug 'christoomey/vim-tmux-runner'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'janko-m/vim-test'

Plug 'tpope/vim-endwise'

Plug 'Townk/vim-autoclose'
Plug 'alvan/vim-closetag'

Plug 'elixir-lang/vim-elixir'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'slashmili/alchemist.vim'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

Plug 'vimwiki/vimwiki'
 
call plug#end()

filetype plugin indent on

" Rename files
function! RenameFile()
	let old_name = expand('%')
	let new_name = input('New file name: ', expand('%'), 'file')
	if new_name != '' && new_name != old_name
		exec ':saveas ' . new_name
		exec ':silent !rm ' . old_name
		redraw!
	endif
endfunction
map <leader>r :call RenameFile()<cr>

" Set statusline
:set statusline=%f         " Path to the file
:set statusline+=\ -\      " Separator
:set statusline+=FileType: " Label
:set statusline+=%y        " Filetype of the file
:set statusline+=\ -\    " Separator
:set statusline+=%l    " Current line
:set statusline+=/    " Separator
:set statusline+=%L   " Total lines
:set statusline+=\ -\    " Separator
:set statusline+=%{fugitive#statusline()} " Current git branch
