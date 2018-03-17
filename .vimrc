"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install plugins with :PluginInstall

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Required plugin
Plugin 'VundleVim/Vundle.vim'

" Personal plugins go below this line

""" Autocompletion
Plugin 'valloric/youcompleteme'

""" Editing
" Pair brackets, parens, quotes
Plugin 'jiangmiao/auto-pairs'

""" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'jacoborus/tender.vim'
Plugin 'sickill/vim-monokai'

""" Languages
Plugin 'rust-lang/rust.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'

""" Misc
" Git integration
Plugin 'tpope/vim-fugitive'
" statusline for vim
Plugin 'itchyny/lightline.vim'

" Plugins go above this line

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jocelyn's Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" move up and down by visual line for specified file types
noremap j gj
noremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Always show line number on left
set number

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in terminal
if $COLORTERM == 'gnome-terminal' || $COLORTERM == 'truecolor'
    set t_Co=256
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Enable term gui colors as if vim was running as gui
if (has("termguicolors"))
    set termguicolors
endif


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" default background
set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Configuration 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Editing
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Ensure the correct python interpreter is sourced for autocompletion
if exists("$VIRTUAL_ENV")
    let g:ycm_python_binary_path = 'python'
else
    let g:ycm_python_binary_path = '/usr/bin/python3'
endif

""" Colorschemes
" Options: tender, monokai
colorscheme monokai


""" Languages

" Rust.vim
" Enable automatic Rust formatting
let g:rustfmt_autosave = 1

" vim-javascript
" Enable syntax hilighting for JSDocs
let g:javascript_plugin_jsdoc = 1


""" Misc

" lightline
" Enable status bar
set laststatus=2
" Disable redundant vim mode beneath status line
set noshowmode
" Advanced configuration
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], 
    \             [ 'gitfugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitfugitive': 'fugitive#statusline'
    \ },
    \ }



