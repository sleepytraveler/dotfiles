let mapleader = ','

" -------------------- Generic functions ------------------------------
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"--------------------- CoC keymaps ------------------------------------
" Insert mode
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Goto code navigation
nmap <silent>gd	<Plug>(coc-definition)
nmap <silent>gv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gac <Plug>(coc-codeaction)
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use `[g` and `]g` to navigate diagnostics - keeping in line
" with the similar keymaps in vim-unimpaired plugin
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Formatting
vmap <Leader>gf <Plug>(coc-format-selected)

" Highlight symbol under cursor on CursorHold
"    - this is default behavior on neovim, but not vim
" autocmd CursorHold * silent call CocActionAsync('highlight')

" -------------- fzf.vim setup ---------------------------------------
nmap <Leader>; :Buffers<CR>
nmap <Leader>t :GFiles<CR>

" -------------- Clang-format integration ----------------------------
"if filereadable(expand("/usr/share/clang/clang-format.py"))
"	map <C-K> :pyf /usr/share/clang/clang-format.py<CR>
"	"imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<CR>
"end

" -------------- QuickFix window navigation/manipulation -------------
nmap \x :cclose <CR>

" -------------- Search and Grep shortcuts ---------------------------
" -------------- Ack.vim setup ---------------------------------------
nmap <Leader>s :Ack! "\b<cword>\b" %:p:h <CR>
nmap <Leader>f :Ack! "\b<cword>\b" <CR>

" -------------- Generic shortcuts -----------------------------------

