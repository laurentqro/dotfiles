"          FILE: .vimrc
"   DESCRIPTION: Vim configuration file.
"        AUTHOR: Laurent Curau
"        Heavily inspired by Gus Bonfante and Will Raxworthy dotfiles. :)
" ------------------------------------------------------------------------------
" Set leader key to space
let mapleader=" "

" Set encoding to UTF-8
scriptencoding utf-8
set encoding=utf-8

" ------------------------------------------------------------------------------
" Plugins
" ------------------------------------------------------------------------------

call plug#begin("~/.vim/plugged")

"" UI
Plug 'junegunn/seoul256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/rainbow_parentheses.vim'

"" Navigation
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'justinmk/vim-gtfo'

"" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'

"" Languages
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'skalnik/vim-vroom'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-rvm'
Plug 'elixir-lang/vim-elixir'
Plug 'lambdatoast/elm.vim'

"" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

call plug#end()

" ------------------------------------------------------------------------------
" Mappings
" ------------------------------------------------------------------------------

" Type jj to escape
imap jj <Esc>

" Arrow keys no op
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" easy pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W>

" Go to last migration file
map <Leader>m :Rmigration<CR>

" Go to Gemfile
map <Leader>g :sp Gemfile<CR>

" Rails
map <Leader>em :Emodel<CR>
map <Leader>ec :Econtroller<CR>

map <Leader>vm :Vmodel<CR>
map <Leader>vc :Vcontroller<CR>

" easy switching between last two files
nnoremap <Leader><Leader> <C-^>

" copy current file path
nnoremap <silent> <Leader>p :let @* = expand("%")<CR>

" easy global search
nnoremap <C-S> :Ag <C-R><C-W><CR>
vnoremap <C-S> y<Esc>:Ag '<C-R>"'<CR>

" vimrc manipulation
nnoremap <Leader>vv :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" open file in same folder
cnoremap %% <C-R>=expand('%:h').'/'<CR>
nmap <Leader>e :e %%

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
      \             [ 'fugitive', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \ }
      \ }

function! LightlineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

" -----------------------------------------------------------------------------
" vim-signify
" -----------------------------------------------------------------------------
let g:signify_vcs_list = ['git']

" -----------------------------------------------------------------------------
" ctrlp-matcher
" -----------------------------------------------------------------------------
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

" -----------------------------------------------------------------------------
" General Settings
" -----------------------------------------------------------------------------

" Enable syntax highlighting
syntax enable

" Set colorscheme
set background=dark
colorscheme solarized

" Notify of running fast terminal, improves redrawing
set ttyfast

" Don't redraw when running macros
set lazyredraw

" Maximum column number to highlight
set synmaxcol=250

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

" Exclude files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" -----------------------------------------------------------------------------
" vroom
" -----------------------------------------------------------------------------

au FileType ruby nmap <Leader>t <CR>:VroomRunTestFile<CR>
au FileType ruby nmap <Leader>s <CR>:VroomRunNearestTest<CR>

let g:vroom_use_spring = 1
let g:vroom_map_keys = 0
let g:vroom_write_all = 1

" -----------------------------------------------------------------------------
" I am only human
" -----------------------------------------------------------------------------
command! W w

command! Q q
