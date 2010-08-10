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
set scrolljump=5
set scrolloff=5

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
:set cursorline

" tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4

" smart indents
set smartindent

" Fix <Enter> for comment
set fo+=cr

" HOTKEYS
nmap <Space> <PageDown>
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi
imap <C-d> <esc>yypi
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

nmap <C-s> :w<cr>
vmap <C-s> <esc>:w<cr>i
imap <C-s> <esc>:w<cr>i

nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

nmap <F3> :copen<cr>
vmap <F3> <esc>:copen<cr>
imap <F3> <esc>:copen<cr>

nmap <F4> :SessionList<cr>
vmap <F4> <esc>:SessionList<cr>
imap <F4> <esc>:SessionList<cr>

map <F11> :NERDTree /shared/www/<cr>
vmap <F11> <esc>:NERDTree /shared/www/<cr>i
imap <F11> <esc>:NERDTree /shared/www/<cr>i

map <F12> :Ex<cr>
vmap <F12> <esc>:Ex<cr>i
imap <F12> <esc>:Ex<cr>i

map <F5> :BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>i
imap <F5> <esc>:BufExplorer<cr>i

imap >Ins> <Esc>i

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

" Plugins
" source /home/slik/.vim/plugins/nerdtree.vim
" call s:initNerdTree(getcwd())
" source /home/slik/.vim/plugins/fugitive.vim
" source /home/slik/.vim/plugins/zencoding.vim
" source /home/slik/.vim/plugins/bufexplorer.vim
