" Contains VIM settings specific to the language client plugin
"
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
			\ 'c': ['ccls', '--log-file=/tmp/ccls.log'],
			\ 'cpp': ['ccls', '--log-file=/tmp/ccls.log'],
			\ 'python': ['pyls']
			\ }

" Disable LanguageClient Diagnostics in quickfix list
let g:LanguageClient_diagnosticsList = "Disabled"

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '/home/vrkonda/.config/nvim/settings.json'
let g:LanguageClient_hasSnipperSupport = 0
