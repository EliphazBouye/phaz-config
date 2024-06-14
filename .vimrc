vim9script

syntax on
filetype on

g:mapleader = "\<space>"
$LANG = 'en'
g:langmenu = 'en'

set number relativenumber cursorline cursorlineopt=number 
set shiftwidth=4 softtabstop=-1 expandtab
set autoindent
set timeout timeoutlen=3000 ttimeoutlen=100
set hlsearch incsearch ignorecase smartcase
set nowrap breakindent
set fileformat=unix fileformats=unix,dos
set display=lastline smoothscroll
set signcolumn=number
set sidescroll=1 sidescrolloff=3
set virtualedit=block
set nostartofline
set completeopt=menu,popup #completepopup
set list listchars=tab:→\ ,eol:↲,extends:›,precedes:‹,nbsp:·,trail:· showbreak=↪\
set scrolloff=8

# Turn on wild menu
set wildmenu

# Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

# Always show current position
set ruler

# A buffer become hidden when is it abandoned
set hidden

# Don't redraw with executing macros (for better perf)
set lazyredraw

# Show matching brackets when text indicator is other them
set showmatch

# How many tenths of a second to blink when matching brackets
set matchtime=2

# Show a bit extra margin to the left
set foldcolumn=1

# Font & Color
try
    set background=dark
    colorscheme retrobox
catch
endtry

#######
nnoremap <leader>w :w!<CR>
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

# File explorer
nnoremap <leader>fe :Ex<CR>

# Disable search highlighting
nnoremap <ESC> :nohlsearch<CR>

# Delete buffer
nnoremap <leader>d :bdelete<CR>

# Navigate between buffer
nmap <leader>, :bprevious<CR>
nmap <leader>. :bnext<CR>
