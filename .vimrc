" /~/.vimrc
set nocompatible
" Remove ALL autocommands for the current group:
autocmd!
"------- START Plug manager instead of Vundle
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
"Plug 'Townk/vim-autoclose'
"Plug 'dhruvasagar/vim-table-mode'
"Plug 'godlygeek/tabular'
"Plug 'vim-scripts/TextFormat'
"Color Themes
Plug 'Rsidhoum/bushfire'
Plug 'crusoexia/vim-monokai'
Plug 'robertmeta/nofrils'
Plug 'andreypopp/vim-colors-plain'
Plug 'pbrisbin/vim-colors-off'
Plug 'vietjtnguyen/toy-blocks'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
"Plug 'rafi/awesome-vim-colorschemes'

"Plugins I am testing to see if they are worth using
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf'
Plug 'mileszs/ack.vim'
"Plug 'mcchrish/nnn.vim'
" Track the engine.
"""""Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"""""Plug 'honza/vim-snippets'

"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
"Plug 'dzhou121/gonvim-fuzzy' "recommended by gonvim
"Plug 'equalsraf/neovim-gui-shim' "for gonvim
Plug 'vim-scripts/loremipsum'
"Plug 'echuraev/translate-shell.vim'
"Plug 'jpalardy/vim-slime'
"Plug 'ron89/thesaurus_query.vim'

Plug 'justmao945/vim-clang'
Plug 'jalvesaq/Nvim-R'
Plug 'vim-pandoc/vim-pandoc-syntax'
"""Plug 'christoomey/vim-tmux-runner'

"interactive python and other REPL
"Plug 'williamjameshandley/vimteractive'
"Plug 'sillybun/vim-repl'
"""Plug 'kassio/neoterm'

"Python plugins
"deoplete
"""if has('nvim')
"""  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"""else
"""  Plug 'Shougo/deoplete.nvim'
"""  Plug 'roxma/nvim-yarp'
"""  Plug 'roxma/vim-hug-neovim-rpc'
"""endif
"""let g:deoplete#enable_at_startup = 0
"""Plug 'deoplete-plugins/deoplete-jedi'
""""python formatter
Plug 'psf/black'

"haskell plugins
"Plug 'parsonsmatt/intero-neovim'
Plug 'Twinside/vim-hoogle' "haskell hoogle plgin
Plug 'neovimhaskell/haskell-vim' "syntax highlighter
Plug 'neoclide/coc.nvim', {'branch': 'release'} "not just haskell.

"" Initialize plugin system
call plug#end()
"------- END Plug manager instead of Vundle

"make sure it stays on even if I delete Vundle or Neobunlde et al.
filetype plugin indent on

"Switch on syntax highlighting if it wasn't on yet.
"filetype plugin indent on
if !exists("syntax_on")
    syntax on
endif

set nocompatible
"make backspace function like normal apps in insert mode
set backspace=indent,eol,start

"set t_Co=256
if !(&term =~ "rxvt")
    set t_8f=[38;2;%lu;%lu;%lum        " set foreground color
    set t_8b=[48;2;%lu;%lu;%lum        " set background color
    set t_Co=256
    set termguicolors
else
    set t_Co=256
    set notermguicolors
endif
"for solarized, base16 color themes and others
"let g:solarized_termcolors=256
"let base16colorspace=256
set textwidth=68
set background=dark
if !has("gui_running")
     "colorscheme solarized
     "colorscheme molokai
     "colorscheme zelhar-molokai
     "colorscheme zelhar-molokai-italic
     "colorscheme jellybeans
     colorscheme zelhar-darkblue
     "colorscheme bushfire
endif

"bracket highlight (that's on by default):
"set matchpairs=(:),{:},[:]

" Function that highlights text passing textwidth. Toggle with '\l'
noremap <silent> <Leader>l
      \ :if exists('w:long_line_match') <Bar>
      \   silent! call matchdelete(w:long_line_match) <Bar>
      \   unlet w:long_line_match <Bar>
      \ elseif &textwidth > 0 <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
      \ else <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
      \ endif<CR>

set expandtab
set smarttab
set softtabstop=4
set tabstop=4
set nu!
set shiftwidth=4

set spelllang=en,de,es,he
set nospell

" Read changes to file made by other applications
set autoread

"turn on auto-smart-indent
set autoindent
set smartindent


" Tell vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
"set listchars=eol:¶,tab:>»,trail:·
"set listchars=eol:¬,tab:>»,trail:·
"set listchars=eol:$,tab:>-,trail:-
scriptencoding utf-8
if has("gui_running")
    set listchars=eol:¶,tab:>»,trail:·
"    set listchars=eol:¬,tab:>»,trail:·
else
"    set listchars=eol:$,tab:>-,trail:-
"    set listchars=eol:¶,tab:>»,trail:·
    set listchars=eol:¬,tab:>»,trail:·
endif

" Show whitespace
"set list

" status line (cooment out if put in .vimrc)
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ 
"\[HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ 
            \[POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
"now setting up tabline
"set tabline=[%n]%f%m%r%h%w%y
set showtabline=2

"These motions don't work when I use font-size plugin for urxvt.
nnoremap <C-Down> j<C-e>
nnoremap <C-Up> k<C-y>
vnoremap <C-Down> <Down><C-e>
vnoremap <C-Up> <Up><C-y>
inoremap <C-Down> <C-X><C-e><Down>
inoremap <C-Up> <C-X><C-y><Up>

"scroll half screnn up/down with Alt-Up Alt-Down
nnoremap <A-Down> <C-d>
nnoremap <A-Up> <C-u>
vnoremap <A-Down> <C-d>
vnoremap <A-Up> <C-u>
inoremap <A-Down> <C-d>
inoremap <A-Up> <C-u>

" key-combination to move to next/previous buffer and tab (<C-l> same as redraw!)
nnoremap <Leader>] :bn<CR>
nnoremap <Leader>[ :bp<CR>
nnoremap <Tab> :tabnext<Cr>
nnoremap <C-Tab> :tabnext<Cr>
nnoremap <S-Tab> :tabprevious<Cr>
tnoremap <C-Tab> <C-\><C-n>:tabnext<Cr>

"splits the line after cursor and remain in normal mode
nnoremap <Leader><Enter> o<Esc>
nnoremap <M-Enter> i<Enter><Esc>

"Compile a Latex File with xelatex
nnoremap <Leader>xe :!xelatex -synctex=1 -interaction=nonstopmode -shell-escape

"wraps selected text in ()
vnoremap <Leader>0 di()<Esc>hpe

"toggle Nerdtree
nnoremap <Leader>nt :NERDTreeToggle<CR>

"maps qq to <Esc>
"noremap qq <Esc>
"don't use this key combination for command line because it executes!
"inoremap qq <Esc>
"make esc work as expected in neovim terminal:
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"highlight all matches to search results
set hlsearch
" highlight match while still typing search pattern
set incsearch
" make default search ignore case
set ignorecase

"set viminfo like creams
"set viminfo='1000,f1,\"100,%,!,h,<500,:100,/100,s10
set viminfo='50,f1,\"100,h,<500,:100,/100,@100,s10
"set viminfo='0,:0,<0,@0,f0
set sessionoptions=blank,buffers,curdir,folds,slash,unix,tabpages
"set sessionoptions=blank,buffers,curdir,folds,help,resize,slash,unix,winpos,winsize
"set sessionoptions=buffers,winpos,resize,slash,tabpages,unix
"Keep tesing what causes to save argadd and so unwanted buffers. If for some
"reason :args returns nonempty list, clear it with :argdel *
" Auto Load session for terminal/console vim 
"if has("gui_running")
"    autocmd VimEnter * nested call LoadSession()
"    autocmd VimLeave * call SaveSession()
"else
"    autocmd VimEnter * call LoadTermSession()
"    autocmd VimLeave * call SaveTermSession()
"endif

function! SaveTermSession()
    execute 'argdel *'
    execute 'mksession! $HOME/termsession.vim'
endfunction

function LoadTermSession()
    if argc() == 0
        execute 'source $HOME/termsession.vim'
        execute 'filetype detect'
    endif
endfunction

function! SaveSession()
    execute 'argdel *'
    execute 'mksession! $HOME/session.vim'
endfunction

function LoadSession()
    if argc() == 0
        execute 'source $HOME/session.vim'
        execute 'filetype detect'
    endif
endfunction
"auto save/load view for some reason it caused me problems when set on!
"autocmd BufWinLeave * mkview
"autocmd BufWinEnter * silent loadview
au BufNewFile,BufRead *.hs setlocal nospell
"Create a sort of time stamp abbreviation:
iabbrev &date! <Esc>:r !date +\%F\ \%R\ \%a\ \%Z\%z<Enter>$a
" doesn't work with the formate, but :r !date works.
"disable folds:
"set nofoldenable

"Make vim save backup of the files: 
set backup
set backupcopy=auto
"And save in the first folder it can of the following:
"set backupdir=/run/media/zelhar/JetFlash16/backupvimtexts,~/tmp,~/temp,.,~/
"set backupdir=~/tmp,.,~/
set backupdir=/run/media/zelhar/yjk-16g-msd/backupvimtexts/,
            \/run/media/zelhar/yjk-B16gb/backupvimtexts,
            \/run/media/zelhar/UF16/backupvimtexts,
            \/run/media/zelhar/JetFlash16/backupvimtexts,~/tmp,~/temp,.,~/,
            \/media/JetFlash16
"add a dictionary file for word completion:
"let g:symbols_file = "/$HOME/dictionaries/symbols"
set dictionary+=/$HOME/dictionaries/symbols
set dictionary+=/$HOME/dictionaries/chemical_formulas.txt
set dictionary+=/usr/share/dict/american
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/ngerman
set dictionary+=/usr/share/dict/spanish
"make autocomplete with ctrl-n search in the also in the dictionary
set complete+=k
set completeopt=menuone,preview,longest

"Set (locally) working dir to be the same as the file being edited in the buffer
autocmd BufEnter * silent! lcd %:p:h
"redraw screen when switching buffer, and returning to window (cleans garbage)  
autocmd BufEnter * :redraw!
autocmd FocusGained * :redraw! 
autocmd WinEnter * :filetype detect
"autocmd BufEnter * :filetype detect

"Testing Konsole cursor shape:
if (&term =~ "screen-256color" || &term=~"tmux-256")
    if $ISKONSOLE
        "checking for tmux first because it can run through different terminals
        "let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
        "let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        "This should work in urxvt and maybe xterm
        "set term=xterm-256color
        let &t_SI = "\ePtmux;\e\e[5 q\e\\"
        let &t_EI = "\ePtmux;\e\e[2 q\e\\"
        let &t_SR = "\ePtmux;\e\e[3 q\e\\"
    endif
elseif &term =~"xterm" && $ISKONSOLE
    "I set up the $ISKONSOLE env var in mykonsole profile
    let &t_SI = "\<Esc>]50;CursorShape=1;BlinkingCursorEnabled=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0;BlinkingCursorEnabled=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2;BlinkingCursorEnabled=1\x7"
"""elseif &term == "xterm" || &term == "xterm-256color" || &term=="xterm-256color-italic"
elseif &term =~ "xterm" && !$ISKONSOLE
    "let &t_EI = "\<Esc>]12;red\x7"
    "let &t_SI = "\<Esc>]12;orange\x7"
    "let &t_SI .= "\<Esc>[1 q"
    "let &t_EI .= "\<Esc>[2 q"
    "let &t_SR .= "\<Esc>[3 q"
    " 1 or 0 -> blinking block
    " 2 ->solid block
    " 3 -> blinking underscore
    " 4 ->solid underscore
    " Recent versions of xterm (282 or above) also support
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar  " solid underscore
    let &t_SI = "\<Esc>[5 q"
    " solid block
    let &t_EI = "\<Esc>[2 q"
    let &t_SR = "\<Esc>[3 q"
    " 1 or 0 -> blinking block
    " 3 -> blinking underscore
elseif &term =~ "rxvt" && !$ISKONSOLE
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[2 q"
    let &t_SR = "\<Esc>[3 q"
    " use an orange cursor in insert mode
    "let &t_SI = "\<Esc>]12;orange\x7"
    " use a red cursor otherwise
    "let &t_EI = "\<Esc>]12;red\x7"
    "silent !echo -ne "\033]12;red\007"
    " reset cursor when vim exits
    "autocmd VimLeave * silent !echo -ne "\033]112\007"
    " use \003]12;gray\007 for gnome-terminal
elseif &term =~ "nvim"
    "nothing to do yet

else
"    let &t_SI = "\e[?6;0;0c"
"    let &t_EI = "\e[?16;0;0c"
"    let &t_EI = "\<Esc>[6 q"
"    let &t_SR = "\e[?2;0;0c"
"    let &t_ti.="\e[1 q"
"    let &t_SI.="\e[5 q"
"    let &t_EI.="\e[1 q"
"    let &t_te.="\e[0 q"
"    echo "unknown terminal 1"
endif
"To enable italic fonts on terminal:
set t_ZH=[3m
set t_ZR=[23m
"Or that way seems to work just as above without typing in special esc char:
"if &term =~"xterm" || &term =~ "screen" || &term =~ "tmux"
if &term =~ "xterm" || &term =~ "rxvt"
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
elseif &term =~ "screen" || &term =~ "tmux"
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
    "let &t_ZH="\ePtmux;\e\e[3m\e\\"
    "let &t_ZR="\ePtmux;\e\e[23m\e\\"
elseif &term =~ "nvim"
    "nothing to do yet
else
"    echo "unknown terminal 2"
endif 

" (Brace face)
set showmatch

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
set mousehide		" Hide the mouse when typing text

set ch=2		" Make command line two lines high
set cursorline
"set cc=81

" Setting scrolloff so cursor alsways stays inside that range except the top/bot
set scrolloff=5
"Neovim stuff
if has('nvim')
    "let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    "set guicursor=n-v-c:block-Cursor/lCursor-blinkon100-blinkoff100-blinkwait100,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
	set guicursor=
        \n-v-c:block-Cursor-blinkwait0,
        \i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250,
        \r-cr:hor20-blinkwait700-blinkoff400-blinkon250,
        \o:hor50,
		\sm:block-blinkwait175-blinkoff150-blinkon175
endif
"set a shorter timeout for key-combs and commands (default=1000)
set timeoutlen=1200
set showcmd
"set position for new split windows:
set splitbelow
set splitright

" Test section - temp changes
"let vim_markdown_preview_browser='google-chrome-beta'
"let vim_markdown_preview_temp_file=1
"let vim_markdown_preview_use_xdg_open=1
"let vim_markdown_preview_hotkey='<C-m>'
"let vim_markdown_preview_github=1
"vim-table-mode
let g:table_mode_corner = '+'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

"trying to fix arrow keys in insert mode in VIM
if !has('nvim')
    set t_ku=OA
    set t_kd=OB
    set t_kr=OC
    set t_kl=OD
    imap <Esc>[A <Up>
    imap <Esc>[B <Down>
    imap <Esc>[C <Right>
    imap <Esc>[D <Left>
endif
"disable spellcheck for help files
"function NoSpellcheckForHelpFiles()
"    if (&filetype=="help")
"        setlocal nospell
"    else
"        setlocal spell
"    endif
"endfunction
"autocmd BufNewFile,BufRead,BufEnter *.markdown,*.md,*.mdown,*.mkd,*.mkdn,*.txt,*.info call NoSpellcheckForHelpFiles()
"autocmd BufNewFile,BufRead,BufEnter *.tex setlocal shiftwidth=2 softtabstop=2 tabstop=2
"airline/powerline stuff
"let g:powerline_pycmd="py3"
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"let g:airline#extensions#tabline#enabled = 1
"Turning off AutoClose only use it when I need to.
let g:AutoCloseOn = 0
let g:AutoClosePairs = {'"': '"', '[': ']', '''': '''', '(': ')', '{': '}'}
"let g:AutoClosePairs = {'"': '"', '[': ']', '''': '''', '(': ')'}
"Setting bufferline to my liking
let g:bufferline_echo = 1
let g:bufferline_rotate = 1
let g:bufferline_fname_mod = ':t'
let g:bufferline_fixed_index =  1
"More Vim-airline settings
"Some more airline stuff- disable undesired plugin integration
"let g:airline#extensions#bufferline#enabled = 0
"let g:airline#extensions#branch#enabled = 1
"let g:airline_theme='dark'
let g:airline_extensions = ['tabline', 'bufferline', 'whitespace']
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

"plasticboy/vim-markdown config
let g:vim_markdown_math = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_folding_disabled = 1

"vim-pandoc settings
"let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
"let g:pandoc#filetypes#pandoc_markdown = 0

"vimtex settings
let g:vimtex_indent_enabled = 1
let g:vimtex_indent_ignored_envs = ['document', 'enumerate', 'item', 'eqnarray', 'equation', 'array', 'eqnarray']

"gonvim settings
let g:gonvim_draw_statusline = 0
let g:gonvim_draw_tabline = 0
let g:gonvim_draw_lint = 0
let g:gonvim_start_fullscreen = 1
let g:gonvim_draw_split = 0

"translate-shell settings
let g:trans_default_direction = ":es+de"
let g:trans_directions_list = [
        \['', 'es', 'de'],
        \['en', 'es'],
        \['es', 'en'],
        \['en', 'de'],
        \['de', 'en'],
        \['', 'en'],
        \['', ''],
\]
"inoremap <silent> <leader>t <ESC>:Trans<CR><C-w><C-w>
nnoremap <silent> <leader>t :Trans<CR><C-w><C-w>
vnoremap <silent> <leader>t :Trans<CR><C-w><C-w>

"text formatting stuff
set nojoinspaces
"my own plugins' settings
"defaults for my zelharbackup plugin:
"let g:myfileslist = '/run/media/zelhar/yjk-B16gb/original_paths_list.txt'
let g:myfileslist = '/run/media/zelhar/yjk-16g-msd/original_paths_list.txt'
let g:mybackupdir=  '/run/media/zelhar/yjk-16g-msd/'
"let g:mybackupdir="/run/media/zelhar/yjk-B16gb/"
"source $VIMRUNTIME/ftplugin/man.vim
"vim-slime
"let g:slime_target = "neovim"
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
"thesaurus-query
"nnoremap <Leader>cs :ThesaurusQueryReplaceCurrentWord<CR>
"vnoremap <Leader>cs y:ThesaurusQueryReplace <C-r>"<CR>
let g:tq_map_keys=0
let g:tq_openoffice_en_file="/usr/share/mythes/th_en_US_v2"
let g:tq_openoffice_de_file="/usr/share/mythes/th_de_DE_v2"
let g:tq_openoffice_es_file="/usr/share/mythes/th_es_ES_v2"
let g:tq_language=['en', 'de', 'es']
let g:tq_enabled_backends=["openoffice_en", "openoffice_de", "openoffice_es", "openthesaurus_de", "datamuse_com"]
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"vim-clang options
"let g:clang_cpp_options = '-std=c++17'
"let g:clang_cpp_options = '-std=c++17 -stdlib=libc++'

"nvim-r and rmarkdown options
let g:markdown_fenced_languages = ['r', 'python']
let g:rmd_fenced_languages = ['r', 'python']
let g:rrst_syn_hl_chunk = 1
let g:rmd_syn_hl_chunk = 1
let g:R_rmdchunk = 0
let g:R_assign = 2
nmap <LocalLeader>sr <Plug>RStart
command Rstart call StartR("R")
command RDsendline call SendLineToR("down")

let R_in_buffer = 0
"let R_term = 'st'
let R_term = 'st-my-prefs'
"let R_term_cmd = 'st-my-prefs -title R -e'
"let R_term_cmd = 'st -f "monospace:size=11" -title R -e'

function! MarkdownHtmlPreview()
    let s:input_file = expand('%:t')
    let s:output_file = expand('%:r') . '.html'
    let s:commandLine = 'pandoc ' . s:input_file
    let s:commandLine .= ' -o ' . s:output_file
    "execute "!" . commandLine
    call system(s:commandLine)
    call system('surf_tabs.sh' . s:output_file)
endfunction
function! MarkdownPdfPreview()
    let s:input_file = expand('%:t')
    let s:output_file = expand('%:r') . '.pdf'
    let s:commandLine = 'pandoc ' . s:input_file
    let s:commandLine .= ' -o ' . s:output_file
    "execute "!" . commandLine
    call system(s:commandLine)
    call system('zathura_tabs.sh ' . s:output_file)
endfunction
function! MarkdownCompilePdfHtml()
    let s:input_file = expand('%:t')
    let s:output_file = expand('%:r')
    let s:commandLine = 'pandoc ' . s:input_file
    let s:commandLine .= ' -o ' . s:output_file
    "execute "!" . commandLine
    call system(s:commandLine . '.html')
    call system(s:commandLine . '.pdf')
endfunction
command MarkdownCompilePdfHtml call MarkdownCompilePdfHtml()
nnoremap <silent> <leader>mp :call MarkdownHtmlPreview()<cr>
nnoremap <silent> <leader>pp :call MarkdownPdfPreview()<cr>

"python env
"let g:python3_host_prog = '/usr/bin/python3'
"let g:python_host_prog = '/usr/bin/python2'
"let g:python3_host_prog='/home/zelhar/miniconda3/bin/ipython'
let g:python3_host_prog='/home/zelhar/miniconda3/bin/python'
let g:deoplete#sources#jedi#python_path = '/home/zelhar/miniconda3/bin/python'

"neoterm
" Use gx{text-object} in normal mode
"nmap gx <Plug>(neoterm-repl-send)
" Send selected contents in visual mode.
"xmap gx <Plug>(neoterm-repl-send)
" send line in normal mode
"nmap gxx <Plug>(neoterm-repl-send-line)
"let g:neoterm_default_mod='belowright' " open terminal in bottom split
"let g:neoterm_size=16 " terminal split size
"let g:neoterm_autoscroll=1 " scroll to the bottom when running a command
"nnoremap <C-s> :TREPLSendLine<cr>j " send current line and move down
"vnoremap <C-s> :TREPLSendSelection<cr> " send current selection

"vim-tmux
let g:VtrUseVtrMaps=1
