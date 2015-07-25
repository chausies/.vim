execute pathogen#infect()
syntax on
filetype plugin indent on

let mapleader = " "
set nu

au VimEnter * set ts=2 sts=2 sw=2


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

" banner comments
fu! Banner(opt)
	normal! '<^
	let l:l1 = line("'<")
	let l:l2 = line("'>")
	let l:spac = col(".") - 1
	let l:lines = getline(l:l1, l:l2)
	normal! V'>d
	let l:maxim = 0
	for l in l:lines
		if len(l) > l:maxim + l:spac
			let l:maxim = len(l) - l:spac
		endif
	endfor
	let l:s = tcomment#GetCommentDef(&ft)['commentstring']
	if strpart(l:s, len(l:s)-2, 2) == "%s"
		let l:t1 = strpart(l:s, 0, len(l:s)-2)
		let l:t1 = join(reverse(split(l:t1, '\zs')), "")
		let l:s = join([l:s, l:t1], "")
	endif
	let l:bar = repeat('-', l:maxim)
	let l:lines = [l:bar] + l:lines + [l:bar]
	let l:newlines = copy(l:lines)
	let l:i = 0
	for l in l:lines
		let l:l = strpart(l, l:spac, len(l)-l:spac)
		if a:opt == 'center'
			let l:amt_left = l:maxim - len(l:l)
			let l:beg_spac = l:amt_left/2
			if l:amt_left % 2 == 0
				let l:end_spac = l:amt_left/2
			else
				let l:end_spac = l:amt_left/2 + 1
			endif
		else
			let l:beg_spac = 0
			let l:end_spac = l:maxim - len(l:l)
		endif
		let l:temp = join([repeat(' ', l:beg_spac), l:l, repeat(' ', l:end_spac)], "")
		let l:temp = substitute(l:s, "%s", l:temp, "")
		if l:i == 0 || l:i == len(l:lines)-1
			let l:temp = substitute(l:temp, '\s', '-', "g")
		endif
		let l:newlines[l:i] = join([repeat(' ', l:spac), l:temp, ], "")
		let l:i = l:i + 1
	endfor
	call append(l1-1, l:newlines)
endfu
vmap <leader>bb <Esc>:call Banner("")<CR>
vmap <leader>bc <Esc>:call Banner("center")<CR>
nmap <leader>bb V<leader>bb
nmap <leader>bc V<leader>bc

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

" Make julia thingy not mess with tab
au VimEnter * call LaTeXtoUnicode#Disable()
