execute pathogen#infect()
syntax on
filetype plugin indent on

let mapleader = " "
set nu

au VimEnter * set ts=2 sts=2 sw=2 et


" Turn off vi compatibility
set nocompatible

set nocindent
set autoindent

" load indent file for the current filetype
filetype indent on

colorscheme neon

" auto-close html tags
ia </ </<C-X><C-O>

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
	let l:l1 = line("'<")
	let l:l2 = line("'>")
	let l:spac = indent(line("."))-1
	let l:lines = getline(l:l1, l:l2)
	exe substitute(
				\ substitute('%1d%2', "%1", l:l1, ""),
				\ "%2", l:l2-l:l1+1, "")
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

" NextIndent
" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>

" Python function signature to docstring
" Hit <leader><leader>d while on a function signature to auto-load
" a docstring template
fu! Sig2Docstring()
  let l:winview = winsaveview()
  exe "normal! o\"\"\"concise_description\<cr>
        \\<cr>
        \in-depth_description\<cr>
        \\<cr>
        \Parameters\<cr>
        \----------\<cr>
        \p1 : type1\<cr>
        \  description_of_p1\<cr>
        \\<cr>
        \\<BS>Returns\<cr>
        \-------\<cr>
        \r1 : type1\<cr>
        \  description_of_r1\<cr>
        \\<cr>
        \\<BS>Examples\<cr>
        \--------\<cr>
        \description_of_example\<cr>
        \\<cr>
        \>>> PYTHON_CODE\<cr>
        \\"\"\"\<cr>
        \return 'NOT YET IMPLEMENTED'\<cr>\<Esc>"
  call winrestview(l:winview)
endfu

nnoremap <silent> <leader><leader>d :call Sig2Docstring()<CR>

" Make julia thingy not mess with tab
au VimEnter * call LaTeXtoUnicode#Disable()

" Make < and > not exit visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv
