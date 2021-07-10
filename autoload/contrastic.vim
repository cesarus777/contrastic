" -----------------------------------------------------------------------------
" File: contrastic.vim
" Description: Contrasting color scheme for Vim
" Author: cesarus777 <ulius.cesarus@gmail.com>
" Source: https://github.com/cesarus777/contrastic
" Last Modified: 9 Jul 2021
" -----------------------------------------------------------------------------

function! contrastic#invert_signs_toggle()
  if g:contrastic_invert_signs == 0
    let g:contrastic_invert_signs=1
  else
    let g:contrastic_invert_signs=0
  endif

  colorscheme contrastic
endfunction

" Debug {{{

if !exists("g:contrastic_debug")
  let g:contrastic_debug = 0
endif

" }}}
" Search Highlighting {{{

function! contrastic#hls_show()
  set hlsearch
  call ContrasticHlsShowCursor()
endfunction

function! contrastic#hls_hide()
  set nohlsearch
  call ContrasticHlsHideCursor()
endfunction

function! contrastic#hls_toggle()
  if &hlsearch
    call contrastic#hls_hide()
  else
    call contrastic#hls_show()
  endif
endfunction

" }}}
" Dynamic Background {{{

function! contrastic#set_bg(timer_id)
  if !exists("g:contrastic_enable_dyn_bg")
    if g:contrastic_debug
      echo "!exists(\"g:contrastic_enable_dyn_bg\")"
    endif

    return
  endif

  if !g:contrastic_enable_dyn_bg
    if g:contrastic_debug
      echo "!g:contrastic_enable_dyn_bg"
    endif

    return
  endif

  if !exists("g:contrastic_light_bg_time")
    if g:contrastic_debug
      echo "!exists(\"g:contrastic_light_bg_time\")"
    endif

    return
  endif

  if (len(g:contrastic_light_bg_time) != 2)
    if g:contrastic_debug
      echo "(len(g:contrastic_light_bg_time) != 2)"
    endif

    return
  endif

  let [l:light, l:dark] = g:contrastic_light_bg_time
  let l:hour = strftime('%H')
  let l:background = &background
  let l:is_dark = &background == 'dark'

  if (l:hour >= l:light) && (l:hour < l:dark) && l:is_dark
    set background=light
    let g:lsp_cxx_hl_light_bg = 1
    mode
  elseif ((l:hour < l:light) || (l:hour >= l:dark)) && !l:is_dark
    set background=dark
    let g:lsp_cxx_hl_light_bg = 0
    mode
  endif
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
