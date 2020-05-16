" Import all the .vim files that are used for configuraiton
" https://afnan.io/2018-04-12/my-neovim-development-setup/
for conf_file in split(glob('~/.config/nvim/config/*.vim'), '\n')
	exe 'source' conf_file
endfor

" Enable line numbers and column numbers
set relativenumber
set number
set ruler

set termguicolors
colorscheme nord
" colorscheme sublimemonokai
" let g:sublimemonokai_term_italic = 1

syntax enable

" set highlight colors
set hlsearch
hi Search guibg=peru guifg=wheat

" Set a dark background
" set background=dark

" Always set the sign column/gutter instead of doing it for specific
" plugins
set signcolumn=yes

" Highlight the current cursor line
set cursorline

" Set mouse mode on in tty
set mouse=a

" Set smart case search
set ignorecase
set smartcase

" Setup integration with clipboard (atleast Mac)
set cb=unnamed
