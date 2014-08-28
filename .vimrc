execute pathogen#infect()
syntax on
filetype plugin on

let mapleader = "\<Space>"
set nu

autocmd Filetype ruby set ts=2 sts=2 sw=2

" Turn off vi compatibility
set nocompatible

set smartindent
set autoindent

" load indent file for the current filetype
filetype indent on

colorscheme neon

map <F9> :w !python -<CR>

" EasyAlign shortcuts
nmap <Leader>a <Plug>(EasyAlign)
vmap <Leader>a <Plug>(EasyAlign)

runtime macros/matchit.vim

" Session stuff
let g:session_autoload = 'yes'
