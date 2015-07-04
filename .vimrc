execute pathogen#infect()
syntax on
filetype plugin indent on

let mapleader = " "
set nu

" autocmd Filetype ruby setl ts=2 sts=2 sw=2
" autocmd Filetype python setl ts=2 sts=2 sw=2


" Turn off vi compatibility
set nocompatible

set smartindent
set autoindent

" load indent file for the current filetype
filetype indent on

colorscheme neon

" Press F9 to run file
fu! RunFile()
    let tempfile = "~/temp/temptemptemp" . @% 
    execute "w! " . tempfile
    execute "w !" . &filetype . " " . tempfile
    call delete(expand(tempfile))
endfu

map <F9> :call RunFile()<CR>


" " EasyAlign shortcuts
" nmap <Leader>a <Plug>(EasyAlign)
" vmap <Leader>a <Plug>(EasyAlign)

" Tabular shortcuts
nmap <Leader>a :Tabularize /
vmap <Leader>a :Tabularize /

" Rails vim stuff
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

runtime macros/matchit.vim

" Session stuff
let g:session_autoload = 'yes'

" Useful shortcuts
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" Show tab number stuff
if exists("+showtabline")
     function MyTabLine()
         let s = ''
         let t = tabpagenr()
         let i = 1
         while i <= tabpagenr('$')
             let buflist = tabpagebuflist(i)
             let winnr = tabpagewinnr(i)
             let s .= '%' . i . 'T'
             let s .= (i == t ? '%1*' : '%2*')
             let s .= ' '
             let s .= i . ')'
             let s .= ' %*'
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
             let file = bufname(buflist[winnr - 1])
             let file = fnamemodify(file, ':p:t')
             if file == ''
                 let file = '[No Name]'
             endif
             let s .= file
             let i = i + 1
         endwhile
         let s .= '%T%#TabLineFill#%='
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
         return s
     endfunction
     set stal=2
     set tabline=%!MyTabLine()
endif

" Autowrap Comments
fu! SetCommentAutowrap()
	set tw=75
	set fo=cq
endfu

autocmd BufNewFile,BufRead *.* call SetCommentAutowrap()

set ts=2 sts=2 sw=2

" Make julia thingy not mess with tab
au VimEnter * call LaTeXtoUnicode#Disable()

