" /~/.vimrc
set nocompatible
" Remove ALL autocommands for the current group:
autocmd!
"------- START Plug manager instead of Vundle
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

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

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mcchrish/nnn.vim' "file picker
Plug 'tpope/vim-surround'

"" Initialize plugin system
call plug#end()
"------- END Plug manager instead of Vundle

"make sure it stays on even if I delete Vundle or Neobunlde et al.
filetype plugin indent on

"Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
    syntax on
endif

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
set textwidth=68
set background=dark


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
scriptencoding utf-8
if has("gui_running")
    set listchars=eol:¶,tab:>»,trail:·
"    set listchars=eol:¬,tab:>»,trail:·
else
    set listchars=eol:¬,tab:>»,trail:·
endif

" Show whitespace
"set list

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ 
"            \[POS=%04l,%04v][%p%%]\ [LEN=%L]
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

"set viminfo='50,f1,\"100,h,<500,:100,/100,@100,s10
set sessionoptions=blank,buffers,curdir,folds,slash,unix,tabpages

au BufNewFile,BufRead *.hs setlocal nospell
set backup
set backupcopy=auto
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
"make autocomplete (:help cpt) with ctrl-n search in the also in the dictionary
set complete+=k
set complete+=i
set complete+=t
set complete+=kspell
set completeopt=menuone,preview,longest

"Set (locally) working dir to be the same as the file being edited in the buffer
autocmd BufEnter * silent! lcd %:p:h
"redraw screen when switching buffer, and returning to window (cleans garbage)  
autocmd BufEnter * :redraw!
autocmd FocusGained * :redraw! 
autocmd WinEnter * :filetype detect
"autocmd BufEnter * :filetype detect

" (Brace face)
set showmatch
"bracket highlight (that's on by default):
"set matchpairs=(:),{:},[:]
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
set timeoutlen=1200
set showcmd
"set position for new split windows:
set splitbelow
set splitright

" Test section - temp changes

"Neovim stuff
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

"airline stuff
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:bufferline_echo = 1
let g:bufferline_rotate = 1
let g:bufferline_fname_mod = ':t'
let g:bufferline_fixed_index =  1
let g:airline_extensions = ['tabline', 'bufferline', 'whitespace']


"text formatting stuff
set nojoinspaces
"my own plugins' settings
"defaults for my zelharbackup plugin:
let g:myfileslist = '/run/media/zelhar/yjk-16g-msd/original_paths_list.txt'
let g:mybackupdir=  '/run/media/zelhar/yjk-16g-msd/'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"setting colorscheme variables
if !has("gui_running")
     colorscheme zelhar-darkblue
endif

