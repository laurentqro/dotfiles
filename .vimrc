" ------------------------------------------------------------------------------
"          FILE: .vimrc
"   DESCRIPTION: Vim configuration file.
"        AUTHOR: Laurent Curau
"        Heavily inspired by Gus Bonfante and Will Raxworthy dotfiles. :)
" ------------------------------------------------------------------------------

" Set encoding to UTF-8
scriptencoding utf-8
set encoding=utf-8

" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------

call plug#begin("~/.vim/plugged")

"" UI
Plug 'junegunn/seoul256.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/rainbow_parentheses.vim'

"" Navigation
Plug 'kien/ctrlp.vim'
Plug 'justinmk/vim-gtfo'

"" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'

"" Languages
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'

"" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

call plug#end()

" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" -----------------------------------------------------------------------------
" syntastic
" -----------------------------------------------------------------------------
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_error_symbol = "☠"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "☢"
let g:syntastic_style_warning_symbol = "☹"

" -----------------------------------------------------------------------------
" lightline
" -----------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'fileformat': 'LightlineFileFormat',
      \   'fileencoding': 'LightlineFileEncoding',
      \ }
      \ }

function! LightlineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightlineFileFormat()
  return ''
endfunction

function! LightlineFileEncoding()
  return ''
endfunction

" -----------------------------------------------------------------------------
" vim-signify
" -----------------------------------------------------------------------------
let g:signify_vcs_list = ['git']

" -----------------------------------------------------------------------------
" General Settings
" -----------------------------------------------------------------------------

" Enable syntax highlighting
syntax enable

" Set colorscheme
set background=dark
colorscheme desert

" Notify of running fast terminal, improves redrawing
set ttyfast

" Don't redraw when running macros
set lazyredraw

" Maximum column number to highlight
set synmaxcol=250

" Display column at 80 characters
set colorcolumn=80

" Show (relative) line numbers
set number
set relativenumber

" Enable autoindent
set autoindent

" Show bracket matches
set showmatch

" Enable auto-reading of files if they have been changed from the outside
set autoread

" Save on 'focus' switch
set autowrite
set autowriteall

" Sane backspacing
set backspace=indent,eol,start

" Disable backup files
set nobackup
set noswapfile

" Hide buffers instead of closing them
set hidden

" Split new buffers to the right
set splitright

" Autocomplete commands
set showcmd
set wildmenu

" Hightlight search matches
set hlsearch

" Incremental search
set incsearch

" Case-insensitive searching
set ignorecase

" Use case-sensitive searching if expression contains capital letter
set smartcase

" Apply global substitutions by default
set gdefault

" Hightlight whitespace characters
set list
set listchars=tab:▸\ ,trail:·

" Use 2 spaces for indentation
set expandtab
set tabstop=2
set shiftwidth=2

" Use the system clipboard for yanking
set clipboard=unnamed

" Disable beeping sounds
set noerrorbells
set novisualbell

" Display status var
set laststatus=2

" Don't show default vim mode information
set noshowmode

" Set leader key to space
let mapleader="\<space>"

" -----------------------------------------------------------------------------
" vim-rspec
" -----------------------------------------------------------------------------

nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>
