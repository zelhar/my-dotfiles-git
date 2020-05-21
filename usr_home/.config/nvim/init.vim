" ~/.config/init.vim
"set nocompatible
" Remove ALL autocommands for the current group:
autocmd!
"------- START Plug manager instead of Vundle
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Townk/vim-autoclose'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/TextFormat'

"Color Themes
Plug 'robertmeta/nofrils'
Plug 'andreypopp/vim-colors-plain'
Plug 'pbrisbin/vim-colors-off'
Plug 'vietjtnguyen/toy-blocks'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mswift42/vim-themes' "emacs themes
Plug 'chriskempson/base16-vim' 
Plug 'rafi/awesome-vim-colorschemes'

"Plugins I am testing to see if they are worth using
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf'
Plug 'mileszs/ack.vim'
" Track the engine.
"""""Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"""""Plug 'honza/vim-snippets'

"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
"Plug 'scrooloose/nerdtree' "file picker
Plug 'mcchrish/nnn.vim' "file picker
Plug 'tpope/vim-surround'
Plug 'vim-scripts/loremipsum'
Plug 'echuraev/translate-shell.vim'
Plug 'jpalardy/vim-slime'

Plug 'justmao945/vim-clang'
Plug 'jalvesaq/Nvim-R'
Plug 'vim-pandoc/vim-pandoc-syntax'

"Python plugins

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

set termguicolors

"Switch on syntax highlighting if it wasn't on yet.
"filetype plugin indent on
if !exists("syntax_on")
    syntax on
endif

set nocompatible
"make backspace function like normal apps in insert mode
set backspace=indent,eol,start


set textwidth=80
set background=dark

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
scriptencoding utf-8
if has("gui_running")
    set listchars=eol:¶,tab:>»,trail:·
"    set listchars=eol:¬,tab:>»,trail:·
else
"    set listchars=eol:¶,tab:>»,trail:·
    set listchars=eol:¬,tab:>»,trail:·
endif

" Show whitespace
"set list

set laststatus=2
set showtabline=2

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

" yank/paste to/from PRIMARY (selection) clipboard
vnoremap <Leader>y  "*y
nnoremap <Leader>y  "*yy
nnoremap <Leader>p  "*p
nnoremap <Leader>P  "*P
" can also simply use the unnamed register by default
set clipboard+=unnamed

"Compile a Latex File with xelatex
nnoremap <Leader>xe :!xelatex -synctex=1 -interaction=nonstopmode -shell-escape

"wraps selected text in ()
vnoremap <Leader>0 di()<Esc>hpe

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

set sessionoptions=blank,buffers,curdir,folds,slash,unix,tabpages

au BufNewFile,BufRead *.hs setlocal nospell

"Make vim save backup of the files: 
set backup
set backupcopy=auto
"And save in the first folder it can of the following:
set backupdir=/run/media/zelhar/yjk-16g-msd/backupvimtexts/,
            \/run/media/zelhar/yjk-B16gb/backupvimtexts,
            \/run/media/zelhar/UF16/backupvimtexts,
            \/run/media/zelhar/JetFlash16/backupvimtexts,~/tmp,~/temp,.,~/,
            \/media/JetFlash16
"add a dictionary file for word completion:
"let g:symbols_file = "$HOME/dictionaries/symbols"
set dictionary+=$HOME/dictionaries/symbols
set dictionary+=$HOME/dictionaries/chemical_formulas.txt
set dictionary+=/usr/share/dict/american
set dictionary+=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/ngerman
set dictionary+=/usr/share/dict/spanish
"make autocomplete (:help cpt) with ctrl-n search in the also in the dictionary
set complete+=k
set complete+=i
set complete+=t
set complete+=kspell
set completeopt=menuone,preview,longest,noinsert

"Set (locally) working dir to be the same as the file being edited in the buffer
autocmd BufEnter * silent! lcd %:p:h
"redraw screen when switching buffer, and returning to window (cleans garbage)  
autocmd BufEnter * :redraw!
autocmd FocusGained * :redraw! 
autocmd WinEnter * :filetype detect
"autocmd BufEnter * :filetype detect

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
"set a shorter timeout for key-combs and commands (default=1000)
"set timeoutlen=1200
set timeoutlen=820
set showcmd
"set position for new split windows:
set splitbelow
set splitright

" Test section - temp changes
"vim-table-mode
let g:table_mode_corner = '+'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

"airline/powerline stuff
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"let g:airline#extensions#tabline#enabled = 1
"Turning off AutoClose only use it when I need to.
let g:AutoCloseOn = 0
let g:AutoClosePairs = {'"': '"', '[': ']', '''': '''', '(': ')', '{': '}'}
"Setting bufferline to my liking
let g:bufferline_echo = 1
let g:bufferline_rotate = 1
let g:bufferline_fname_mod = ':t'
let g:bufferline_fixed_index =  1
"More Vim-airline settings
"let g:airline_theme='dark'
let g:airline_extensions = ['tabline', 'bufferline', 'whitespace']

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
let g:vimtex_indent_enabled = 0
let g:vimtex_indent_ignored_envs = ['document', 'enumerate', 'item', 'eqnarray', 'equation', 'array', 'eqnarray']
let g:tex_flavor = 'latex'

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

"setting colorscheme variables
let g:afterglow_inherit_background=1
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
if !has("gui_running")
     "colorscheme molokai
     "colorscheme zelhar-molokai
     "colorscheme zelhar-molokai-italic
     "colorscheme jellybeans
     "colorscheme bushfire
     "colorscheme zelhar-darkblue
     "colorscheme afterglow
     colorscheme ayu
endif

"coc-nvim
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <silent><expr> <space><space> coc#refresh()

"testing clipboard thing
"let g:clipboard = {
"      \   'name': 'myClipboard',
"      \   'copy': {
"      \      '+': 'tmux load-buffer -',
"      \      '*': 'tmux load-buffer -',
"      \    },
"      \   'paste': {
"      \      '+': 'tmux save-buffer -',
"      \      '*': 'tmux save-buffer -',
"      \   },
"      \   'cache_enabled': 1,
"      \ }
