" TODO: clean this file up

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

" Store swap files in fixed location, not current directory.
" From http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

set history=200		" lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Prevent Vim from adding two spaces after a period.
" See also: http://stackoverflow.com/questions/4760428/how-can-i-make-vims-j-and-gq-commands-use-one-space-after-a-period
set nojoinspaces

" Don't use Ex mode, use Q for formatting
map Q gq

" Wrap Python files at 79 for PEP8
au BufRead,BufNewFile *.py setlocal textwidth=79

" Line formatting stuff
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab " Spaces instead of tabs
" normally 11
set guifont=monospace\ 10
set number
set ignorecase
" Remove toolbar - 'go' is short for guioptions
set go-=T
" Highlights cursor line
" set cursorline
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType haskell setlocal shiftwidth=8 tabstop=8 softtabstop=8

set vb " turns off visual bell
" Add mouse support in terminal
set mouse=a

au BufNewFile,BufRead *.thtml setfiletype xml
set wildmenu
" set wildmode=list:longest,full
set wildmode=longest:full,full
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

Bundle 'godlygeek/tabular'

"Bundle "bling/vim-airline"
"let g:airline_powerline_fonts = 1
" If the above doesn't work, double check here: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation -- it's working on my laptop though

" Bundle "edkolev/tmuxline.vim"
" let g:airline#extensions#tmuxline#enabled = 0

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" Version control info in gutter:
Bundle "mhinz/vim-signify"

" Color themes
Bundle "Lokaltog/vim-distinguished"
Bundle "29decibel/codeschool-vim-theme"
" Bundle "twilight.vim"

" From http://vim.wikia.com/wiki/256_colors_in_vim
set t_Co=256
" colorscheme distinguished
"colorscheme desert
" set background=dark
" colorscheme solarized
if has("gui_running")
  set background=dark
  colorscheme distinguished
else
  colorscheme desert
endif

" Rainbow Parentheses
"Bundle "oblitum/rainbow"
"let g:rainbow_active = 1

Bundle "mbbill/undotree"
map <silent> <F7> :UndotreeToggle<CR> " F7 toggles undotree

" Read more at https://github.com/kien/ctrlp.vim#ctrlpvim
Bundle "kien/ctrlp.vim"
" Ignore vendor files in CtrlP
set wildignore+=*/vendor/**

" See https://github.com/tpope/vim-ragtag/blob/master/doc/ragtag.txt
Bundle "tpope/vim-ragtag.git" 

" Shows TODO items
Bundle "vim-scripts/TaskList.vim"

" Python Jedi stuff
Bundle "davidhalter/jedi-vim"

" Easy Align: https://github.com/junegunn/vim-easy-align#vim-easy-align
"Bundle "junegunn/vim-easy-align"
" Start interactive EasyAlign in visual mode
"vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign with a Vim movement
"nmap <Leader>a <Plug>(EasyAlign)

"Bundle "digitaltoad/vim-jade.git"
"Bundle "myhere/vim-nodejs-complete"
Bundle "Lokaltog/vim-easymotion.git"
Bundle "mattn/emmet-vim"
" From http://stackoverflow.com/a/4681507

Bundle "vim-scripts/taglist.vim"
map <silent> <F3> :TlistToggle<CR> " F3 toggles Tlist

" Requires node.js or similar
" Bundle "hallettj/jslint.vim"

Bundle "vimwiki/vimwiki"
Bundle "jceb/vim-orgmode"

" Bundle "groenewege/vim-less"
Bundle "tpope/vim-haml"

Bundle "mattn/webapi-vim"
" Also be sure to do: $ git config --global github.user Username
Bundle "mattn/gist-vim"
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Bundle "altercation/vim-colors-solarized"

" Bundle "wookiehangover/jshint.vim"
" map <silent> <F6> :JSHintToggle<CR> " F6 toggles jshint

" If you enable nerdtree, it also needs the other nerdtree line uncommented.
Bundle "scrooloose/nerdtree.git" 

" See snippets here: https://github.com/SirVer/ultisnips/blob/master/UltiSnips/javascript.snippets
Bundle "SirVer/ultisnips.git" 
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-space>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
Bundle "Valloric/YouCompleteMe"

Bundle "fholgado/minibufexpl.vim.git"
Bundle "mileszs/ack.vim"
Bundle "nathanaelkane/vim-indent-guides.git"
Bundle "mustache/vim-mode"

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
Bundle "vim-scripts/Auto-Pairs"

" Bundle "vim-scripts/vim-stylus"

" non github repos
Bundle "Markdown"
Bundle "juvenn/mustache.vim.git"

" Mediawiki syntax
Bundle "chikamichi/mediawiki.vim"

" To experiment with later:
" http://blogs.atlassian.com/2013/05/git-tig/
" https://github.com/airblade/vim-gitgutter
Bundle "johnhamelink/blade.vim.git"
Bundle "markwu/vim-laravel4-snippets"
autocmd FileType php set ft=php.laravel

" Abbreviations
abbrev pft PHPUnit_Framework_TestCase
 
"abbrev gm !php artisan generate:model
"abbrev gc !php artisan generate:controller
"abbrev gmig !php artisan generate:migration

" For Pathogen and syntastic
" See also this page to install language support: https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers
execute pathogen#infect()
Bundle "scrooloose/syntastic"

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


" Turn HTML into JS and back
" vmap <silent> ;q :s?^\(\s*\)\(.*\)\s*$? \1 + '\2'?<CR>
" vmap <silent> ;h :s?^\(\s*\)+ '\([^']\+\)',*\s*$?\1\2?g<CR>:noh<CR>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  map <silent> <F4> :syntax on<CR> " F4 turns on syntax
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
