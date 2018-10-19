" Import all the .vim files that are used for configuraiton
" https://afnan.io/2018-04-12/my-neovim-development-setup/
for conf_file in split(glob('~/.config/nvim/config/*.vim'), '\n')
	exe 'source' conf_file
endfor

" Enable line numbers and column numbers
set number
set ruler

set termguicolors
colorscheme sublimemonokai
syntax enable
let g:sublimemonokai_term_italic = 1

" Set a dark background
" set background=dark

" Always set the sign column/gutter instead of doing it for specific
" plugins
set signcolumn=yes
