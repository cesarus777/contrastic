" -----------------------------------------------------------------------------
" File: contrastic.vim
" Description: Contrasting color scheme for Vim
" Author: cesarus777 <ulius.cesarus@gmail.com>
" Source: https://github.com/cesarus777/contrastic
" Last Modified: 9 Jul 2021
" -----------------------------------------------------------------------------

if get(g:, 'loaded_contrastic', 0)
  finish
endif
let g:loaded_contrastic = 1

function s:StartDynamicBackground(timeout)
  if g:contrastic_enable_dyn_bg
    let s:timer_id =
          \ timer_start(1000 * (a:timeout + 0),
                      \ function('contrastic#set_bg'),
                      \ {'repeat': -1})

    call contrastic#set_bg(s:timer_id)
  endif
endfunction

function s:StopDynamicBackground()
  if !exists("s:timer_id")
    return
  endif

  call timer_stop(s:timer_id)
endfunction

function s:SetDynamicBackgroundTimeout(timeout)
  call s:StopDynamicBackground()
  call s:StartDynamicBackground(a:timeout)
endfunction

if !exists(":ContrasticSetBg")
  command -nargs=0 ContrasticSetBg :call contrastic#set_bg(0)
endif

if !exists(":ContrasticSetDynBgTimeout")
  command -nargs=1 ContrasticSetDynBgTimeout :call s:SetDynamicBackgroundTimeout(<args>)
endif

if !exists(":ContrasticStopDynBg")
  command -nargs=0 ContrasticStopDynBg :call s:StopDynamicBackground()
endif

" Startup dynamic background with default timer timeout - 60 seconds
ContrasticSetDynBgTimeout 60

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
