" Contains all the ncm2 related configuration"
" It is based on tips and information in:
" https://github.com/ncm2/ncm2
"

" Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" Set completion options
set completeopt=noinsert,menuone,noselect

