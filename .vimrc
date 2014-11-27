" ============================================================================
" Author: Leonid Shvechikov <shvechikov@gmail.com>
"
" Installation:
" 1. install vim-gtk (CSApprox needs +gui)
" 2. mkdir -p ~/.vim/bundle
" 3. git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 4. :BundleInstall
" 5. Profit!
"
" Brief vundle help:
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" ============================================================================

set nocompatible  " be improved (Vi IMproved!)
filetype off      " required for vundle!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required for vundle!)
Bundle 'gmarik/vundle'

Bundle 'junegunn/goyo.vim'
Bundle 'amix/vim-zenroom2'

" colorschemes
Bundle 'shvechikov/vim-colors-thegoodluck'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-scripts/desert256.vim'
Bundle 'candycode.vim'

Bundle 'gregsexton/MatchTag'
Bundle 'vim-indent-object'
Bundle 'taglist.vim'
Bundle 'utl.vim'

Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'rking/ag.vim'
"Bundle 'suan/vim-instant-markdown'
Bundle 'plasticboy/vim-markdown'

" plugins
"Bundle 'Align'
Bundle 'CSApprox'
Bundle 'kien/ctrlp.vim'
Bundle 'jlanzarotta/bufexplorer'
"Bundle 'bufexplorer.zip'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'

" filetypes
Bundle 'atourino/jinja.vim'
Bundle 'othree/html5-syntax.vim'
Bundle 'groenewege/vim-less'
" Bundle 'kevinw/pyflakes-vim'
" Bundle 'andviro/flake8-vim'
" Bundle 'jpythonfold.vim'
Bundle 'tmhedberg/SimpylFold'
Bundle 'indentpython.vim'
Bundle 'hdima/vim-scripts'
Bundle 'nvie/vim-flake8'
Bundle 'davidhalter/jedi-vim'
Bundle 'evanmiller/nginx-vim-syntax'
Bundle 'vim-scripts/matchit.zip'


Bundle 'ivanov/vim-ipython'


filetype plugin indent on  " required for vundle!


" ============================================================================
"                                  Setting
" ============================================================================

syntax on

if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    "set guifont=Monaco:h15
    set guifont=Monaco:h13
    set linespace=3
elseif $TERM == 'xterm-256color'
    set t_Co=256
endif

colorscheme thegoodluck
"colorscheme desert256


set history=1000

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/venv/*,*.pyc,*/staticfiles/*

set ai
set clipboard=unnamed

try
    set numberwidth=5
    set number
    "set foldcolumn=12
    hi LineNr guibg=grey99
    hi LineNr guifg=grey95
    hi FoldColumn guibg=grey99
    hi ColorColumn guibg=grey99
    hi NonText    guifg=grey99  guibg=grey99   gui=none
    set colorcolumn=80
    "let &colorcolumn=join(range(80,181),",")
catch /E518: Unknown option/
    echo "WARNING: colorcolumn works only in Vim >= 7.3"
endtry

set guicursor=n-v-c:block-blinkon0-Cursor/lCursor
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor/lCursor
set guicursor+=r-cr:hor20-Cursor/lCursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

set shiftwidth=2
set softtabstop=-1
set tabstop=8
set expandtab

set showmatch
set scrolloff=5

set hlsearch
set incsearch

set visualbell
set mouse=a  " Enable the use of the mouse.
set display+=lastline  " If last line doesn't fit into screan - show part of it
                       " instead of stupid @@@@@@@@@@@@@@@@@@

" Always hide the statusline
set laststatus=2

" Format the statusline
let sl_flags='%h%m%r%y%w'
let sl_left='%<%{HasPaste()}%f '
let sl_symbol="%{synIDattr(synID(line('.'),col('.'),0),'name')}  %b 0x%02B  "
let sl_cursor_position = '[%l(%L) x %2c(%2v)] %3p%%'
let &statusline = sl_left . sl_flags . '%=' . sl_symbol . sl_cursor_position

function! HasPaste()
    if &paste
        return '[PASTE MODE]'
    else
        return ''
    endif
endfunction


" ============================================================================
"                                  Mappings
" ============================================================================

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э'
set langmap+=яz,чx,сc,мv,иb,тn,ьm,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS
set langmap+=ВD,АF,ПG,РH,ОJ,ЛK,ДL,ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Ж:,Б<,Ю>,]`,[~

let mapleader=','

"search visual selected text using *
vmap * "zy/<C-R>=escape(@z, '\\/.*$^~[]')<CR><CR>
vmap # "zy?<C-R>=escape(@z, '\\/.*$^~[]')<CR><CR>

nmap <Esc><Esc> :nohlsearch<CR>
map <Left> <Esc>gT
map <Right> <Esc>gt
"imap <Left> <Esc>gT
"imap <Right> <Esc>gt

map <Up> 
map <Down> 
"imap <Up> 
"imap <Down> 

" ============================================================================
"                           Plugins customization
" ============================================================================

" syntax/python.vim
let python_highlight_all = 1
hi pythonSpaceError guibg=#ffdddd

" netwr
let g:netrw_fastbrowse=0  " don't cache dirs, always show actual content
let g:netrw_mousemaps=0   " disable mouse in browsing
let g:netrw_banner=0      " enable/suppress the banner
let g:netrw_list_hide='\v\.(pyc|swp)$'  " hide some file types

" for bufexplorer (строка - line)
lan en_US.UTF-8
noremap <Leader>e :BufExplorer<CR>
noremap <Leader>s :BufExplorerHorizontalSplit<CR>
noremap <Leader>v :BufExplorerVerticalSplit<CR>

" CtrlP
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 'Et'
noremap <Leader>m :CtrlPMixed<CR>

" jedi
"let g:jedi#completions_command = "<C-J>"


" ============================================================================
"                               Autocommands
" ============================================================================

autocmd! bufwritepost ~/.vimrc source ~/.vimrc
autocmd Filetype python setlocal sw=4
