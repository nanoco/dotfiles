function! custom_fold#execute()
  let l:line_num = v:foldend - v:foldstart
  let l:line = s:fold_str(v:foldlevel, getline(v:foldstart), l:line_num)
  return l:line
endfunction

function! s:fold_str(level, text, line)
  let l:max_line_num = 75
  let l:line_text = "+" . repeat("--", a:level) . a:text
  let l:line_width = strdisplaywidth(l:line_text)
  let l:fold_info = printf(" [%4d Lv-%-2d]", a:line, a:level)
  let l:interval = ''

  if l:max_line_num < (line_width + strlen(l:fold_info))
    let num = l:max_line_num - (line_width - l:max_line_num) - 1
    let l:line_text = l:line_text[:num]
    let l:interval = repeat(" ",
      \ l:max_line_num - (strdisplaywidth(l:line_text) + strlen(l:fold_info)))
  else
    let num = line_width - l:max_line_num
    let l:interval = repeat(" ", l:max_line_num - (line_width + strlen(l:fold_info)))
  endif
  return l:line_text . l:interval . l:fold_info
endfunction
