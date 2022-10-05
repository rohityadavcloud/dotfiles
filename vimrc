" Load plugins with pathogen
call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Text Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
"set smartindent

set hlsearch
set paste
set softtabstop=2
set shiftwidth=2
set tabstop=4
set expandtab
set nosmarttab
set formatoptions+=n       " support for numbered/bullet lists
set textwidth=80           " wrap at 80 chars by default
set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings, normally set by default
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
if has("autocmd")
" Turn off, then on to make sure we load ftdetect plugins in
" pathogen-added paths
    filetype off
    filetype plugin indent on
endif
behave xterm

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ruler                    " show the cursor position all the time
set noshowcmd                " don't display incomplete commands
set nolazyredraw             " turn off lazy redraw
set number                   " line numbers
set wildmenu                 " turn on wild menu
set wildmode=list:longest,full
set ch=2                     " command line height
set backspace=2              " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]   " backspace and cursor keys wrap to
set shortmess=filtIoOA       " shorten messages
set report=0                 " tell us about changes
set nostartofline            " don't jump to the start of line when scrolling
set virtualedit=block        " allow virtual edit in visual block
set so=2                     " Always show lines above/below cursor
set encoding=utf-8           " Use utf-8 by default

set title                    " Xterm title bar
set laststatus=2             " Always show status bar
set statusline=%F%m%r%h%w\ %=[ff=%{&ff}]\ [ft=%Y]\ [asc=\%3.3b/0x\%02.2B]\ [%4l,%4v][%3p%%][len=%L][buf=%n]

set showmatch                " Show matching parentheses
set shiftround               " Indent to tab boundaries
set matchtime=5              " 5/10 seconds to show paren matches
set list listchars=tab:>-,trail:- " Show trailing spaces and hard tabs

set incsearch                " Incremental search
set ignorecase               " Ignore case in searches
set smartcase                " ... unless the search term has caps
set iskeyword+=_,$,@,%,#     " Chars not to be word separators
set showcmd                  " Show commands being typed
set viminfo='20,<1000,s10,h
set viminfo+=%               " Save/restore buffer list

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lead with ,
let mapleader = ","

" exit to normal mode with 'jj'
inoremap jj <ESC>

" quit forcefully
cmap qq q!

" Sudo make me a sandwich
cmap w!! %!sudo tee > /dev/null %

function! StripWhitespace ()
   exec ':%s/ \+$//gc'
endfunction
map ,s :call StripWhitespace ()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
syntax on
set t_Co=256                 " 256 color terminal if possible
set background=dark
let g:solarized_termcolors=16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme zenburn
"colorscheme evening         " Color scheme
"hi! link Folded Delimiter    " Override folding colors - they suck

" Highlight 80th (or textwidth) column (vim 7.3+)
if exists("+colorcolumn")
  set colorcolumn=+1,+2,+3
  highlight ColorColumn ctermbg=0B6 guibg=#4f4f4f
endif

set background=dark

" edit gpg files
set backupskip+=*.gpg
" To avoid that parts of the file is saved to .viminfo when yanking or
" deleting, empty the 'viminfo' option.
set viminfo=

augroup encrypted
  au!
  " Disable swap files, and set binary file format before reading the file
  autocmd BufReadPre,FileReadPre *.gpg
    \ setlocal noswapfile bin
  " Decrypt the contents after reading the file, reset binary file format
  " and run any BufReadPost autocmds matching the file name without the .gpg
  " extension
  autocmd BufReadPost,FileReadPost *.gpg
    \ execute "'[,']!gpg --decrypt" |
    \ setlocal nobin |
    \ execute "doautocmd BufReadPost " . expand("%:r")
  " Set binary file format and encrypt the contents before writing the file
  autocmd BufWritePre,FileWritePre *.gpg
    \ setlocal bin |
    \ '[,']!gpg -c
  " After writing the file, do an :undo to revert the encryption in the
  " buffer, and reset binary file format
  autocmd BufWritePost,FileWritePost *.gpg
    \ silent u |
    \ setlocal nobin
augroup END
