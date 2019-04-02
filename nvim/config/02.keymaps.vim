let mapleader = ','

" CoC keymaps
inoremap <silent><expr> <c-space> coc#refresh()
nmap <Leader>ld	<Plug>(coc-definition)
nmap <Leader>lx <Plug>(coc-references)
nmap <Leader>li <Plug>(coc-implementation)
vmap <Leader>lf <Plug>(coc-format-selected)

nmap <Leader>ac <Plug>(coc-codeaction)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
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

