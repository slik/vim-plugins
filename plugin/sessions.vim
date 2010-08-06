" Vim plugin to save and retrieve sessions
" Maintainer: 	Piotr Zalewa <piotr@zalewa.info>
" License: 		public domain

" Installation:
" Copy file to ~/.vim/plugin/
" Create directory ~/.vim/sessions/
" set session options in .vimrc, i.e:
" :set sessionoptions=buffers,folds

" Usage:
" Save default session
" :Ss<cr>
" Read default session
" :Sr<cr>

" Save named session
" :Ss "session_name"
" Read named session
" :Sr "session_name"

set sessionoptions=buffers,folds
let g:current_session= "default"

function! SessionSave(...)
	if a:0 > 0
		call SessionChange(a:1)
	endif
	call SessionSaveCurrent()
endfunction

function! SessionSaveCurrent()
	exe "mks! " SessionGetFile(g:current_session)
	echo "Session" g:current_session "saved"
endfunction

function! SessionChange(session_name)
	if a:session_name == ''
	else
		let g:current_session= a:session_name
	endif
endfunction

function! SessionRead(...)
	if a:0 > 0
		call SessionChange(a:1)
	endif
	call SessionReadCurrent()	
endfunction

function! SessionReadCurrent()
	echo "reading" g:current_session
	exe "source " SessionGetFile(g:current_session)
endfunction

function! SessionGetFile(session_name)
	return "~/.vim/sessions/" . a:session_name . ".vim"
endfunction

" :Ss "session_name"
command Ss :call SessionSave(<args>)
" :Sr "session_name"
command Sr :call SessionRead(<args>)

