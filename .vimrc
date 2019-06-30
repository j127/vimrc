" More ideas: https://dougblack.io/words/a-good-vimrc.html
"
" Python with virtualenv support
" py << EOF
" import os
" import sys
"if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

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

" This is just to prevent an error with nerdtree-git-plugin in neovim
" https://github.com/Xuyuanp/nerdtree-git-plugin
set shell=sh

" Security, see: https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set nomodeline

if has("gui_running")
    set go-=T  " Remove toolbar
endif

" Always display the status line.
set laststatus=2

" Height of the command bar
set cmdheight=1

set number
syntax enable

" Remove toolbar in gvim
set guioptions-=T

" Auto-completion for command mode
set wildmenu
set wildmode=list:full,full

" Ignore these
set wildignore+=*.pyc
set wildignore+=*.o
set wildignore+=*~
set wildignore+=*.so
set wildignore+=*.obj
set wildignore+=*.svn
set wildignore+=*.swp
set wildignore+=*.class
set wildignore+=*.hg
set wildignore+=*.DS_Store
set wildignore+=*.min.*
set wildignore+=__pycache__/*
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=tags.*
set wildignore+=tags
set wildignore+=.vscode/*
set wildignore+=.idea/*
" set wildignore+=*/tmp/*
" set wildignore+=*/build/*
" set wildignore+=*/dist/*
set wildignore+=*.zip
set wildignore+=*.pdf
set wildignore+=*.so

" This should show non-printing characters but may not be working.
set list lcs=tab:>-,trail:\.,extends:»,precedes:«,nbsp:%

" Isn't toggling correctly
" Highlight line and column
set cursorline
set cursorcolumn

" fu! ToggleCurline ()
"     if &cursorline && &cursorcolumn
"         set nocursorline
"         set nocursorcolumn
"     else
"         set cursorline
"         set cursorcolumn
"     endif
" endfunction

" map <silent><leader>c :call ToggleCurline()<CR>
" nnoremap <leader>c :call ToggleCurline()<CR>


" Highlight 80th column
set colorcolumn=80

" For more info on matching, including matchit.vim, see:
" http://vim.wikia.com/wiki/Moving_to_matching_braces
" Show matching brackets
set showmatch
" 4/10 of a second to jump back to matching brace
set matchtime=4

" Scroll offset keeps the cursor closer to the middle of the editor.
" so=7 will start scrolling 7 lines from the top or bottom.
" This was removed, because it causes problems with the background color
" set so=2

" Enable mouse support
set mouse=a

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Force redraw
" map <silent> <leader>r :redraw!<CR>
" nnoremap <leader>r :redraw!<CR>

" Turn of error sounds
set noerrorbells
set vb t_vb=


" Open file prompt with current path
" nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

"""""""""""""""""""""""""""
" Buffers, Windows, Tabs
"""""""""""""""""""""""""""

" Tab labels
if has("gui_running")
    set go-=e
    set guitablabel=%M\ %t
endif

" Don't close buffers that aren't being displayed.
set hidden

" Previous buffer, next buffer
" These were slowing down the <leader>b command
" nnoremap <leader>bp :bp<cr>
" nnoremap <leader>bn :bn<cr>

" close every window in current tabview but the current
" nnoremap <leader>bo <c-w>o

" convert double quotes to single quotes on the current line or in a visual
" selection
nnoremap <leader>' :s/"/'/g<cr>:noh<cr>
nnoremap <leader><leader>' :s/"/'/gc<cr>:noh<cr>
vnoremap <leader>' :s/"/'/g<cr>:noh<cr>
vnoremap <leader><leader>' :s/"/'/gc<cr>:noh<cr>

" visually select line without the newline on the end
nnoremap <leader><leader>v $v0

" move to the char after the target char: replacing things like f>l
"nnoremap <leader>f

"""""""""""""""""""""""""""
" Indentation
"""""""""""""""""""""""""""

" Configure backspace so it acts as it should act
" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

set smarttab

set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab " Spaces instead of tabs
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType elixir setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType go setlocal shiftwidth=8 tabstop=8 softtabstop=8 noexpandtab
autocmd FileType vue syntax sync fromstart

autocmd BufNewFile,BufRead *.js.es6 set syntax=javascript

"""""""""""""""""""""""""""
" Text Formatting & Editing
"""""""""""""""""""""""""""

" Use par for better `gq` formatting
" See http://vimcasts.org/episodes/formatting-text-with-par/
set formatprg=par
let $PARINIT = 'rTbgqR B=.,?_A_a Q=_s>|'

" Prevent Vim from adding two spaces after a period.
" See also: http://stackoverflow.com/questions/4760428/how-can-i-make-vims-j-and-gq-commands-use-one-space-after-a-period
set nojoinspaces

set ai  " Auto indent
set si  " Smart indent
set wrap  " Soft-wrap lines
set textwidth=0 wrapmargin=0 " Don't automatically hard-wrap lines.

" Don't use the following line with nvim, since it already uses utf8.
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Spell checking toggle
map <leader>ss :setlocal spell!<cr>


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

" Use pleasant but very visible search highlighting
hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search

" TODO: make sure that this feature works.
" Delete trailing white space on save
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

augroup whitespace
    autocmd!
    autocmd BufWrite *.hs :call DeleteTrailingWS()
augroup END

"""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""

" Use indentation for folds
" toggle: za, close all: zM, open all: zR
" fold (zf), open (zo), close (zc), delete (zd), etc.
set foldmethod=manual
set foldcolumn=1  " non-zero value turns on the fold column in the gutter
" set foldnestmax=5
" set foldlevelstart=99

"""""""""""""""""""""""""""
" Backups
"""""""""""""""""""""""""""

if has("vms")
    set nobackup
else
    set backup
endif

" Store swap files in fixed location, not current directory.
" From http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" Save info about the file in .viminfo
set viminfo^=%

"""""""""""""""""""""""""""
" Unicode Substitution
"""""""""""""""""""""""""""

hi clear Conceal

"""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""


" See Plugin Settings for additional keybindings
let g:mapleader = "\<Space>"
let maplocalleader = "\\"

" nnoremap <leader>f :w<CR> " this is now used for Ranger
nnoremap <leader>n :noh<CR>
nnoremap <leader>b :bd<CR>
" nnoremap <leader>c :
" nnoremap <leader>p "+p
nnoremap <leader>P "+P
" nnoremap <leader>y "+y
nnoremap <leader>s :so ~/.vimrc<CR>
nnoremap <leader>g :gui<CR>

" Copy and paste to os clipboard
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>d "+d
vmap <leader>d "+d
nmap <leader>p "+p
vmap <leader>p "+p

" Window management
" t is now for showing TODO items
" nnoremap <leader>t :tabnew 
nnoremap <leader>h :sp 
nnoremap <leader>v :vsplit 
nnoremap <leader>w <C-w>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" Switch between % (current) and # (alternate) as listed in :buffers
" http://stackoverflow.com/a/133895/1365699
nmap <F2> :e#<CR>

noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l

" Arrow keys resize splits
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Better indentation
nnoremap <tab> >>
nnoremap <S-tab> <<
vnoremap <tab> >
vnoremap <S-tab> <

" ctrl-backspace to delete w
" I don't know why it isn't working in nvim
"https://vim.fandom.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
" inoremap <C-w> <C-\><C-o>dB
" inoremap <C-BS> <C-\><C-o>db
" This doesn't work either:
" noremap! <C-BS> <C-w>
" noremap! <C-h> <C-w>
"--------------------------
" Directories
"--------------------------

" Change the current dir of all windows to the open file.
" See also `:pwd` and `autocmd BufEnter * silent! lcd %:p:h` for
" other ways to manage this.
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" TODO: the items below don't seem to work
" `%:p` gives its full path, and `%:p:h` gives its directory (the "head"
" of the full path).
nnoremap <leader>d :cd %:p:h<CR>
" Only change the directory of the current file.
nnoremap <leader>dl :lcd %:p:h<CR>

" Leader key timeout
set tm=1000

call plug#begin('~/.vim/bundle')

" Themes
" Plug 'j127/desertimp.vim'
Plug 'mkarmona/colorsbox'
" Plug 'keith/parsec.vim'
" Plug 'cseelus/vim-colors-lucid'
Plug 'flazz/vim-colorschemes'
Plug 'jacoborus/tender.vim'

" Support bundles
Plug 'epeli/slimux'
" Plug 'jgdavey/tslime.vim'
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'ervandew/supertab'
" Plug 'benekastah/neomake'
" Plug 'moll/vim-bbye'

" <leader>t to show TODOs
" Plug 'vim-scripts/TaskList.vim'

Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" <Leader>ig to turn on indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Extends the functionality of % so that it includes tags and not just
" brackets.
Plug 'tmhedberg/matchit'

Plug 'vim-scripts/gitignore'

" ctags
" ctrl-click on something to go to definition, and ctrl-o to return
" visually selecting the name and c-] should also jump to the definition.
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Git
" Plug 'tpope/vim-fugitive'
" Plug 'int3/vim-extradite'

" Bars, panels, and files
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'majutsushi/tagbar'
" Plug 'tpope/vim-vinegar' " use `-`, `.`, `cg`, `lcd`, `~`
Plug 'Shougo/denite.nvim'
Plug 'liuchengxu/vista.vim'

" this installs fzf on the system as well
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/deol.nvim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'luochen1990/rainbow'

" For vimdeck
" https://github.com/tybenz/vimdeck
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/ingo-library'

" Text manipulation
" Plug 'vim-scripts/Align'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'  " `gcc`, `gcu`
Plug 'jiangmiao/auto-pairs'
" Plug 'godlygeek/tabular'
" Plug 'michaeljsmith/vim-indent-object'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'

" Allow pane movement to jump out of vim into tmux
" Plug 'christoomey/vim-tmux-navigator'

" Haskell
" Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
" Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
" Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
" Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }

" Purescript
" Plug 'frigoeu/psc-ide-vim'
" Plug 'purescript-contrib/purescript-vim'

" Ranger file manager
" Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Vue.js
Plug 'posva/vim-vue'

" Svelte
Plug 'j127/vim-svelte'

" Elm

" Plug 'lambdatoast/elm.vim'
Plug 'ElmCast/elm-vim'
Plug 'w0rp/ale'
" Too annoying for JS, but otherwise good
" Plug 'calebsmith/vim-lambdify'

" Testing
Plug 'janko-m/vim-test'

" golang
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'jmcomets/vim-pony'  " Django
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
" Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
" Plug 'mhinz/vim-signify'
Plug 'junegunn/vim-easy-align' " visual mode then `ga`
" Plug 'dhruvasagar/vim-table-mode'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'bronson/vim-trailing-whitespace'

Plug 'editorconfig/editorconfig-vim'

" Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-bundler'

Plug 'mustache/vim-mustache-handlebars'

" nand2tetris
Plug 'sevko/vim-nand2tetris-syntax'

" Ghost text -- edit Firefox text areas
" Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}

"JavaScript

" Typescript
" ctrl-] and ctrl-t to go to definitions and back
" ctrl-^ to find where the symbol is referenced
" :TsuTypeDefinition - navigate to the location where the type of the symbol is defined
" :TsuSearch {keyword} - list locations of keyword
" :TsuGeterr
" :TsuGeterrProject
" :TsuQuickFix
" :TsuReloadProject -- after changing tsconfig.json file, if ts files are open at the time.
" :TsuRenameSymbol -- rename identifier under the cursor
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
" Plug 'jason0x43/vim-js-indent' " for indenting features in JS/TS
" More typescript plugins: https://github.com/Quramy/tsuquyomi#relevant-plugins

Plug 'mhinz/vim-startify'

Plug 'pangloss/vim-javascript' ", { 'for': ['javascript', 'json', 'vue'] }
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" This should always be last
Plug 'ryanoasis/vim-devicons'
call plug#end()

" Colors and Fonts -- colorscheme should be loaded after Plug.
" Enable truecolors
set termguicolors
set background=dark
if has("gui_running")
    " TODO: figure out why this dashed name isn't loading the theme.
    " colorscheme colorsbox-material
    " colorscheme bclear
    colorscheme tender
else
    " various themes that are good, depending on mood and lighting
    " colorscheme twilight256
    " colorscheme colorsbox-material
    " colorscheme tender
    " colorscheme desert
    " colorscheme codeschool
    " colorscheme badwolf
    colorscheme gruvbox
    " colorscheme quantum
    " colorscheme onedark
    " colorscheme distinguished
endif

set guifont=Inconsolata\ for\ Powerline\ 15

set t_Co=256
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif


"""""""""""""""""""""""""""
" Plugin Config
"""""""""""""""""""""""""""

"--------------------------
" Airline
"--------------------------

set laststatus=2

let g:airline_powerline_fonts=1
" let g:airline_theme='sol'
let g:airline_theme='tender'

" Use powerline fonts for airline
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

let g:airline_symbols.space="\ua0"

"--------------------------
" Mundo (Persistent Undo)
"--------------------------

" Show undo tree
nmap <silent> <leader>u :MundoToggle<CR>

" vim-mundo: Enable persistent undo across sessions
set undofile
set undodir=~/.vim/undo


"--------------------------
" Slimux
"--------------------------
" Slimux
map <C-c><C-s> :SlimuxREPLConfigure<CR>
nmap <C-c><C-s> :SlimuxREPLConfigure<CR>
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
map <C-c><C-b> :SlimuxREPLSendBuffer<CR>
vmap <C-c><C-b> :SlimuxREPLSendBuffer<CR>

" Activate rainbow
let g:rainbow_active = 1

" Nerdtree
" I think the next two lines auto-opens it(?)
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Keep certain files out of nerdtree (see wildignore settings)
let NERDTreeRespectWildIgnore=1

" Indent guides
" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray21 ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray26 ctermbg=234

" Unite
" See:
" http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/
" let g:unite_source_history_yank_enable = 1
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <C-p> :Unite file_rec/async<cr>
" nnoremap <space>/ :Unite grep:.<cr>
" nnoremap <space>y :Unite history/yank<cr>
" nnoremap <space>s :Unite -quick-match buffer<cr>
" nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
" nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
" nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" " Custom mappings for the unite buffer
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   " Play nice with supertab
"   let b:SuperTabDisabled=1
"   " Enable navigation with control-j and control-k in insert mode
"   imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"   imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
" endfunction

" youcompleteme
" highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
" Elm integration
" let g:ycm_semantic_triggers = {
"      \ 'elm' : ['.'],
"      \}

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Emmet
" Tab trigger
" https://coderwall.com/p/_uhrxw/using-tab-key-as-abbreviation-expander-on-emmet-vim
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Taglist
nmap <F8> :TagbarToggle<CR>

" vim-test
" https://github.com/janko-m/vim-test
" This may need more configuration to work correctly.
let test#strategy = "neovim"
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

" Denite
" nnoremap <C-p> :<C-u>Denite file_rec<CR>

" tsuquyomi
" Tooltoops
autocmd FileType typescript nmap <buffer> <leader>z : <C-u>echo tsuquyomi#hint()<CR>

" From https://stackoverflow.com/a/3691124
function! Browser ()
    normal yy
    new
    execute ".!elinks -dump " . @"
    set nomodified
endfunction
nmap owp :call Browser ()<CR>

" ALE experiments from
" https://github.com/sodiumjoe/dotfiles/blob/master/vimrc#L288 
" let g:ale_sign_error = '⨉'
" let g:ale_sign_warning = '⚠'
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
" let g:ale_lint_on_text_changed = 0
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_enter = 1
" " cycle through location list
" nmap <silent> <leader>n <Plug>(ale_next_wrap)
" nmap <silent> <leader>p <Plug>(ale_previous_wrap)

" Denite ideas from https://github.com/sodiumjoe/dotfiles/blob/master/vimrc#L242 and elsewhere.
" reset 50% winheight on window resize
" augroup deniteresize
"   autocmd!
"   autocmd VimResized,VimEnter * call denite#custom#option('default',
"         \'winheight', winheight(0) / 2)
" augroup end

" autocmd FileType denite call s:denite_my_settings()
" function! s:denite_my_settings() abort
"     nnoremap <silent><buffer><expr> <CR>
"     \ denite#do_map('do_action')
"     nnoremap <silent><buffer><expr> d
"     \ denite#do_map('do_action', 'delete')
"     nnoremap <silent><buffer><expr> p
"     \ denite#do_map('do_action', 'preview')
"     nnoremap <silent><buffer><expr> q
"     \ denite#do_map('quit')
"     nnoremap <silent><buffer><expr> i
"     \ denite#do_map('open_filter_buffer')
"     nnoremap <silent><buffer><expr> <Space>
"     \ denite#do_map('toggle_select').'j'
" endfunction

call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#option('_', 'statusline', v:false)

" These might need adjustment
" call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
"     \'noremap')
" call denite#custom#map('normal', '<Esc>', '<NOP>',
"     \'noremap')
" call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
"     \'noremap')
" call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
"     \'noremap')
" call denite#custom#map('insert', '<C-h>', '<denite:do_action:split>',
"     \'noremap')
" call denite#custom#map('normal', '<C-h>', '<denite:do_action:split>',
"     \'noremap')
" call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
"     \'noremap')

" call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

" These are commands that run when denite's pane is open (preview, quit, etc.)
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

augroup DENITE
    autocmd!
    autocmd FileType denite call s:denite_my_settings()
augroup end

" search for files
nnoremap <silent> <C-p> :Denite file/rec -auto-resize -smartcase -start-filter<CR>
" search through buffers
nnoremap <silent> <leader>s :Denite buffer -auto-resize<CR>
" grep in project
nnoremap <silent> <leader>/ :Denite grep -auto-resize<CR>
" search registers
nnoremap <silent> <leader>r :Denite register -auto-resize<CR>
" find word under cursor
nnoremap <silent> <leader>w :DeniteCursorWord grep<CR>

call denite#custom#option('default', {
    \ 'prompt': '❯'
    \ })

" settings from old version (commented out on 2019-06-29)
" nnoremap <C-p> :<C-u>Denite file_rec<CR>
" nnoremap <leader>s :<C-u>Denite buffer<CR>
" nnoremap <leader><leader>s :<C-u>DeniteBufferDir buffer<CR>
" " nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
" nnoremap <leader>8 :<C-u>DeniteCursorWord grep:.<CR>
" " nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
" nnoremap <leader>/ :<C-u>Denite grep:.<CR>
" " nnoremap <leader><leader>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
" nnoremap <leader><leader>/ :<C-u>DeniteBufferDir grep:.<CR>
" nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>
" nnoremap <leader><leader>r :<C-u>Denite -resume -cursor-pos=+1<CR>
nnoremap <leader>o :<C-u>Denite menu<CR>

" hi link deniteMatchedChar Special

" Add custom menus
let s:menus = {}

let s:menus.config_files = {
    \ 'description': 'Edit config files'
    \ }
let s:menus.config_files.file_candidates = [
    \ ['.aliases', '~/.aliases'],
    \ ['.zshenv', '~/.zshenv'],
    \ ['.zshrc', '~/.zshrc'],
    \ ['.vimrc', '~/.vimrc'],
    \ ['.i3conf', '~/.config/i3/config'],
    \ ['.i3status.conf', '~/.i3status.conf'],
    \ ['.ctags', '~/.ctags'],
    \ ['global .gitconfig', '~/.gitconfig'],
    \ ['global .gitignore', '~/.gitignore'],
    \ ['.muttrc', '~/.muttrc'],
    \ ['mailcap', '~/.mutt/mailcap'],
    \ ['.notmuch-config', '~/.notmuch-config'],
    \ ['.npmrc', '~/.npmrc'],
    \ ['.mongojsrc.js', '~/.mongojsrc.js'],
    \ ['.psqlrc', '~/.psqlrc'],
    \ ['.pgpass', '~/.pgpass'],
    \ ['.pythonrc', '~/.pythonrc'],
    \ ['.tmux.conf', '~/.tmux.conf'],
    \ ['.tern-config', '~/.tern-config'],
    \ ['.vuerc', '~/.vuerc'],
    \ ['.xinitrc', '~/.xinitrc'],
    \ ['.Xmodmap', '~/.Xmodmap'],
    \ ['.taskbook.json', '~/.taskbook.json'],
    \ ]

" let s:menus.vim = {
"     \ 'description': 'Edit Vim config files'
"     \ }
" let s:menus.vim.file_candidates = [
"     \ ]

" let s:menus.vim.command_candidates = [
"     \ ['Split the window', 'vnew'],
"     \ ['Open zsh menu', 'Denite menu:zsh'],
"     \ ]

call denite#custom#var('menu', 'menus', s:menus)

" Startify
" Replace custom quotes with some of the custom quotes and some new ones
let g:startify_custom_header_quotes = [
    \ ['saluton mondo'],
    \ ['It is not dying that a man should fear, but a man should fear never having lived at all.'],
    \ ['How one does anything is how one does everything.'],
    \ ["If you don't finish then you're just busy, not productive."],
    \ ['Simplicity does not precede complexity, but follows it.', '', '- Alan Perlis'],
    \ ['Optimization hinders evolution.', '', '- Alan Perlis'],
    \ ['It is better to have 100 functions operate on one data structure than 10 functions on 10 data structures.', '', '- Alan Perlis'],
    \ ['There is nothing quite so useless as doing with great efficiency something that should not be done at all.', '', '- Peter Drucker'],
    \ ["If you don't fail at least 90% of the time, you're not aiming high enough.", '', '- Alan Kay'],
    \ ['I think a lot of new programmers like to use advanced data structures and advanced language features as a way of demonstrating their ability. I call it the lion-tamer syndrome. Such demonstrations are impressive, but unless they actually translate into real wins for the project, avoid them.', '', '- Glyn Williams'],
    \ ['I would rather die of passion than of boredom.', '', '- Vincent Van Gogh'],
    \ ["The computing scientist's main challenge is not to get confused by the complexities of his own making.", '', '- Edsger W. Dijkstra'],
    \ ['A good programmer is someone who always looks both ways before crossing a one-way street.', '', '- Doug Linder'],
    \ ['Always code as if the person who ends up maintaining your code is a violent psychopath who knows where you live.', '', '- John Woods'],
    \ ['Unix was not designed to stop its users from doing stupid things, as that would also stop them from doing clever things.'],
    \ ['Contrary to popular belief, Unix is user friendly. It just happens to be very selective about who it decides to make friends with.'],
    \ ['Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.'],
    \ ["If you don't make mistakes, you're not working on hard enough problems.", '', '- Frank Wilczek'],
    \ ['Abstraction is not about vagueness, it is about being precise at a new semantic level.', '', '- Edsger W. Dijkstra'],
    \ ['Almost every programming language is overrated by its practitioners.', '', '- Larry Wall'],
    \ ['Think twice, code once.'],
    \ ['The question of whether computers can think is like the question of whether submarines can swim.', '', '- Edsger W. Dijkstra'],
    \ ['They did not know it was impossible, so they did it!', '', '- Mark Twain'],
    \ ['To understand recursion, one must first understand recursion.', '', '- Stephen Hawking'],
    \ ['Developing tolerance for imperfection is the key factor in turning chronic starters into consistent finishers.', '', '- Jon Acuff'],
    \ ['Every great developer you know got there by solving problems they were unqualified to solve until they actually did it.', '', '- Patrick McKenzie'],
    \ ["The average user doesn't give a damn what happens, as long as (1) it works and (2) it's fast.", '', '- Daniel J. Bernstein'],
    \ ['Be curious. Read widely. Try new things. I think a lot of what people call intelligence boils down to curiosity.', '', '- Aaron Swartz'],
    \ ['What one programmer can do in one month, two programmers can do in two months.', '', '- Frederick P. Brooks'],
    \ ['There’s no such thing as a schemaless system. There are systems where you write your schema down and ones where you don’t.', '', '- Rich Hickey'],
    \ ['[monads] are generated, so to speak, by continual fulgurations of the Divinity', '', '-  Gottfried Leibniz'],
\ ]

" Deol
" Close it (doesn't seem to work, at least in Vim 8)
tnoremap <ESC> <C-\><C-n>

" whichkey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" golang
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave = 1

" Ranger
" let g:ranger_map_keys = 0
" map <leader>r :Ranger<CR>

" Prettier
" `f` for "format"
nmap <leader>f <Plug>(Prettier)
let g:prettier#exec_cmd_async = 1

" javascript
let g:javascript_plugin_jsdoc = 1
set conceallevel=1

" vista
" See https://github.com/liuchengxu/vista.vim
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'
