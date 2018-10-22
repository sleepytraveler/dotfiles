
" Setup Vim Plug (a plugin manager for VIM/NVIM)
" https://github.com/junegunn/vim-plug
""" Specify directory for plugins
call plug#begin('~/.config/nvim/plugins')

Plug 'junegunn/vim-easy-align'

" Vim airline for powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Cscope plugin that puts results in quickfix window
Plug  'ronakg/quickr-cscope.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'

" NERDTree - using on-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Commenting helper
Plug 'scrooloose/nerdcommenter'

" Git gutter provides a diff in the gutter
" Plug 'airblade/vim-gitgutter'

" Linux kernel coding style plugin
Plug 'vivien/vim-linux-coding-style'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-pyclang'

"Molokai colorscheme
Plug 'ErichDonGubler/vim-sublime-monokai'

Plug 'ntpeters/vim-better-whitespace'

Plug 'embear/vim-localvimrc'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" Specific plugin setup """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-airline setup
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Git Gutter setup
" Reduce the NVIM update time to 250 ms
set updatetime=250

"Setup for NERDcommenter
filetype plugin on

" Setup for localvimrc loading plugin
let g:localvimrc_persistent = 1

" Setup ack.vim to use ag instead of Ack
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

