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
vmap <C-C> "+yi
imap <C-V> <esc>"+gpi
imap <C-d> <esc>yypa

nmap <C-s> :w<cr>
vmap <C-s> <esc>:w<cr>a
imap <C-s> <esc>:w<cr>a

map <F11> :NERDTree /var/www/<cr>
vmap <F11> <esc>:NERDTree /var/www/<cr>a
imap <F11> <esc>:NERDTree /var/www/<cr>a

map <F5> :BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>a
imap <F5> <esc>:BufExplorer<cr>a

vmap <M-j> gj
vmap <M-k> gk
vmap <M-4> g$
vmap <M-6> g^
vmap <M-0> g^
nmap <M-j> gj
nmap <M-k> gk
nmap <M-4> g$
nmap <M-6> g^
nmap <M-0> g^

imap >Ins> <Esc>i

" NO SWAPS
set nobackup
set nowritebackup
set noswapfile

set showbreak=\ >>>\ 

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

set formatprg=par\ -w120rq

colorscheme vydark

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

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" highlightings
set hls

" Plugins
" source /home/slik/.vim/plugins/nerdtree.vim
" call s:initNerdTree(getcwd())
" source /home/slik/.vim/plugins/fugitive.vim
" source /home/slik/.vim/plugins/zencoding.vim
" source /home/slik/.vim/plugins/bufexplorer.vim
