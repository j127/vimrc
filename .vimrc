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
set history=50		" keep 50 lines of command line history
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
set softtabstop=2
set shiftwidth=2
set tabstop=2
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
" Load matchit (% to bound from do end, etc.)
runtime! macros/matchit.vim
" For Lilypond
set runtimepath+=/usr/local/share/vim/
" for matchit plugin
" filetype plugin on 
" for ragtag plugin
let g:ragtag_global_maps = 1 

" for nerdtree:
" autocmd vimenter * NERDTree

" My shortcuts
" ab <a <a href="http://
" ab doc <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html>
" ab htmltag <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
" ab template <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"><head><title></title><meta name="description" content="" /><meta name="keywords" content="" /><style type="text/css">body {  }#container {  }#content {  }h1 {  }h2 {  }#footer {  }img {  }</style></head><body><div id="container"><div id="content"><h1></h1></div><!-- /#content --><div id="footer"><p>Copyright &copy; <?php echo date("Y"); ?> <a href="/"></a></p></div></div><!-- /#container --></body></html>
ab --- --------------------
ab === ====================

" for vundle, see: https://github.com/gmarik/vundle 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" for this plugin: https://github.com/teramako/jscomplete-vim 
autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS

" for this plugin: https://github.com/myhere/vim-nodejs-complete 
" set let g:node_usejscomplete = 1

" For taglist.vim with ctags. If there is an error mentioning ctags, download
" ctags and modify/uncomment the following line:
" let Tlist_Ctags_Cmd = '/home/username/ctags-5.8/'

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle "kchmck/vim-coffee-script.git"
Bundle "pangloss/vim-javascript"
Bundle "digitaltoad/vim-jade.git"
Bundle "wavded/vim-stylus.git"
Bundle "rstacruz/sparkup.git"
Bundle "garbas/vim-snipmate.git"
Bundle "teramako/jscomplete-vim.git"
Bundle "myhere/vim-nodejs-complete"
Bundle "MarcWeber/vim-addon-mw-utils.git"
Bundle "tomtom/tlib_vim.git"
Bundle "Lokaltog/vim-easymotion.git"
Bundle "mattn/zencoding-vim.git"
Bundle "vim-scripts/taglist.vim.git"
Bundle "godlygeek/tabular.git"
" If you enable nerdtree, it also needs the other nerdtree line uncommented.
" Bundle "scrooloose/nerdtree.git"
Bundle "fholgado/minibufexpl.vim.git"
" non github repos

" vim
Bundle "surround.vim"
Bundle "jQuery"
Bundle "Markdown"


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
  autocmd FileType text setlocal textwidth=78

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

