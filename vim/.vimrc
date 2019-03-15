set nocompatible " make vim behave in a more useful way

" On Windows, also use '.vim' folder
if has('win32')
    set runtimepath+=$HOME/.vim
endif

" mappings
let mapleader = "," " leader key is comma
let maplocalleader = "\\" " leader key is single backspace

" autocommands

function! InsertIfEmpty()
    if line('$') == 1 && col('$') == 1
        " File is empty
        startinsert
    endif
endfunction

autocmd!
autocmd BufNewFile,BufEnter * call InsertIfEmpty()

set encoding=utf-8 " unicode!

syntax enable " syntax highlighting enabled; better to use than 'syntax on'
filetype indent on " indent settings based on filetype
filetype plugin on " vim settings based on filetype via plugins
set hidden " switch unsaved buffers without message

set expandtab " tabs are spaces
set softtabstop=4  " number of spaces in tab when editing
set tabstop=4  " number of visual spaces per tab
set shiftwidth=4 " number of visual spaces per indent

set backspace=indent,eol,start " backspace over everything in insert mode

set number " show line numbers
set showcmd " show command in bottom bar
set showmatch " highlight matching [{()}]

set background=dark

set noshowmode " vim-airline shows mode instead
set laststatus=2 " statusline is always visible

" space open/closes folds in normal mode
nnoremap <space> za

" jk is escape
inoremap jk <esc>

let &showbreak='\\ ' " line continuation for terminal

" undo, backup and swap directories
" create necessary directories if they don't exist
set backup " keep a backup file
if !isdirectory($HOME . "/.vimcache/backup")
    call mkdir($HOME . "/.vimcache/backup", "p")
endif
set backupdir^=~/.vimcache/backup// " path separators get replaced with %

if !isdirectory($HOME . "/.vimcache/swp")
    call mkdir($HOME . "/.vimcache/swp", "p",)
endif
set directory^=~/.vimcache/swp// " path separators get replaced with %

if has('persistent_undo')
    set undofile " keep an undo file (undo changes after closing)
    if !isdirectory($HOME . "/.vimcache/undo")
        call mkdir($HOME . "/.vimcache/undo", "p",)
    endif
    set undodir^=~/.vimcache/undo
endif


" vim-airline settings
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

" gvim stuff
if has("gui_running")
    if has("gui_win32")
        set guifont=Powerline_Consolas:h10:cANSI:qDRAFT
    elseif has("gui_macvim")
        set guifont=MesloLGSDZForPowerline-Regular:h11
    endif

    " populate g:airline_symbols with powerline symbols
    let g:airline_powerline_fonts = 1
    colorscheme solarized
    let g:airline_theme='solarized'
    let &showbreak='► ' " Black Right-Pointing Pointer (U+25BA, UTF-8: 0xE2 0x96 0xBA)
    set lines=62
    set columns=100
    set guioptions-=T " No toolbar
endif

