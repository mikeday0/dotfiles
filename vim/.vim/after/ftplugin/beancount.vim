" File ~/.vim/after/ftplugin/beancount.vim
" Additional beancount settings

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" local-leader remaps
nnoremap <buffer> <localleader>a :AlignCommodity<CR>
inoremap <buffer> <localleader>a :AlignCommodity<CR>

if exists("*strftime")
    " inserts current date in YYYY-MM-DD format
    nnoremap <buffer> <localleader>d i<C-R>=strftime("%F")<CR><ESC>
    inoremap <buffer> <localleader>d <C-R>=strftime("%F")<CR>

    " inserts yesterday's date in YYYY-MM-DD format
    nnoremap <buffer> <localleader>yd i<C-R>=strftime("%F",localtime()-86400)<CR><ESC>
    inoremap <buffer> <localleader>yd <C-R>=strftime("%F",localtime()-86400)<CR>
endif

if has("float")
    " populate expression register with 'round(100*(<cursor>))/100'
    " nnoremap <buffer> <localleader>c i<C-R>=round(100*())/100<Left><Left><Left><Left><Left><Left>
    inoremap <buffer> <localleader>c <C-R>=round(100*())/100<Left><Left><Left><Left><Left><Left>
endif

" beancount-vim settings
let beancount_separator_col=45
inoremap <buffer> . .<C-O>:AlignCommodity<CR>
