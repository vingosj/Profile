syntax on
set hidden
set wildmenu
set showcmd
set hlsearch
set smartcase

set smartindent

set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

retab!
set number
set nocompatible
if version >= 603
	set helplang=cn
endif
set encoding=utf-8

autocmd BufNewFile *.cpp,*.c,*.sh,*.py exec ":call SetTitle()"
func SetTitle()
	if &filetype == 'sh'
		call append(line("."), "\#########################################################################")
		call append(line(".")+1, "\# File Name: ".expand("%"))
		call append(line(".")+2, "\# Create by Vingo Chen on ".strftime("%y-%m-%d"))
		call append(line(".")+3, "\#########################################################################")
		call append(line(".")+4, "\#!bin/bash")
		call append(line(".")+5, "")
	endif
	if &filetype == 'python'
		call append(line("."), " ##########################################################################")
		call append(line(".")+1, " #    > File Name: ".expand("%"))
		call append(line(".")+2, " #    > Create by Vindo Chen on ".strftime("%y-%m-%d"))
		call append(line(".")+3, " ##########################################################################")
		call append(line(".")+4, "")
		call append(line(".")+5, "#!/usr/bin/env python")
		call append(line(".")+6, "# -*- coding:utf-8 -*-")
		call append(line(".")+6, "")
	
	endif
	if &filetype == 'cpp'
		call setline(1, " /*************************************************************************") 
		call append(line("."), "    > File Name: ".expand("%")) 
		call append(line(".")+1, "    > Create by Vindo Chen on ".strftime("%y-%m-%d"))
		call append(line(".")+2, " ************************************************************************/")
		call append(line(".")+3, "")
		call append(line(".")+4, "#include <iostream>")
		call append(line(".")+5, "using namespace std;")
		call append(line(".")+6, "int main(int argc, char* argv[]) {")
		call append(line(".")+7, "")
		call append(line(".")+8, "")
		call append(line(".")+9, "")
		call append(line(".")+10, "}")
		call append(line(".")+11, "")
	endif
	if &filetype == 'c'
		call setline(1, " /*************************************************************************")
		call append(line("."), "    > File Name: ".expand("%")) 
		call append(line(".")+1, "    > Create by Vindo Chen on ".strftime("%y-%m-%d"))
		call append(line(".")+2, " ************************************************************************/")
		call append(line(".")+3, "")
		call append(line(".")+4, "#include <stdio.h>")
		call append(line(".")+5, "int main(void) {")
		call append(line(".")+6, "")
		call append(line(".")+7, "")
		call append(line(".")+8, "")
		call append(line(".")+9, "}")
		call append(line(".")+10, "")
	endif

	autocmd BufNewFile * normal G
endfunc

" select all
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
" copy & paste
map <C-c> "+y
" open tree-directory
map <F3> :tabnew .<CR>
map <C-F3> /be


" compile
:map <F5> :call CompileRun()<CR>
func! CompileRun()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'sh'
		:!bash ./%
	elseif &filetype == 'python'
		exec "!python %"
	endif
endfunc

set hlsearch
set incsearch

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on 
set completeopt=longest,menu


