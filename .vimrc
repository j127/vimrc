"""""""""""""""""""""""""""
" Notes
"""""""""""""""""""""""""""

" For Python2 support on Ubuntu 16.04 you may need to install
" one of the vim versions with `py2` in the name.
" Then change the default vim with this command:
" $ sudo update-alternatives --config vim
"
" To fix nvim's delay when switching into insert mode, you may
" need to put the following line in ~/.tmux-conf
" # Prevent delay when hitting ESC in nvim
" # http://superuser.com/a/942704
" set -sg escape-time 10

"""""""""""""""""""""""""""
" Basic Settings
"""""""""""""""""""""""""""
set nocompatible " Vim settings rather than Vi. Must appear first
set history=999
set go-=T  " Remove the toolbar in gvim
   
" Height of the command bar
set cmdheight=1

set number

" Auto-completion for command mode
set wildmenu
set wildmode=list:full,full

" Highlight line and column
set cursorline
set cursorcolumn

set history=999

set guifont=Inconsolata\ for\ Powerline\ 15

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Enable mouse support
set mouse=a

" Colors and Fonts
colorscheme "colorsbox-material"

" Configure backspace so it acts as it should act
" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Force redraw
map <silent> <leader>r :redraw!<CR>

" Turn of error sounds
set noerrorbells
set vb t_vb=


"""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
" set magic

" Show matching brackets
" set showmatch
" 4/10 of a second to jump back to matching brace
" set matchtime=4
" For more info on matching, including matchit.vim, see:
" http://vim.wikia.com/wiki/Moving_to_matching_braces



"""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""

" Use indentation for folds
" toggle: za, close all: zM, open all: zR
" set foldmethod=indent
" set foldnestmax=5
" set foldlevelstart=99
" set foldcolumn=0

"""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""

" See Plugin Settings for additional keybindings
let g:mapleader = "\<Space>"
let maplocalleader = "\\"

nnoremap <leader>f :w<CR>
nnoremap <leader>noh :noh<CR>
nnoremap <leader>b :bd<CR>
nnoremap <leader>c :
" nnoremap <leader>p "+p
nnoremap <leader>P "+P
" nnoremap <leader>y "+y
nnoremap <leader>s :so ~/.vimrc<CR>
nnoremap <leader>g :gui<CR>

" Copy and paste to os clipboard
nmap <leader>y "*y
vmap <leader>y "*y
nmap <leader>d "*d
vmap <leader>d "*d
nmap <leader>p "*p
vmap <leader>p "*p

" Window management
nnoremap <leader>t :tabnew 
nnoremap <leader>h :sp 
nnoremap <leader>v :vsplit 
nnoremap <leader>w <C-w>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Switch between % (current) and # (alternate) as listed in :buffers
" http://stackoverflow.com/a/133895/1365699
nmap <F2> :e#<CR>

" Leader key timeout
set tm=1000

call plug#begin('~/.vim/bundle')

" Themes
" Plug 'j127/desertimp.vim'
Plug 'mkarmona/colorsbox'
" Plug 'keith/parsec.vim'
" Plug 'cseelus/vim-colors-lucid'

" Support bundles
" Plug 'epeli/slimux'
" Plug 'jgdavey/tslime.vim'
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'ervandew/supertab'
" Plug 'benekastah/neomake'
" Plug 'moll/vim-bbye'

" <Leader>ig to turn on indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Extends the functionality of % so that it includes tags and not just
" brackets.
Plug 'tmhedberg/matchit'

Plug 'vim-scripts/gitignore'

" Git
" Plug 'tpope/vim-fugitive'
" Plug 'int3/vim-extradite'

" Bars, panels, and files
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'majutsushi/tagbar'
" Plug 'tpope/vim-vinegar' " use `-`, `.`, `cg`, `lcd`, `~`
" Plug 'Shougo/unite.vim'
" Plug 'scrooloose/nerdtree'

" Plug 'luochen1990/rainbow'

" Text manipulation
" Plug 'vim-scripts/Align'
" Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'  " `gcc`, `gcu`
Plug 'jiangmiao/auto-pairs'
" Plug 'godlygeek/tabular'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'easymotion/vim-easymotion'
" Plug 'tpope/vim-surround'

" Allow pane movement to jump out of vim into tmux
" Plug 'christoomey/vim-tmux-navigator'

" Haskell
" Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
" Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
" Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
" Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }

" Elm

" Plug 'lambdatoast/elm.vim'
" Plug 'ElmCast/elm-vim'

" Markdown
" Plug 'tpope/vim-markdown'

" Docker
" Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}

" Adding back some old ones, July 26, 2016
" Plug 'Shougo/neocomplete.vim'
" Plug 'SirVer/ultisnips'

" Tab completion features. NOT NEEDED IF USING YOUCOMPLETEME.
" Plug 'ervandew/supertab'
" Plug 'honza/vim-snippets'
" Plug 'Valloric/YouCompleteMe'
" Plug 'scrooloose/syntastic'
" Plug 'jmcomets/vim-pony'  " Django
" Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
" Plug 'terryma/vim-multiple-cursors'
" Plug 'mattn/emmet-vim'
" Plug 'mhinz/vim-signify'
" Plug 'junegunn/vim-easy-align' " visual mode then `ga`
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'jceb/vim-orgmode'
" Plug 'tpope/vim-speeddating'
call plug#end()

"""""""""""""""""""""""""""
" Plugin Config
"""""""""""""""""""""""""""

"--------------------------
" Airline
"--------------------------

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='sol'
" Use powerline fonts for airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
