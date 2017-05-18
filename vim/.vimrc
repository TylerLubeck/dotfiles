" vim: set foldmethod=marker foldlevel=0:

" General `set` commands {{{1
set nocompatible                        " Because vi backwards compat is so 1980s
set hidden                              " Hide an unsaved buffer rather than requesting a save
set wildmenu                            
set showcmd                             " Shows the last typed key in command mode
set laststatus=2                        " Always show the status line
set confirm                             " Reminds you to save when you quit
set smartindent                         " Tries to be smart about indenting
set showmatch                           " Highlights matching brackets/parans/quotes
set comments=s1:/*,mb:\ *,elx:\ */      " idk
set filetype=on                         " enables filetype detection
set nu                                  " show linenumber of current line
set relativenumber                      " show distance to lines near me
set backspace=2                         " Make backspace behave appropriately

set expandtab                           " Expands tabs to spaces
set shiftwidth=4                        " >> and << indent by 4
set softtabstop=4                       " How many spaces in a tab when editing
set tabstop=4                           " How many spaces in a tab when displaying

set lazyredraw                          " redraw only when we need to.
set incsearch                           " search as characters are entered
set ignorecase                          " Ignore case when search is all lowercase
set smartcase                           " But pay attention to case if search is cased  
set hlsearch                            " highlight matches
"}}}1

filetype plugin indent on
syntax enable

" Remappings {{{1
nore ; :
nore , ;
"}}}1

"Vim Plug {{{1
call plug#begin('~/.vim/plugged')

"Utilities {{{2
Plug 'mileszs/ack.vim'                                      " <leader> a -> search files using ack/ag
Plug 'tpope/vim-fugitive'                                   " Git commands in VIM
Plug 'tpope/vim-surround'                                   " Stuff for surrounding other stuff
Plug 'tpope/vim-eunuch'                                     " :Rename, :Remove, etc
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }      " Directory Tree
Plug 'scrooloose/syntastic'                                 " Syntax checking for most languages
" Plug 'Valloric/YouCompleteMe'                              " AutoCompletion [DISABLED]
Plug 'puremourning/YouCompleteMe', { 'branch': 'fast-start' } " AutoCompletion [Checking speed compared to the above]
Plug 'SirVer/ultisnips'                                     " Snippets! Hurray!
"}}}2

"Looks {{{2
Plug 'altercation/vim-colors-solarized'  " Solarized colorscheme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"}}}2

"Language Utils {{{2
Plug 'tpope/vim-markdown'                                                       " For markdown code
Plug 'tpope/vim-endwise'                                                        " Adds end statements to blocks. e.g. if/fi in bash
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'htmljinja'] }                 " HTML generation
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp', 'c++'] }                        " Flips between .h and .c files
Plug 'elzr/vim-json'                                                            " Really good json syntax highlighting/folding/concealing
Plug 'mtscout6/syntastic-local-eslint.vim'                                      " Tells syntastic to use a local .eslintrc file
Plug 'fatih/vim-go', { 'for': ['go', 'golang'] }                                " Golang autoindent, syntax checking, type checking
Plug 'suan/vim-instant-markdown' , { 'for': ['markdown', 'md'] }                " Opens a browser window to display rendered markdown
Plug 'tmhedberg/SimpylFold', { 'for': ['python'] }                              " Folding for Python
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }                       " Folding and highlighting for Javascript

"}}}2

call plug#end()

"}}}1

" Configure Ack.vim {{{1
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
"}}}1


" Configure UltiSnips {{{1
let g:UltiSnipsEditSplit = 'context'                " split based on context
let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'     " Put snippets here
let g:UltiSnipsEnableSnipMate = 0                   " Disable snipmate
let g:UltiSnipsExpandTrigger="<c-j>"                " Don't fight YCM
"}}}1

" Solaraized Setup {{{1
set term=screen-256color
set t_ut=
se t_Co=16
set background=dark
colorscheme solarized
"}}}1

" Cursor Behavior {{{1
highlight LineNr ctermfg=238 ctermbg=0
highlight CursorLineNr ctermfg=gray ctermbg=0
set cursorline
set scrolloff=5
"}}}1

"Split Configs {{{1
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
"}}}1
"
"Airling Config {{{1
let g:airline#extensions#tabline#enabled = 1
"}}}1

" Syntastic Config {{{1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
"}}}1
"
" YouCompletMe Config {{{!
let g:ycm_python_binary_path = 'python'                 " Uses venv python
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
"}}}1

" FileType Configs {{{1
autocmd FileType * set colorcolumn=80

" New FileTypes {{{2
au BufNewFile,BufRead *.jinja2  setlocal filetype=htmljinja
au BufNewFile,BufRead *.pyi     setlocal filetype=python    " For mypy stubs
"}}}2

" Ruby Config {{{2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 makeprg=ruby\ %
"}}}2

" Javascript Config {{{2
autocmd FileType javascript setlocal colorcolumn=100 foldmethod=syntax
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
"}}}2

" SCSS Configs {{{2
autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
"}}}2

" Python Configs {{{2
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
"}}}2
"}}}1
