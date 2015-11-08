set rtp+=~/.vim/bundle/Vundle.vim
filetype off                  

"
" Setup
call plug#begin('~/.vim/plugged')

" Plugs to install
" General
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/wombat256.vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'


" Javascript
Plug 'moll/vim-node', {'for': 'javascript'}
Plug 'ahayman/vim-nodejs-complete', {'for': 'javascript'}
Plug 'ternjs/tern_for_vim', {'for': 'javascript', 'do': 'npm install'}

call plug#end()



filetype plugin indent on  

" General
set nocompatible             " not compatible with the old-fashion vi mode
set history=100              " store 100 lines of history


" User Interface
set showmode                 " display the current mode
set ruler                    " always show current position
set scrolloff=7              " set scroll offset to 7 lines above/below cursor
set autoread                 " auto read when file is changed from outside
set nu                       " display line numbers
set clipboard=unnamed        " yank to the system register (*) by default
set hid                      " hide abandon buffers in order to not lose undo history
set showmatch                " cursor shows matching ) and }
set incsearch                " incremental search
set ignorecase               " ignore case when searching
set smartcase                " ignore case if search pattern is all lowercase, case-sensitive otherwise
set wildchar=<TAB>           " start wild expansion in the command line using <TAB>
set wildmenu                 " wild char completion menu


" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc


" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,b,s,h,l,[,]


filetype on                  " enable filetype detection
filetype indent on           " enable filetype-specific indenting
filetype plugin on           " enable filetype-specific plugins


" auto reload vimrc when editing it
autocmd! BufWritePost .vimrc source ~/.vimrc


" disable annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" vimtip#80 restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


" Formatting
set autoindent               " auto indentation
set copyindent               " copy the previous indentation on autoindenting
set smarttab                 " insert tabs on line start according to context
set expandtab                " replace <TAB> with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
autocmd FileType Makefile set noexpandtab
autocmd FileType jade set tabstop=2|set softtabstop=2|set shiftwidth=2


" Colors and Fonts
syntax on
set hlsearch
set background=dark          " set background dark
set t_Co=256                 " 256 color mode
colorscheme wombat256mod


" Formatting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>         " toggle paste mode
set ffs=unix,dos,mac         " use unix as standard file format


" Statusline
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L


function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction


" Encoding
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
	set encoding=utf-8                                  
	set termencoding=big5
endfun

fun! UTF8()
	set encoding=utf-8                                  
	set termencoding=big5
	set fileencoding=utf-8
	set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
	set encoding=big5
	set fileencoding=big5
endfun


" Shortcuts
" disable arrow keys and force hjkl
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" set leader to ,
let mapleader=","
let g:mapleader=","

" move around splits
map <C-J> <C-W>j<C-W>_       " move to and maximize the below split
map <C-K> <C-W>k<C-W>_       " move to and maximize the above split
nmap <c-h> <c-w>h<c-w><bar>  " move to and maximize the left split
nmap <c-l> <c-w>l<c-w><bar>  " move to and maximize the right split
set wmw=0                    " set the min width of a window to 0 so we can maximize others 
set wmh=0                    " set the min height of a window to 0 so we can maximize others

map <S-H> gT                 " go to prev tab
map <S-L> gt                 " go to next tab
map <C-t><C-t> :tabnew<CR>      " new tab
map <C-t><C-w> :tabclose<CR>    " close tab
nmap <leader>/ :nohl<CR>        " ,/ turns off search highlighting

" bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>


" enable function folding
set foldmethod=syntax
set foldlevelstart=10
set directory=~/.vim_swap

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd StdinReadPre * let s:std_in=1

set completeopt-=preview
let g:go_disable_autoinstall = 0
let g:neocomplete#enable_at_startup = 1


" Snippets are separated from the engine. Add this if you want them:
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
