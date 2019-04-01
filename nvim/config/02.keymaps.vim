let mapleader = ','

" CoC keymaps
inoremap <silent><expr> <c-space> coc#refresh()
nmap <Leader>ld	<Plug>(coc-definition)
nmap <Leader>lx <Plug>(coc-references)
nmap <Leader>lt <Plug>(coc-codelens-action)
vmap <Leader>lf <Plug>(coc-format-selected)
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" -------------- fzf.vim setup ---------------------------------------
nmap <Leader>; :Buffers<CR>
nmap <Leader>t :Files<CR>

" -------------- Ack.vim setup ---------------------------------------
nmap <M-k> :Ack! "\b<cword>\b" %:p:h <CR>
nmap <M-F> :Ack! "\b<cword>\b" <CR>

" -------------- Clang-format integration ----------------------------
"if filereadable(expand("/usr/share/clang/clang-format.py"))
"	map <C-K> :pyf /usr/share/clang/clang-format.py<CR>
"	"imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<CR>
"end

" -------------- QuickFix window navigation/manipulation -------------
nmap \x :cclose <CR>

" -------------- Generic shortcuts -----------------------------------
map <Leader>cd :cd %:p:h<CR>

