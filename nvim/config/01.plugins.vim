
" Setup Vim Plug (a plugin manager for VIM/NVIM)
" https://github.com/junegunn/vim-plug
""" Specify directory for plugins
call plug#begin('~/.config/nvim/plugins')

" Easily align text
Plug 'junegunn/vim-easy-align'

" Better nagivation between words - camel case, break words, etc.
Plug 'chaoren/vim-wordmotion'

" Vim airline for powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto insert matching closing pair
Plug 'jiangmiao/auto-pairs'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Add keymaps for matching pairs of operations using [ and ]
Plug 'tpope/vim-unimpaired'

" Add keymaps for modifying matching brackets and quotes
Plug 'tpope/vim-surround'

" Commenting helper
Plug 'tpope/vim-commentary'

" Git gutter provides a diff in the gutter
Plug 'airblade/vim-gitgutter'

" Linux kernel coding style plugin
Plug 'vivien/vim-linux-coding-style'

" Fuzzy searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Better search wrapper
Plug 'mileszs/ack.vim'

" Language server plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Molokai colorscheme
Plug 'ErichDonGubler/vim-sublime-monokai'

" Nord dark colorscheme
Plug 'arcticicestudio/nord-vim'

" Highlight whitespace
Plug 'ntpeters/vim-better-whitespace'

" Use local vimrc if present to augment global vimrc
Plug 'embear/vim-localvimrc'

" Add keymaps for Cscope
Plug 'simplyzhao/cscope_maps.vim'

" Navigate between VIM and tmux panes
Plug 'christoomey/vim-tmux-navigator'

" Autoformatter for code
" Plug 'Chiel92/vim-autoformat'

" Cscope plugin that puts results in quickfix window
" Plug  'ronakg/quickr-cscope.vim'

" NERDTree - using on-demand loading
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Python plugins
" Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'python-mode/python-mode', { 'branch': 'develop' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" Specific plugin setup """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable autoformatting on save
" au BufWrite * :Autoformat

" vim-airline setup
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Git Gutter setup
" Reduce the NVIM update time to 250 ms
set updatetime=250

" Setup for NERDcommenter
" filetype plugin on

" Setup for localvimrc loading plugin
let g:localvimrc_persistent = 1

" Setup ack.vim to use rg instead of Ack
if executable('rg')
	let g:ackprg = 'rg --vimgrep -S'
endif

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" Disable verbose for cscope - avoids having to press enter
" when launching nvim/vim
set nocscopeverbose

" Setup python-mode plugin to use python3 syntax by default
" let g:pymode_python = 'python3'

" Remove the pymode colorcolumn setting and mark the columns
" above 80 as error
" let g:pymode_options_colorcolumn = 0

" autocmd BufEnter *.py :call s:PythonHighlighting()

" function s:PythonHighlighting()
" 	highlight default link PyError ErrorMsg

" 	syn match PyError / \+\ze\t/			"spaces before tab
" 	syn match PyError /\%>80v[^()\{\}\[\]<>]\+/ 	" virtual column 81 and more

" 	autocmd InsertEnter * match PyError /\s\+\%#\@<!$/
" 	autocmd InsertLeave * match PyError /\s\+$/
" endfunction

" Settings for coc.nvim
" See https://github.com/neoclide/coc.nvim for more details
set hidden
set updatetime=300	" Smaller update time for CursorHold & CursorHoldI
set shortmess+=c	" don't give |ins-completion-menu| messages

" set cmdheight=1		" better display for messages
