function! agriculture#smart_quote_input(input)
  if get(g:, 'agriculture#disable_smart_quoting', 0) > 0
    return a:input
  endif
  let hasQuotes = match(a:input, '"') > -1 || match(a:input, "'") > -1
  let hasOptions = match(' ' . a:input, '\s-[-a-zA-Z]') > -1
  let hasEscapedSpacesPlusPath = match(a:input, '\\ .*\ ') > 0
  return hasQuotes || hasOptions || hasEscapedSpacesPlusPath ? a:input : '-- "' . a:input . '"'
endfunction

function! agriculture#trim_and_escape_register_a()
  let query = getreg('a')
  let trimmedQuery = s:trim(query)
  let escapedQuery = escape(trimmedQuery, "'#%\\")
  call setreg('a', escapedQuery)
endfunction

function! agriculture#fzf_ag_raw(command_suffix, ...)
  if !executable('ag')
    return s:warn('ag is not found')
  endif
  let userOptions = get(g:, 'agriculture#ag_options', '')
  let command = 'ag --nogroup --column --color ' . s:trim(userOptions . ' ' . a:command_suffix)
  let bang = a:000[0]
  return call('fzf#vim#grep', extend([command, 1], [s:preview(bang), bang]))
endfunction

function! agriculture#fzf_rg_raw(command_suffix, ...)
  if !executable('rg')
    return s:warn('rg is not found')
  endif
  let userOptions = get(g:, 'agriculture#rg_options', '')
  let command = 'rg --column --line-number --no-heading --color=always ' . s:trim(userOptions . ' ' . a:command_suffix)
  let bang = a:000[0]
  return call('fzf#vim#grep', extend([command, 1], [s:preview(bang), bang]))
endfunction

function! s:preview(bang, ...)
  let preview_window = get(g:, 'fzf_preview_window', a:bang && &columns >= 80 || &columns >= 120 ? 'right': '')
  if len(preview_window)
    return call('fzf#vim#with_preview', add(copy(a:000), preview_window))
  endif
  return {}
endfunction

function! s:trim(str)
  if exists('*trim')
    return trim(a:str)
  else
    return matchstr(a:str, '^\s*\zs.\{-}\ze\s*$')
  endif
endfunction

function! s:warn(message)
  echohl WarningMsg
  echom a:message
  echohl None
  return 0
endfunction
