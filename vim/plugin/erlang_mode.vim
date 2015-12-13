function! MyErlangModeOn()
  let g:quickrun_config['erlang/watchdogs_checker']['type'] = 'watchdogs_checker/flymake'
  setlocal omnifunc=erlang_complete#Complete
  let g:neocomplete#force_omni_input_patterns.erlang =
        \ '\<[[:digit:][:alnum:]_-]\+:[[:digit:][:alnum:]_-]*'
endfunction

function! MyErlangModeOff()
  let g:quickrun_config['erlang/watchdogs_checker']['type'] = ''
  let g:neocomplete#force_omni_input_patterns.erlang = ''
endfunction

command ErlangModeOn call MyErlangModeOn()
command ErlangModeOff  call MyErlangModeOff()
