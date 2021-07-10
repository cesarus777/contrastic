" -----------------------------------------------------------------------------
" File: contrastic.vim
" Description: Contrasting color scheme for Vim
" Author: cesarus777 <ulius.cesarus@gmail.com>
" Source: https://github.com/cesarus777/contrastic
" Last Modified: 9 Jul 2021
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='contrastic'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:contrastic_bold')
  let g:contrastic_bold=1
endif
if !exists('g:contrastic_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:contrastic_italic=1
  else
    let g:contrastic_italic=0
  endif
endif
if !exists('g:contrastic_undercurl')
  let g:contrastic_undercurl=1
endif
if !exists('g:contrastic_underline')
  let g:contrastic_underline=1
endif
if !exists('g:contrastic_inverse')
  let g:contrastic_inverse=1
endif

if !exists('g:contrastic_guisp_fallback') || index(['fg', 'bg'], g:contrastic_guisp_fallback) == -1
  let g:contrastic_guisp_fallback='NONE'
endif

if !exists('g:contrastic_improved_strings')
  let g:contrastic_improved_strings=0
endif

if !exists('g:contrastic_improved_warnings')
  let g:contrastic_improved_warnings=0
endif

if !exists('g:contrastic_termcolors')
  let g:contrastic_termcolors=256
endif

if !exists('g:contrastic_invert_indent_guides')
  let g:contrastic_invert_indent_guides=0
endif

if !exists('g:contrastic_contrast_dark')
  let g:contrastic_contrast_dark='hard'
endif

if !exists('g:contrastic_contrast_light')
  let g:contrastic_contrast_light='hard'
endif

if !exists('g:contrastic_enable_dyn_bg')
  let g:contrastic_enable_dyn_bg = 1
endif
if !exists('g:contrastic_light_bg_time')
  let g:contrastic_light_bg_time = [8, 20]
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:cp = {}

" fill it with absolute colors
" TODO: set second numbers to meaningful values
let s:cp.dark0_hard    = ['#000000', 234]
let s:cp.dark0_medium  = ['#101008', 235]
let s:cp.dark0_soft    = ['#181810', 236]
let s:cp.dark1         = ['#242420', 237]
let s:cp.dark2         = ['#30302b', 239]
let s:cp.dark3         = ['#444440', 241]
let s:cp.dark4         = ['#555550', 243]
let s:cp.dark4_256     = ['#555550', 243]

let s:cp.gray_245      = ['#737360', 245]
let s:cp.gray_244      = ['#737360', 244]

let s:cp.light0_hard   = ['#fffff8', 230]
let s:cp.light0_medium = ['#f6f6e8', 229]
let s:cp.light0_soft   = ['#ededdc', 228]
let s:cp.light1        = ['#dcdccd', 223]
let s:cp.light2        = ['#cacabb', 250]
let s:cp.light3        = ['#bdbdaa', 248]
let s:cp.light4        = ['#a4a4a0', 246]
let s:cp.light4_256    = ['#a4a4a0', 246]

let s:cp.bright_red     = ['#fa2011', 167]
let s:cp.bright_green   = ['#89de12', 142]
let s:cp.bright_yellow  = ['#fae824', 214]
let s:cp.bright_blue    = ['#5adfff', 109]
let s:cp.bright_purple  = ['#ef5f90', 175]
let s:cp.bright_aqua    = ['#5eff9c', 108]
let s:cp.bright_orange  = ['#ffa408', 208]

let s:cp.neutral_red    = ['#cc241d', 124]
let s:cp.neutral_green  = ['#98971a', 106]
let s:cp.neutral_yellow = ['#d79921', 172]
let s:cp.neutral_blue   = ['#458588',  66]
let s:cp.neutral_purple = ['#b16286', 132]
let s:cp.neutral_aqua   = ['#689d6a',  72]
let s:cp.neutral_orange = ['#d65d0e', 166]

let s:cp.faded_red      = ['#a80a16',  88]
let s:cp.faded_green    = ['#889600', 100]
let s:cp.faded_yellow   = ['#c38205', 136]
let s:cp.faded_blue     = ['#0796ba',  24]
let s:cp.faded_purple   = ['#8f3f71',  96]
let s:cp.faded_aqua     = ['#427b58',  66]
let s:cp.faded_orange   = ['#af3a03', 130]

let s:cp.bright_neutral_blue = ['#cff1ff', 110]

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:contrastic_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:contrastic_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:contrastic_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:contrastic_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:contrastic_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:cp.dark0_hard
  if g:contrastic_contrast_dark == 'soft'
    let s:bg0  = s:cp.dark0_soft
  elseif g:contrastic_contrast_dark == 'medium'
    let s:bg0  = s:cp.dark0_medium
  endif

  let s:bg1  = s:cp.dark1
  let s:bg2  = s:cp.dark2
  let s:bg3  = s:cp.dark3
  let s:bg4  = s:cp.dark4

  let s:gray = s:cp.gray_245

  let s:fg0 = s:cp.light0_hard
  let s:fg1 = s:cp.light1
  let s:fg2 = s:cp.light2
  let s:fg3 = s:cp.light3
  let s:fg4 = s:cp.light4

  let s:fg4_256 = s:cp.light4_256

  let s:red    = s:cp.bright_red
  let s:green  = s:cp.bright_green
  let s:yellow = s:cp.bright_yellow
  let s:blue   = s:cp.bright_blue
  let s:purple = s:cp.bright_purple
  let s:aqua   = s:cp.bright_aqua
  let s:orange = s:cp.bright_orange
else
  let s:bg0  = s:cp.light0_hard
  if g:contrastic_contrast_light == 'soft'
    let s:bg0  = s:cp.light0_soft
  elseif g:contrastic_contrast_light == 'medium'
    let s:bg0  = s:cp.light0_medium
  endif

  let s:bg1  = s:cp.light1
  let s:bg2  = s:cp.light2
  let s:bg3  = s:cp.light3
  let s:bg4  = s:cp.light4

  let s:gray = s:cp.gray_244

  let s:fg0 = s:cp.dark0_hard
  let s:fg1 = s:cp.dark1
  let s:fg2 = s:cp.dark2
  let s:fg3 = s:cp.dark3
  let s:fg4 = s:cp.dark4

  let s:fg4_256 = s:cp.dark4_256

  let s:red    = s:cp.faded_red
  let s:green  = s:cp.faded_green
  let s:yellow = s:cp.faded_yellow
  let s:blue   = s:cp.faded_blue
  let s:purple = s:cp.faded_purple
  let s:aqua   = s:cp.faded_aqua
  let s:orange = s:cp.faded_orange
endif

" reset to 16 colors fallback
if g:contrastic_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:cp.bg0 = s:bg0
let s:cp.bg1 = s:bg1
let s:cp.bg2 = s:bg2
let s:cp.bg3 = s:bg3
let s:cp.bg4 = s:bg4

let s:cp.gray = s:gray

let s:cp.fg0 = s:fg0
let s:cp.fg1 = s:fg1
let s:cp.fg2 = s:fg2
let s:cp.fg3 = s:fg3
let s:cp.fg4 = s:fg4

let s:cp.fg4_256 = s:fg4_256

let s:cp.red    = s:red
let s:cp.green  = s:green
let s:cp.yellow = s:yellow
let s:cp.blue   = s:blue
let s:cp.purple = s:purple
let s:cp.aqua   = s:aqua
let s:cp.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:cp.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:cp.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:cp.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:cp.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:cp.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:cp.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:contrastic_hls_cursor')
  let s:hls_cursor = get(s:cp, g:contrastic_hls_cursor)
endif

let s:number_column = s:none
if exists('g:contrastic_number_column')
  let s:number_column = get(s:cp, g:contrastic_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:contrastic_sign_column')
    let s:sign_column = get(s:cp, g:contrastic_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:contrastic_color_column')
  let s:color_column = get(s:cp, g:contrastic_color_column)
endif

let s:vert_split = s:bg0
if exists('g:contrastic_vert_split')
  let s:vert_split = get(s:cp, g:contrastic_vert_split)
endif

let s:invert_signs = ''
if exists('g:contrastic_invert_signs')
  if g:contrastic_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:contrastic_invert_selection')
  if g:contrastic_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:contrastic_invert_tabline')
  if g:contrastic_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:contrastic_italicize_comments')
  if g:contrastic_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:contrastic_italicize_strings')
  if g:contrastic_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:contrastic_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:contrastic_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Contrastic Hi Groups: {{{

" memoize common hi groups
call s:HL('ContrasticFg0',  s:fg0)
call s:HL('ContrasticFg1',  s:fg1)
call s:HL('ContrasticFg2',  s:fg2)
call s:HL('ContrasticFg3',  s:fg3)
call s:HL('ContrasticFg4',  s:fg4)
call s:HL('ContrasticGray', s:gray)
call s:HL('ContrasticBg0',  s:bg0)
call s:HL('ContrasticBg1',  s:bg1)
call s:HL('ContrasticBg2',  s:bg2)
call s:HL('ContrasticBg3',  s:bg3)
call s:HL('ContrasticBg4',  s:bg4)

call s:HL('ContrasticRed',        s:red)
call s:HL('ContrasticRedBold',    s:red, s:none, s:bold)
call s:HL('ContrasticGreen',      s:green)
call s:HL('ContrasticGreenBold',  s:green, s:none, s:bold)
call s:HL('ContrasticYellow',     s:yellow)
call s:HL('ContrasticYellowBold', s:yellow, s:none, s:bold)
call s:HL('ContrasticBlue',       s:blue)
call s:HL('ContrasticBlueBold',   s:blue, s:none, s:bold)
call s:HL('ContrasticPurple',     s:purple)
call s:HL('ContrasticPurpleBold', s:purple, s:none, s:bold)
call s:HL('ContrasticAqua',       s:aqua)
call s:HL('ContrasticAquaBold',   s:aqua, s:none, s:bold)
call s:HL('ContrasticOrange',     s:orange)
call s:HL('ContrasticOrangeBold', s:orange, s:none, s:bold)


call s:HL('ContrasticNeutralRed',        s:cp.neutral_red)
call s:HL('ContrasticNeutralRedBold',    s:cp.neutral_red, s:none, s:bold)
call s:HL('ContrasticNeutralGreen',      s:cp.neutral_green)
call s:HL('ContrasticNeutralGreenBold',  s:cp.neutral_green, s:none, s:bold)
call s:HL('ContrasticNeutralYellow',     s:cp.neutral_yellow)
call s:HL('ContrasticNeutralYellowBold', s:cp.neutral_yellow, s:none, s:bold)
call s:HL('ContrasticNeutralBlue',       s:cp.neutral_blue)
call s:HL('ContrasticNeutralBlueBold',   s:cp.neutral_blue, s:none, s:bold)
call s:HL('ContrasticNeutralPurple',     s:cp.neutral_purple)
call s:HL('ContrasticNeutralPurpleBold', s:cp.neutral_purple, s:none, s:bold)
call s:HL('ContrasticNeutralAqua',       s:cp.neutral_aqua)
call s:HL('ContrasticNeutralAquaBold',   s:cp.neutral_aqua, s:none, s:bold)
call s:HL('ContrasticNeutralOrange',     s:cp.neutral_orange)
call s:HL('ContrasticNeutralOrangeBold', s:cp.neutral_orange, s:none, s:bold)

call s:HL('ContrasticRedSign',    s:red,    s:sign_column, s:invert_signs)
call s:HL('ContrasticGreenSign',  s:green,  s:sign_column, s:invert_signs)
call s:HL('ContrasticYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('ContrasticBlueSign',   s:blue,   s:sign_column, s:invert_signs)
call s:HL('ContrasticPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('ContrasticAquaSign',   s:aqua,   s:sign_column, s:invert_signs)
call s:HL('ContrasticOrangeSign', s:orange, s:sign_column, s:invert_signs)

call s:HL('ContrasticBrightNeutralBlue', s:cp.bright_neutral_blue)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
" call s:HL('Normal', s:fg1, s:bg0)
call s:HL('Normal', s:fg4, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/gruvbox/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText ContrasticBg2
hi! link SpecialKey ContrasticBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory ContrasticGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title ContrasticGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg ContrasticYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg ContrasticYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question ContrasticOrangeBold
" Warning messages
hi! link WarningMsg ContrasticRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:orange, s:bg2, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement ContrasticRed
" if, then, else, endif, swicth, etc.
hi! link Conditional ContrasticRed
" for, do, while, etc.
hi! link Repeat ContrasticRed
" case, default, etc.
hi! link Label ContrasticRed
" try, catch, throw
hi! link Exception ContrasticRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword ContrasticRed

" Variable name
if s:is_dark
  hi! link Identifier ContrasticBrightNeutralBlue
else
  hi! link Identifier ContrasticFg0
endif
" Function name
hi! link Function ContrasticGreenBold

" Generic preprocessor
hi! link PreProc ContrasticBlue
" Preprocessor #include
hi! link Include ContrasticBlue
" Preprocessor #define
hi! link Define ContrasticBlue
" Same as Define
hi! link Macro ContrasticBlueBold
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit ContrasticBlue

" Generic constant
hi! link Constant ContrasticNeutralPurpleBold
" Character constant: 'c', '/n'
hi! link Character ContrasticPurple
" String constant: "this is a string"
" call s:HL('String',  s:green, s:none, s:italicize_strings)
call s:HL('String',  s:cp.neutral_green, s:none, s:italicize_strings)
" Boolean constant: TRUE, false
hi! link Boolean ContrasticPurpleBold
" Number constant: 234, 0xff
hi! link Number ContrasticPurple
" Floating point constant: 2.3e10
hi! link Float ContrasticPurple

" Generic type
hi! link Type ContrasticYellow
" static, register, volatile, etc
hi! link StorageClass ContrasticOrange
" struct, union, enum, etc.
hi! link Structure ContrasticAqua
" typedef
hi! link Typedef ContrasticYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:contrastic_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}
" Trailing whitespaces: {{{

hi def link ContrasticExtraWhitespaces Error
match ContrasticExtraWhitespaces /\s\+$/

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:contrastic_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd ContrasticGreenSign
hi! link GitGutterChange ContrasticAquaSign
hi! link GitGutterDelete ContrasticRedSign
hi! link GitGutterChangeDelete ContrasticAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile ContrasticGreen
hi! link gitcommitDiscardedFile ContrasticRed

" }}}
" Signify: {{{

hi! link SignifySignAdd ContrasticGreenSign
hi! link SignifySignChange ContrasticAquaSign
hi! link SignifySignDelete ContrasticRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign ContrasticRedSign
hi! link SyntasticWarningSign ContrasticYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   ContrasticBlueSign
hi! link SignatureMarkerText ContrasticPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl ContrasticBlueSign
hi! link ShowMarksHLu ContrasticBlueSign
hi! link ShowMarksHLo ContrasticBlueSign
hi! link ShowMarksHLm ContrasticBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch ContrasticYellow
hi! link CtrlPNoEntries ContrasticRed
hi! link CtrlPPrtBase ContrasticBg2
hi! link CtrlPPrtCursor ContrasticBlue
hi! link CtrlPLinePre ContrasticBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket ContrasticFg3
hi! link StartifyFile ContrasticFg1
hi! link StartifyNumber ContrasticBlue
hi! link StartifyPath ContrasticGray
hi! link StartifySlash ContrasticGray
hi! link StartifySection ContrasticYellow
hi! link StartifySpecial ContrasticBg2
hi! link StartifyHeader ContrasticOrange
hi! link StartifyFooter ContrasticBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign ContrasticRedSign
hi! link ALEWarningSign ContrasticYellowSign
hi! link ALEInfoSign ContrasticBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail ContrasticAqua
hi! link DirvishArg ContrasticYellow

" }}}
" Netrw: {{{

hi! link netrwDir ContrasticAqua
hi! link netrwClassify ContrasticAqua
hi! link netrwLink ContrasticGray
hi! link netrwSymLink ContrasticFg1
hi! link netrwExe ContrasticYellow
hi! link netrwComment ContrasticGray
hi! link netrwList ContrasticBlue
hi! link netrwHelpCmd ContrasticAqua
hi! link netrwCmdSep ContrasticFg3
hi! link netrwVersion ContrasticGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir ContrasticAqua
hi! link NERDTreeDirSlash ContrasticAqua

hi! link NERDTreeOpenable ContrasticOrange
hi! link NERDTreeClosable ContrasticOrange

hi! link NERDTreeFile ContrasticFg1
hi! link NERDTreeExecFile ContrasticYellow

hi! link NERDTreeUp ContrasticGray
hi! link NERDTreeCWD ContrasticGreen
hi! link NERDTreeHelp ContrasticFg1

hi! link NERDTreeToggleOn ContrasticGreen
hi! link NERDTreeToggleOff ContrasticRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign ContrasticRedSign
hi! link CocWarningSign ContrasticOrangeSign
hi! link CocInfoSign ContrasticYellowSign
hi! link CocHintSign ContrasticBlueSign
hi! link CocErrorFloat ContrasticRed
hi! link CocWarningFloat ContrasticOrange
hi! link CocInfoFloat ContrasticYellow
hi! link CocHintFloat ContrasticBlue
hi! link CocDiagnosticsError ContrasticRed
hi! link CocDiagnosticsWarning ContrasticOrange
hi! link CocDiagnosticsInfo ContrasticYellow
hi! link CocDiagnosticsHint ContrasticBlue

hi! link CocSelectedText ContrasticRed
hi! link CocCodeLens ContrasticGray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}
"  vim-lsp-cxx-highlight: {{{

hi! link LspCxxHlSkippedRegion cComment
hi! link LspCxxHlSkippedRegionBeginEnd Normal

hi! link LspCxxHlGroupEnumConstant ContrasticNeutralPurpleBold
hi! link LspCxxHlGroupNamespace    ContrasticPurpleBold

hi! link LspCxxHlGroupVariable       cIdentifier
hi! link LspCxxHlGroupMemberVariable cIdentifier

hi! link LspCxxHlSymUnknown Normal

" Type
hi! link LspCxxHlSymClass         cType
hi! link LspCxxHlSymStruct        cType
hi! link LspCxxHlSymEnum          cType
hi! link LspCxxHlSymTypeAlias     cType
hi! link LspCxxHlSymTypeParameter cType

" Function
hi! link LspCxxHlSymFunction     cFunction
hi! link LspCxxHlSymMethod       cFunction
hi! link LspCxxHlSymStaticMethod cFunction
hi! link LspCxxHlSymConstructor  cFunction

" EnumConstant
hi! link LspCxxHlSymEnumMember LspCxxHlGroupEnumConstant

" Preprocessor
hi! link LspCxxHlSymMacro cMacro

" Namespace
hi! link LspCxxHlSymNamespace LspCxxHlGroupNamespace

" Variables
hi! link LspCxxHlSymField         LspCxxHlGroupMemberVariable
hi! link LspCxxHlSymParameter     LspCxxHlGroupVariable
hi! link LspCxxHlSymVariable      LspCxxHlGroupVariable
hi! link LspCxxHlSymLocalVariable LspCxxHlGroupVariable

" clangd-only groups
" A static member variable
hi! link LspCxxHlSymUnknownStaticField LspCxxHlGroupMemberVariable
" Seems to be when a type alias refers to a primitive
hi! link LspCxxHlSymPrimitive cType
" Equivalent to TypeAlias
hi! link LspCxxHlSymTypedef cType
" Equivalent to TypeParameter
hi! link LspCxxHlSymTemplateParameter cType
" Equivalent to EnumMember
hi! link LspCxxHlSymEnumConstant LspCxxHlGroupEnumConstant
" A type dependent on a template
" E.g. T::A, A would be a dependent type
hi! link LspCxxHlSymDependentType cType
" A name dependent on a template, usually a function but can also be a variable?
hi! link LspCxxHlSymDependentName cFunction
" C++20 concepts, maybe type is sufficient for now...
hi! link LspCxxHlSymConcept cType

"  }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded ContrasticGreen
hi! link diffRemoved ContrasticRed
hi! link diffChanged ContrasticAqua

hi! link diffFile ContrasticOrange
hi! link diffNewFile ContrasticYellow

hi! link diffLine ContrasticBlue

" }}}
" Html: {{{

hi! link htmlTag ContrasticBlue
hi! link htmlEndTag ContrasticBlue

hi! link htmlTagName ContrasticAquaBold
hi! link htmlArg ContrasticAqua

hi! link htmlScriptTag ContrasticPurple
hi! link htmlTagN ContrasticFg1
hi! link htmlSpecialTagName ContrasticAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar ContrasticOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag ContrasticBlue
hi! link xmlEndTag ContrasticBlue
hi! link xmlTagName ContrasticBlue
hi! link xmlEqual ContrasticBlue
hi! link docbkKeyword ContrasticAquaBold

hi! link xmlDocTypeDecl ContrasticGray
hi! link xmlDocTypeKeyword ContrasticPurple
hi! link xmlCdataStart ContrasticGray
hi! link xmlCdataCdata ContrasticPurple
hi! link dtdFunction ContrasticGray
hi! link dtdTagName ContrasticPurple

hi! link xmlAttrib ContrasticAqua
hi! link xmlProcessingDelim ContrasticGray
hi! link dtdParamEntityPunct ContrasticGray
hi! link dtdParamEntityDPunct ContrasticGray
hi! link xmlAttribPunct ContrasticGray

hi! link xmlEntity ContrasticOrange
hi! link xmlEntityPunct ContrasticOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation ContrasticOrange
hi! link vimBracket ContrasticOrange
hi! link vimMapModKey ContrasticOrange
hi! link vimFuncSID ContrasticFg3
hi! link vimSetSep ContrasticFg3
hi! link vimSep ContrasticFg3
hi! link vimContinue ContrasticFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword ContrasticBlue
hi! link clojureCond ContrasticOrange
hi! link clojureSpecial ContrasticOrange
hi! link clojureDefine ContrasticOrange

hi! link clojureFunc ContrasticYellow
hi! link clojureRepeat ContrasticYellow
hi! link clojureCharacter ContrasticAqua
hi! link clojureStringEscape ContrasticAqua
hi! link clojureException ContrasticRed

hi! link clojureRegexp ContrasticAqua
hi! link clojureRegexpEscape ContrasticAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen ContrasticFg3
hi! link clojureAnonArg ContrasticYellow
hi! link clojureVariable ContrasticBlue
hi! link clojureMacro ContrasticOrange

hi! link clojureMeta ContrasticYellow
hi! link clojureDeref ContrasticYellow
hi! link clojureQuote ContrasticYellow
hi! link clojureUnquote ContrasticYellow

" }}}
" C: {{{

hi! link cFunction  ContrasticGreenBold
hi! link cIncluded  ContrasticNeutralAquaBold
hi! link cMacro     ContrasticBlueBold
hi! link cOperator  ContrasticPurple
hi! link cStructure ContrasticOrange

" }}}
" Python: {{{

hi! link pythonBuiltin ContrasticOrange
hi! link pythonBuiltinObj ContrasticOrange
hi! link pythonBuiltinFunc ContrasticOrange
hi! link pythonFunction ContrasticAqua
hi! link pythonDecorator ContrasticRed
hi! link pythonInclude ContrasticBlue
hi! link pythonImport ContrasticBlue
hi! link pythonRun ContrasticBlue
hi! link pythonCoding ContrasticBlue
hi! link pythonOperator ContrasticRed
hi! link pythonException ContrasticRed
hi! link pythonExceptions ContrasticPurple
hi! link pythonBoolean ContrasticPurple
hi! link pythonDot ContrasticFg3
hi! link pythonConditional ContrasticRed
hi! link pythonRepeat ContrasticRed
hi! link pythonDottedName ContrasticGreenBold

" }}}
" CSS: {{{

hi! link cssBraces ContrasticBlue
hi! link cssFunctionName ContrasticYellow
hi! link cssIdentifier ContrasticOrange
hi! link cssClassName ContrasticGreen
hi! link cssColor ContrasticBlue
hi! link cssSelectorOp ContrasticBlue
hi! link cssSelectorOp2 ContrasticBlue
hi! link cssImportant ContrasticGreen
hi! link cssVendor ContrasticFg1

hi! link cssTextProp ContrasticAqua
hi! link cssAnimationProp ContrasticAqua
hi! link cssUIProp ContrasticYellow
hi! link cssTransformProp ContrasticAqua
hi! link cssTransitionProp ContrasticAqua
hi! link cssPrintProp ContrasticAqua
hi! link cssPositioningProp ContrasticYellow
hi! link cssBoxProp ContrasticAqua
hi! link cssFontDescriptorProp ContrasticAqua
hi! link cssFlexibleBoxProp ContrasticAqua
hi! link cssBorderOutlineProp ContrasticAqua
hi! link cssBackgroundProp ContrasticAqua
hi! link cssMarginProp ContrasticAqua
hi! link cssListProp ContrasticAqua
hi! link cssTableProp ContrasticAqua
hi! link cssFontProp ContrasticAqua
hi! link cssPaddingProp ContrasticAqua
hi! link cssDimensionProp ContrasticAqua
hi! link cssRenderProp ContrasticAqua
hi! link cssColorProp ContrasticAqua
hi! link cssGeneratedContentProp ContrasticAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces ContrasticFg1
hi! link javaScriptFunction ContrasticAqua
hi! link javaScriptIdentifier ContrasticRed
hi! link javaScriptMember ContrasticBlue
hi! link javaScriptNumber ContrasticPurple
hi! link javaScriptNull ContrasticPurple
hi! link javaScriptParens ContrasticFg3

" }}}
" YAJS: {{{

hi! link javascriptImport ContrasticAqua
hi! link javascriptExport ContrasticAqua
hi! link javascriptClassKeyword ContrasticAqua
hi! link javascriptClassExtends ContrasticAqua
hi! link javascriptDefault ContrasticAqua

hi! link javascriptClassName ContrasticYellow
hi! link javascriptClassSuperName ContrasticYellow
hi! link javascriptGlobal ContrasticYellow

hi! link javascriptEndColons ContrasticFg1
hi! link javascriptFuncArg ContrasticFg1
hi! link javascriptGlobalMethod ContrasticFg1
hi! link javascriptNodeGlobal ContrasticFg1
hi! link javascriptBOMWindowProp ContrasticFg1
hi! link javascriptArrayMethod ContrasticFg1
hi! link javascriptArrayStaticMethod ContrasticFg1
hi! link javascriptCacheMethod ContrasticFg1
hi! link javascriptDateMethod ContrasticFg1
hi! link javascriptMathStaticMethod ContrasticFg1

" hi! link javascriptProp ContrasticFg1
hi! link javascriptURLUtilsProp ContrasticFg1
hi! link javascriptBOMNavigatorProp ContrasticFg1
hi! link javascriptDOMDocMethod ContrasticFg1
hi! link javascriptDOMDocProp ContrasticFg1
hi! link javascriptBOMLocationMethod ContrasticFg1
hi! link javascriptBOMWindowMethod ContrasticFg1
hi! link javascriptStringMethod ContrasticFg1

hi! link javascriptVariable ContrasticOrange
" hi! link javascriptVariable ContrasticRed
" hi! link javascriptIdentifier ContrasticOrange
" hi! link javascriptClassSuper ContrasticOrange
hi! link javascriptIdentifier ContrasticOrange
hi! link javascriptClassSuper ContrasticOrange

" hi! link javascriptFuncKeyword ContrasticOrange
" hi! link javascriptAsyncFunc ContrasticOrange
hi! link javascriptFuncKeyword ContrasticAqua
hi! link javascriptAsyncFunc ContrasticAqua
hi! link javascriptClassStatic ContrasticOrange

hi! link javascriptOperator ContrasticRed
hi! link javascriptForOperator ContrasticRed
hi! link javascriptYield ContrasticRed
hi! link javascriptExceptions ContrasticRed
hi! link javascriptMessage ContrasticRed

hi! link javascriptTemplateSB ContrasticAqua
hi! link javascriptTemplateSubstitution ContrasticFg1

" hi! link javascriptLabel ContrasticBlue
" hi! link javascriptObjectLabel ContrasticBlue
" hi! link javascriptPropertyName ContrasticBlue
hi! link javascriptLabel ContrasticFg1
hi! link javascriptObjectLabel ContrasticFg1
hi! link javascriptPropertyName ContrasticFg1

hi! link javascriptLogicSymbols ContrasticFg1
hi! link javascriptArrowFunc ContrasticYellow

hi! link javascriptDocParamName ContrasticFg4
hi! link javascriptDocTags ContrasticFg4
hi! link javascriptDocNotation ContrasticFg4
hi! link javascriptDocParamType ContrasticFg4
hi! link javascriptDocNamedParamType ContrasticFg4

hi! link javascriptBrackets ContrasticFg1
hi! link javascriptDOMElemAttrs ContrasticFg1
hi! link javascriptDOMEventMethod ContrasticFg1
hi! link javascriptDOMNodeMethod ContrasticFg1
hi! link javascriptDOMStorageMethod ContrasticFg1
hi! link javascriptHeadersMethod ContrasticFg1

hi! link javascriptAsyncFuncKeyword ContrasticRed
hi! link javascriptAwaitFuncKeyword ContrasticRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword ContrasticAqua
hi! link jsExtendsKeyword ContrasticAqua
hi! link jsExportDefault ContrasticAqua
hi! link jsTemplateBraces ContrasticAqua
hi! link jsGlobalNodeObjects ContrasticFg1
hi! link jsGlobalObjects ContrasticFg1
hi! link jsFunction ContrasticAqua
hi! link jsFuncParens ContrasticFg3
hi! link jsParens ContrasticFg3
hi! link jsNull ContrasticPurple
hi! link jsUndefined ContrasticPurple
hi! link jsClassDefinition ContrasticYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved ContrasticAqua
hi! link typeScriptLabel ContrasticAqua
hi! link typeScriptFuncKeyword ContrasticAqua
hi! link typeScriptIdentifier ContrasticOrange
hi! link typeScriptBraces ContrasticFg1
hi! link typeScriptEndColons ContrasticFg1
hi! link typeScriptDOMObjects ContrasticFg1
hi! link typeScriptAjaxMethods ContrasticFg1
hi! link typeScriptLogicSymbols ContrasticFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects ContrasticFg1
hi! link typeScriptParens ContrasticFg3
hi! link typeScriptOpSymbols ContrasticFg3
hi! link typeScriptHtmlElemProperties ContrasticFg1
hi! link typeScriptNull ContrasticPurple
hi! link typeScriptInterpolationDelimiter ContrasticAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword ContrasticAqua
hi! link purescriptModuleName ContrasticFg1
hi! link purescriptWhere ContrasticAqua
hi! link purescriptDelimiter ContrasticFg4
hi! link purescriptType ContrasticFg1
hi! link purescriptImportKeyword ContrasticAqua
hi! link purescriptHidingKeyword ContrasticAqua
hi! link purescriptAsKeyword ContrasticAqua
hi! link purescriptStructure ContrasticAqua
hi! link purescriptOperator ContrasticBlue

hi! link purescriptTypeVar ContrasticFg1
hi! link purescriptConstructor ContrasticFg1
hi! link purescriptFunction ContrasticFg1
hi! link purescriptConditional ContrasticOrange
hi! link purescriptBacktick ContrasticOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp ContrasticFg3
hi! link coffeeSpecialOp ContrasticFg3
hi! link coffeeCurly ContrasticOrange
hi! link coffeeParen ContrasticFg3
hi! link coffeeBracket ContrasticOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter ContrasticGreen
hi! link rubyInterpolationDelimiter ContrasticAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier ContrasticRed
hi! link objcDirective ContrasticBlue

" }}}
" Go: {{{

hi! link goDirective ContrasticAqua
hi! link goConstants ContrasticPurple
hi! link goDeclaration ContrasticRed
hi! link goDeclType ContrasticBlue
hi! link goBuiltins ContrasticOrange

" }}}
" Lua: {{{

hi! link luaIn ContrasticRed
hi! link luaFunction ContrasticAqua
hi! link luaTable ContrasticOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp ContrasticFg3
hi! link moonExtendedOp ContrasticFg3
hi! link moonFunction ContrasticFg3
hi! link moonObject ContrasticYellow

" }}}
" Java: {{{

hi! link javaAnnotation ContrasticBlue
hi! link javaDocTags ContrasticAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen ContrasticFg3
hi! link javaParen1 ContrasticFg3
hi! link javaParen2 ContrasticFg3
hi! link javaParen3 ContrasticFg3
hi! link javaParen4 ContrasticFg3
hi! link javaParen5 ContrasticFg3
hi! link javaOperator ContrasticOrange

hi! link javaVarArg ContrasticGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter ContrasticGreen
hi! link elixirInterpolationDelimiter ContrasticAqua

hi! link elixirModuleDeclaration ContrasticYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition ContrasticFg1
hi! link scalaCaseFollowing ContrasticFg1
hi! link scalaCapitalWord ContrasticFg1
hi! link scalaTypeExtension ContrasticFg1

hi! link scalaKeyword ContrasticRed
hi! link scalaKeywordModifier ContrasticRed

hi! link scalaSpecial ContrasticAqua
hi! link scalaOperator ContrasticFg1

hi! link scalaTypeDeclaration ContrasticYellow
hi! link scalaTypeTypePostDeclaration ContrasticYellow

hi! link scalaInstanceDeclaration ContrasticFg1
hi! link scalaInterpolation ContrasticAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 ContrasticGreenBold
hi! link markdownH2 ContrasticGreenBold
hi! link markdownH3 ContrasticYellowBold
hi! link markdownH4 ContrasticYellowBold
hi! link markdownH5 ContrasticYellow
hi! link markdownH6 ContrasticYellow

hi! link markdownCode ContrasticAqua
hi! link markdownCodeBlock ContrasticAqua
hi! link markdownCodeDelimiter ContrasticAqua

hi! link markdownBlockquote ContrasticGray
hi! link markdownListMarker ContrasticGray
hi! link markdownOrderedListMarker ContrasticGray
hi! link markdownRule ContrasticGray
hi! link markdownHeadingRule ContrasticGray

hi! link markdownUrlDelimiter ContrasticFg3
hi! link markdownLinkDelimiter ContrasticFg3
hi! link markdownLinkTextDelimiter ContrasticFg3

hi! link markdownHeadingDelimiter ContrasticOrange
hi! link markdownUrl ContrasticPurple
hi! link markdownUrlTitleDelimiter ContrasticGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType ContrasticYellow
" hi! link haskellOperators ContrasticOrange
" hi! link haskellConditional ContrasticAqua
" hi! link haskellLet ContrasticOrange
"
hi! link haskellType ContrasticFg1
hi! link haskellIdentifier ContrasticFg1
hi! link haskellSeparator ContrasticFg1
hi! link haskellDelimiter ContrasticFg4
hi! link haskellOperators ContrasticBlue
"
hi! link haskellBacktick ContrasticOrange
hi! link haskellStatement ContrasticOrange
hi! link haskellConditional ContrasticOrange

hi! link haskellLet ContrasticAqua
hi! link haskellDefault ContrasticAqua
hi! link haskellWhere ContrasticAqua
hi! link haskellBottom ContrasticAqua
hi! link haskellBlockKeywords ContrasticAqua
hi! link haskellImportKeywords ContrasticAqua
hi! link haskellDeclKeyword ContrasticAqua
hi! link haskellDeriving ContrasticAqua
hi! link haskellAssocType ContrasticAqua

hi! link haskellNumber ContrasticPurple
hi! link haskellPragma ContrasticPurple

hi! link haskellString ContrasticGreen
hi! link haskellChar ContrasticGreen

" }}}
" Json: {{{

hi! link jsonKeyword ContrasticGreen
hi! link jsonQuote ContrasticGreen
hi! link jsonBraces ContrasticFg1
hi! link jsonString ContrasticFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! ContrasticHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! ContrasticHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
