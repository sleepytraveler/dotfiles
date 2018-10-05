
" Setup Vim Plug (a plugin manager for VIM/NVIM)
" https://github.com/junegunn/vim-plug
""" Specify directory for plugins
call plug#begin('~/.config/nvim/plugins')

Plug 'junegunn/vim-easy-align'

" Vim airline for powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git gutter provides a diff in the gutter
Plug 'airblade/vim-gitgutter'

" Cscope plugin that puts results in quickfix window
Plug  'ronakg/quickr-cscope.vim'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Linux kernel coding style plugin
Plug 'vivien/vim-linux-coding-style'

call plug#end()

