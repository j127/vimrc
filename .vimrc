" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

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

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" ADDED BY ME
set softtabstop=4
set shiftwidth=4
set tabstop=4
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType haskell setlocal shiftwidth=8 tabstop=8 softtabstop=8
" Use spaces instead of tabs
set expandtab
colorscheme desert
set guifont=monospace\ 13
set number
set ignorecase
set vb " turns off visual bell
au BufNewFile,BufRead *.thtml setfiletype xml
" see http://lucumr.pocoo.org/articles/vim-as-development-environment
" for more info on wildmenu
set wildmenu
" set wildmode=list:longest,full
" Add mouse support in terminal
set mouse=a
" vim-laravel-snippets
" autocmd FileType php set ft=php.laravel
" Load matchit (% to bound from do end, etc.)
runtime! macros/matchit.vim
" for matchit plugin
" filetype plugin on 
" for ragtag plugin
let g:ragtag_global_maps = 1 

" Completion: http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" I'm not sure about the correct use of these. Look them up.
" set completeopt=longest,menuone
" set ofu=syntaxcomplete#Complete

" for nerdtree:
autocmd vimenter * NERDTree

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
" Bundle "kchmck/vim-coffee-script.git"
" Bundle "pangloss/vim-javascript"
Bundle "digitaltoad/vim-jade.git"
" Bundle "wavded/vim-stylus.git"
" Bundle "rstacruz/sparkup.git"
" Bundle "teramako/jscomplete-vim.git"
Bundle "myhere/vim-nodejs-complete"
" Bundle "MarcWeber/vim-addon-mw-utils.git"
" Bundle "tomtom/tlib_vim.git"
Bundle "Lokaltog/vim-easymotion.git"
" Bundle "mattn/zencoding-vim.git"
Bundle "mattn/emmet-vim"
" Bundle "vim-scripts/taglist.vim.git"
" Bundle "godlygeek/tabular.git"
" If you enable nerdtree, it also needs the other nerdtree line uncommented.
Bundle "scrooloose/nerdtree.git"
" See snippets here: https://github.com/SirVer/ultisnips/blob/master/UltiSnips/javascript.snippets
Bundle "SirVer/ultisnips.git"
Bundle "fholgado/minibufexpl.vim.git"
" Bundle "johnhamelink/blade.vim.git"
" Bundle "garbas/vim-snipmate.git"
" Bundle "MarcWeber/vim-addon-mw-utils.git"
" Bundle "https://github.com/tomtom/tlib_vim.git"
" Bundle "honza/snipmate-snippets"
" Bundle "nono/vim-handlebars"
Bundle "mileszs/ack.vim"
Bundle "nathanaelkane/vim-indent-guides.git"
" non github repos

" vim
Bundle "surround.vim"
" Bundle "jQuery"
Bundle "Markdown"

" For Pathogen and syntastic
execute pathogen#infect()

" For pylint
" autocmd FileType python compiler pylint

" For Django omnicompletion
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
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
