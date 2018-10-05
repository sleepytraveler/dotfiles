" Import all the .vim files that are used for configuraiton
" https://afnan.io/2018-04-12/my-neovim-development-setup/
for conf_file in split(glob('~/.config/nvim/config/*.vim'), '\n')
	exe 'source' conf_file
endfor

" Set a dark background
set background=dark

" Enable line numbers and column numbers
set number
set ruler
