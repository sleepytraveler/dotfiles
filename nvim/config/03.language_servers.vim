" Contains VIM settings specific to the language client plugin
"
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
			\ 'c': ['cquery',
			\ '--log-file=/tmp/cq.log',
			\ '--init={"cacheDirectory":"$HOME/.cache/cquery/"}'],
			\ 'cpp': ['cquery',
			\ '--log-file=/tmp/cq.log',
			\ '--init={"cacheDirectory":"$HOME/.cache/cquery/"}']
			\ }

" Disable LanguageClient Diagnostics in quickfix list
let g:LanguageClient_diagnosticsList = "Disabled"
