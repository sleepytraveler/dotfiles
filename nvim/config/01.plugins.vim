
" Setup Vim Plug (a plugin manager for VIM/NVIM)
" https://github.com/junegunn/vim-plug
""" Specify directory for plugins
call plug#begin('~/.config/nvim/plugins')

Plug 'junegunn/vim-easy-align'

" Vim airline for powerline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Cscope plugin that puts results in quickfix window
" Plug  'ronakg/quickr-cscope.vim'

" Auto insert matching closing pair
Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
" Commenting helper
Plug 'tpope/vim-commentary'

" NERDTree - using on-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Git gutter provides a diff in the gutter
Plug 'airblade/vim-gitgutter'

" Linux kernel coding style plugin
Plug 'vivien/vim-linux-coding-style'

" Autoformatter for code
" Plug 'Chiel92/vim-autoformat'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
" Plug 'autozimu/LanguageClient-neovim', {
" 			\ 'branch': 'next',
" 			\ 'do': 'bash install.sh',
" 			\ }
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-pyclang'

"Molokai colorscheme
Plug 'ErichDonGubler/vim-sublime-monokai'

Plug 'ntpeters/vim-better-whitespace'

Plug 'embear/vim-localvimrc'

Plug 'simplyzhao/cscope_maps.vim'

Plug 'christoomey/vim-tmux-navigator'

" Python plugins
" Plug 'Vimjas/vim-python-pep8-indent'
Plug 'python-mode/python-mode', { 'branch': 'develop' }

Plug 'chaoren/vim-wordmotion'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" Specific plugin setup """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable autoformatting on save
" au BufWrite * :Autoformat

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

" Setup ack.vim to use rg instead of Ack
if executable('rg')
	let g:ackprg = 'rg --vimgrep -S'
endif

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
nnoremap <Leader>g :silent lgrep<Space>
nnoremap <silent> [f :lprevious<CR>
nnoremap <silent> ]f :lnext<CR>

" Disable verbose for cscope - avoids having to press enter
" when launching nvim/vim
set nocscopeverbose

" Setup python-mode plugin to use python3 syntax by default
let g:pymode_python = 'python3'

" Remove the pymode colorcolumn setting and mark the columns
" above 80 as error
let g:pymode_options_colorcolumn = 0

autocmd BufEnter *.py :call s:PythonHighlighting()

function s:PythonHighlighting()
	highlight default link PyError ErrorMsg

	syn match PyError / \+\ze\t/			"spaces before tab
	syn match PyError /\%>80v[^()\{\}\[\]<>]\+/ 	" virtual column 81 and more

	autocmd InsertEnter * match PyError /\s\+\%#\@<!$/
	autocmd InsertLeave * match PyError /\s\+$/
endfunction

" Settings for coc.nvim
" See https://github.com/neoclide/coc.nvim for more details
set hidden
set cmdheight=2		" better display for messages
set updatetime=300	" Smaller update time for CursorHold & CursorHoldI
set shortmess+=c	" don't give |ins-completion-menu| messages

