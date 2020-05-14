" zelhar 2009-06-19 17:54:45 
" /~./.gvimrc

"set ch=2		" Make command line two lines high

"set mousehide		" Hide the mouse when typing text

" cursor
"set cursorline
"set guicursor=
"	\n:block-Cursor-Error/lCursor-blinkwait0,
"	\c:block-Error/lCursor,
"	\o:hor50-Error,
"	\i-ci-v:block-Cursor/lCursor,
"	\r-cr:hor50-Cursor/lCursor,
"	\sm:block-Cursor

set guicursor=
	  \n:block-Cursor/lCursor-blinkwait0,
      \v-c:block-Cursor/lCursor,
      \ve:ver35-Cursor,
      \o:hor50-Cursor,
      \i-ci:ver25-Cursor/lCursor-blinkwait600-blinkon600-blinkoff400,
      \r-cr:hor20-Cursor/lCursor,
      \sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
      "\a:blinkwait500-blinkoff500-blinkon500
      "\i-ci:ver25-Cursor/lCursor-blinkwait300-blinkon200-blinkoff150,
      "\i-ci:ver25-Cursor/lCursor,



"Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
    syntax on
endif

"highlight column after 'textwidth'
"set cc+=1
"OR since it seems not to work in startup
"set cc=81

"set guifont=Dejavu\ Sans\ Mono\ 10
set guifont=Monospace\ 10
"set guifont=Inconsolata-dz\ 10 

set encoding=utf-8

colorscheme darkblue
set background=dark

"The following code maps the key combination Ctrl-Alt-m to toggle the menu and 
"toolbar in Gvim. You can add it to your vimrc file if you want this 
"functionality.
map <silent> <C-M-m> :if &guioptions =~# 'm' <Bar>
                        \set guioptions-=m <bar>
                   \else <Bar>
                        \set guioptions+=m <Bar>
                    \endif<CR>

map <silent> <C-M-t> :if &guioptions =~# 'T' <Bar>
                        \set guioptions-=T <Bar>
                   \else <Bar>
                        \set guioptions+=T <Bar>
                    \endif<CR>

" key-combination to move to next/previous buffer (<C-l> same as redraw!)
"nnoremap <C-Tab> :bn<CR><C-l>
"nnoremap <C-S-Tab> :bp<CR>
"alternate between two last buffers
"nnoremap <C-a>     :b#<CR> 

"To remove the menu completely:
set guioptions-=m
"To remove the toolbar completely:
set guioptions-=T
"disable left scrollbar from automatic appearing.
set guioptions-=L
"disable right scrollbar from appearing.
set guioptions-=r

" Vim Latex Suite Settings:
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
" filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"End of Vim Latex Suite Settings

"set gui head room to 0 (default is 50)
set ghr=0

function ToggleSolarizedCursorZelhar()
    if g:colors_name == 'solarized'
       execute 'set gcr+=n:block-Cursor-ErrorMsg/lCursor'
       execute 'set gcr+=c:block-ErrorMsg/lCursor'
       execute 'set gcr+=o:hor50-ErrorMsg'
    else
       execute 'set gcr-=n:block-Cursor-ErrorMsg/lCursor'
       execute 'set gcr-=c:block-ErrorMsg/lCursor'
       execute 'set gcr-=o:hor50-ErrorMsg'
    endif
endfunction

function ToggleFullScreen()
    execute '!wmctrl -r :ACTIVE: toggle,fullscreen'
endfunction

command ToggleFullScreen call system("wmctrl -r :ACTIVE: -b toggle,fullscreen") 

nnoremap <F11> <Esc>:ToggleFullScreen<Enter>
inoremap <F11> <Esc>:ToggleFullScreen<Enter>

autocmd ColorScheme * :call ToggleSolarizedCursorZelhar() 
"disable my autobackup plugin
"let g:toggle_zelhar_backup = 0
TurnOffZelharBackup

"turn off annoying bell bip
set visualbell
