

" Setup Vim Plug (a plugin manager for VIM/NVIM)
" https://github.com/junegunn/vim-plug
""" Specify directory for plugins
call plug#begin('~/.config/nvim/plugins')

Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Linux kernel coding style plugin
Plug 'vivien/vim-linux-coding-style'

call plug#end()

" Set a dark background
set background=dark

" Enable line numbers and column numbers
set number
set ruler
