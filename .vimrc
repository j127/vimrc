"""""""""""""""""""""""""""
" Basic Settings
"""""""""""""""""""""""""""

set nocompatible " Vim settings rather than Vi. Must appear first
set backspace=indent,eol,start " allow backspacing in insert mode
set history=200		" lines of command line history
set vb " turns off visual bell

"""""""""""""""""""""""""""
" Interface
"""""""""""""""""""""""""""

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set guifont=monospace\ 12
set number
set ignorecase
set go-=T " Remove toolbar in Gvim
set mouse=a " Add mouse support in terminal
set t_Co=256 " From http://vim.wikia.com/wiki/256_colors_in_vim

if has('gui_running')
  colorscheme desert
else
  colorscheme desert
  "colorscheme zenburn
endif

syntax on
set hlsearch

" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

"""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""

" Change leader to space
let g:mapleader = "\<Space>"
nnoremap <leader>f :w<CR>
nnoremap <leader>n :noh<CR>
nnoremap <leader>b :bd<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>c :
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
nnoremap <leader>s :so %<CR>

" Window management
nnoremap <leader>T :tabnew 
nnoremap <leader>h :sp 
nnoremap <leader>v :vsplit 
nnoremap <leader>w <C-w>

map <silent> <F2> :NERDTreeToggle<CR> " F2 toggles NERDTree
map <silent> <F3> :TlistToggle<CR> " F3 toggles Tlist
map <silent> <F4> :syntax on<CR> " F4 turns on syntax

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

" for youcomopleteme
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""""""""""""""""
" Backup Files
"""""""""""""""""""""""""""

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" Store swap files in fixed location, not current directory.
" From http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

"""""""""""""""""""""""""""
" Text Formatting
"""""""""""""""""""""""""""

set encoding=utf-8
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab " Spaces instead of tabs
autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType slim setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType haskell setlocal shiftwidth=8 tabstop=8 softtabstop=8

"au BufNewFile,BufRead *.py
    "\ set tabstop=4
    "\ set softtabstop=4
    "\ set shiftwidth=4
    "\ set textwidth=79
    "\ set expandtab
    "\ set autoindent
    "\ set fileformat=unix
let python_highlight_all=1

" Get rid of bad whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Prevent Vim from adding two spaces after a period.
" See also: http://stackoverflow.com/questions/4760428/how-can-i-make-vims-j-and-gq-commands-use-one-space-after-a-period
set nojoinspaces

" for nerdtree:
autocmd vimenter * NERDTree

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


"""""""""""""""""""""""""""
" Vundle (required)
"""""""""""""""""""""""""""

" See: https://github.com/gmarik/vundle 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"""""""""""""""""""""""""""
" Bundles
"""""""""""""""""""""""""""

" Better folding
Bundle 'tmhedberg/SimpylFold'

" better Python indentation
Bundle 'vim-scripts/indentpython.vim'

Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'nvie/vim-flake8'

" WakaTime
Bundle 'wakatime/vim-wakatime'

" Line things up
"Bundle 'godlygeek/tabular'

"Bundle "elixir-lang/vim-elixir"

" Version control info in gutter:
Bundle "mhinz/vim-signify"

" Shows TODO items
Bundle "vim-scripts/TaskList.vim"

Bundle "Lokaltog/vim-easymotion.git"
Bundle "mattn/emmet-vim"
Bundle "vim-scripts/taglist.vim"

" If you enable nerdtree, it also needs the other nerdtree line uncommented.
Bundle "scrooloose/nerdtree.git" 
Bundle 'jistr/vim-nerdtree-tabs'

Bundle "fholgado/minibufexpl.vim.git"

" use [count]<leader>cc to comment line or selected text
" or [count]<leader>cn to force nesting
" and [count]<leader>cu to uncomment
" See the docs: https://github.com/scrooloose/nerdcommenter
Bundle "scrooloose/nerdcommenter.git"

" change double quotes to single: cs"'
" remove the single quotes: cs'
" surround word with brackets: ysiw (iw is a text object)
" http://www.vim.org/scripts/script.php?script_id=1697
" from visual mode use S to add
Bundle "tpope/vim-surround"

" non github repos
Bundle "Markdown"

" Mediawiki syntax
Bundle "chikamichi/mediawiki.vim"

Bundle 'jnurmine/Zenburn'

Bundle 'epeli/slimux'

set autoindent		" always set autoindenting on

