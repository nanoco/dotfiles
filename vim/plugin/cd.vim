function! s:change_current_dir(directory)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif
endfunction
command! -nargs=? -complete=dir -bang CD s:change_current_dir('<args>')
