call pathogen#infect()
syntax enable
filetype plugin indent on

syntax on
set hlsearch
set so=7
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
set number

set ts=4
set sw=4
set et
set sts=4
set ai

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

autocmd BufRead Makefile set noet
autocmd BufRead *.mk set noet
autocmd BufRead *.jade set ts=2
autocmd BufRead *.jade set sw=2
autocmd BufRead *.jade set sts=2
autocmd BufRead *.styl set ts=2
autocmd BufRead *.styl set sw=2
autocmd BufRead *.styl set sts=2
"autocmd BufRead *.slim set ts=2
"autocmd BufRead *.slim set sw=2
"autocmd BufRead *.slim set sts=2

colorscheme elflord

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

