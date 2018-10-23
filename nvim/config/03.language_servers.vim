" Contains VIM settings specific to the language client plugin
"
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
			\ 'c': ['clangd'],
			\ 'cpp': ['clangd'],
			\ }

" Disable LanguageClient Diagnostics in quickfix list
let g:LanguageClient_diagnosticsList = "Disabled"
