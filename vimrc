" Leader
let mapleader = " "

" Avoid Esc Key
:imap jk <Esc>

" Show relative line numbers
:set relativenumber

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
" set expandtab

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Toggle paste mode
nnoremap <C-p> :set invpaste paste?<CR>
set pastetoggle=<C-p>
set showmode

" Tmux Runner
nmap <leader>osr :VtrOpenRunner { 'orientation': 'h', 'percentage': 50 }<cr>
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>
nnoremap <leader>sd :VtrSendCtrlD<cr>

" Rspec Config
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Shortcuts
map <Leader>f :Files<CR>

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'davidoc/taskpaper.vim'
Plug 'vim-scripts/vim-auto-save' 
Plug 'djoshea/vim-autoread'

Plug 'tpope/vim-rails'
 
call plug#end()

" Taskpaper Settings
autocmd filetype taskpaper let g:auto_save = 1
autocmd filetype taskpaper :WatchForChanges!
