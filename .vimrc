" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

set nocompatible " Vim settings rather than Vi. Must appear first
set backspace=indent,eol,start " allow backspacing in insert mode

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set history=200		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

set softtabstop=4
set shiftwidth=4
set tabstop=4
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType haskell setlocal shiftwidth=8 tabstop=8 softtabstop=8
set expandtab " Spaces instead of tabs
" colorscheme desert
set background=dark
colorscheme solarized
set guifont=monospace\ 13
set number
set ignorecase
set cursorline
set vb " turns off visual bell
au BufNewFile,BufRead *.thtml setfiletype xml
set wildmenu
" set wildmode=list:longest,full
set wildmode=longest:full,full
" Add mouse support in terminal
set mouse=a
runtime! macros/matchit.vim " Load matchit (% to bounce from do end etc.)
" for matchit plugin
" filetype plugin on 

" Insert date time stamp with F5 in either mode
" http://vim.wikia.com/wiki/Insert_current_date_or_time
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>

let g:ragtag_global_maps = 1  " for ragtag plugin

" Completion: http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" I'm not sure about the correct use of these. Look them up.
set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" for nerdtree:
autocmd vimenter * NERDTree
map <silent> <F2> :NERDTreeToggle<CR> " F2 toggles NERDTree

" for vundle, see: https://github.com/gmarik/vundle 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github

" See https://github.com/tpope/vim-ragtag/blob/master/doc/ragtag.txt
Bundle "tpope/vim-ragtag.git" 

Bundle "digitaltoad/vim-jade.git"
Bundle "myhere/vim-nodejs-complete"
Bundle "Lokaltog/vim-easymotion.git"
Bundle "mattn/emmet-vim"
" From http://stackoverflow.com/a/4681507

Bundle "vimwiki/vimwiki"

" Also be sure to do: $ git config --global github.user Username
" Bundle "mattn/gist-vim"

Bundle "altercation/vim-colors-solarized"

" If you enable nerdtree, it also needs the other nerdtree line uncommented.
Bundle "scrooloose/nerdtree.git" 

" See snippets here: https://github.com/SirVer/ultisnips/blob/master/UltiSnips/javascript.snippets
Bundle "SirVer/ultisnips.git" 

Bundle "fholgado/minibufexpl.vim.git"
Bundle "mileszs/ack.vim"
Bundle "nathanaelkane/vim-indent-guides.git"

" use [count]<leader>cc to comment line or selected text
" or [count]<leader>cn to force nesting
" and [count]<leader>cu to uncomment
" See the docs: https://github.com/scrooloose/nerdcommenter
Bundle "scrooloose/nerdcommenter.git"

" Bundle "wavded/vim-stylus.git"
" Bundle "rstacruz/sparkup.git"
" Bundle "teramako/jscomplete-vim.git"
" Bundle "vim-scripts/taglist.vim.git"
" Bundle "godlygeek/tabular.git"
" Bundle "nono/vim-handlebars"
" Bundle "pangloss/vim-javascript"

Bundle "tpope/vim-surround"
Bundle "vim-scripts/Auto-Pairs"


" non github repos

" vim
" Bundle "surround.vim"
" Bundle "jQuery"
Bundle "Markdown"

" To experiment with later:
" http://blogs.atlassian.com/2013/05/git-tig/
" https://github.com/airblade/vim-gitgutter

" For Pathogen and syntastic
execute pathogen#infect()

" For pylint
" autocmd FileType python compiler pylint

" For omnicompletion -- press <ctrl>-x-o
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Use <c-w>f to vsplit the JS file under the cursor
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
