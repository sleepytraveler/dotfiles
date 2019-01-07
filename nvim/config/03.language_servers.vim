" Contains VIM settings specific to the language client plugin
"
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
			\ 'c': ['ccls', '--log-file=/tmp/ccls.log'],
			\ 'cpp': ['ccls', '--log-file=/tmp/ccls.log'],
			\ }

" Disable LanguageClient Diagnostics in quickfix list
let g:LanguageClient_diagnosticsList = "Disabled"
