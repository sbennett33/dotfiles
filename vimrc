" Leader
let mapleader = " "

" Avoid Esc Key
:imap jk <Esc>

" Show relative line numbers
:set relativenumber

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Toggle paste mode
nnoremap <C-p> :set invpaste paste?<CR>
set pastetoggle=<C-p>
set showmode

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
