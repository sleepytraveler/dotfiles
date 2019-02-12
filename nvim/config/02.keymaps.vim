let mapleader = ','

" ---------------- Language Server/Client -----------------------------
" Custom keymaps for Language Client
function SetLSPShortcuts()
	nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
	nnoremap <leader>lv :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>
	nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
	nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
	nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
	nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
	nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
	nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
	nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
	nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
	nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
	autocmd!
	autocmd FileType cpp,c call SetLSPShortcuts()
augroup END

" -------------- ncm2 completion plugin ------------------------------
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" -------------- NERDTree setup --------------------------------------
map <C-b> :NERDTreeToggle<CR>

" -------------- fzf.vim setup ---------------------------------------
nmap <Leader>; :Buffers<CR>
nmap <Leader>t :Files<CR>

" -------------- Ack.vim setup ---------------------------------------
nmap <M-k> :Ack! "\b<cword>\b" %:p:h <CR>
nmap <M-F> :Ack! "\b<cword>\b" <CR>

" -------------- Clang-format integration ----------------------------
if filereadable(expand("/usr/share/clang/clang-format.py"))
	map <C-K> :pyf /usr/share/clang/clang-format.py<CR>
	"imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<CR>
end

" -------------- QuickFix window navigation/manipulation -------------
nmap \x :cclose <CR>

" -------------- Generic shortcuts -----------------------------------
map <Leader>cd :cd %:p:h<CR>

