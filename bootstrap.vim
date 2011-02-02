" vi nocompatible mode
set nocompatible

" database mysql
if has("autocmd")
    autocmd BufRead *.sql set filetype=mysql
endif

" encoding
set encoding=utf-8
set termencoding=utf-8

" cursor position
set ruler

" undone commands
set showcmd

" numerable lines
set nu

" folding
" set foldmethod=indent

" inchsearch
set incsearch

" scroll
set scrolljump=3
set scrolloff=3

" beep off
set novisualbell
set t_vb=

" mouse
set mouse=a
set mousemodel=popup

" save buffer
set hidden

" turn off gui panel
set guioptions-=T
" turn off gui menu
set guioptions-=m

" syntax highlighter
syntax on

" show cursor line
set cursorline

" tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4

" smart indents
set smartindent

" Fix <Enter> for comment
set fo+=cr

" HOTKEYS
nmap <C-s> :w<cr>
vmap <C-s> <esc>:w<cr>i
imap <C-s> <esc>:w<cr>i

map <F11> :NERDTree /shared/www/<cr>
vmap <F11> <esc>:NERDTree /shared/www/<cr>i
imap <F11> <esc>:NERDTree /shared/www/<cr>i

map <F12> :Ex<cr>
vmap <F12> <esc>:Ex<cr>i
imap <F12> <esc>:Ex<cr>i

map <F5> :BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>i
imap <F5> <esc>:BufExplorer<cr>i

function InsertTabWrapper()
     let col = col('.') - 1
     if !col || getline('.')[col - 1] !~ '\k'
         return "\<tab>"
     else
         return "\<c-p>"
     endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>

set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t

colorscheme slik

" List
nmap <F6> :set list!<CR>
set listchars=tab:▸\ ,eol:¬

set list

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre *.py,*.php,*.js :call <SID>StripTrailingWhitespaces()

" Bubble single line
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble mutiple lines
vmap <C-Up> xkP`[V`]
vmap <C-down> xp`[V`]

" shows highlight group
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
