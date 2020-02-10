" Vim settings rather than Vi. Must appear first
set nocompatible
set history=999

" Security, see: https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set nomodeline

if has("gui_running")
    set go-=T  " Remove toolbar
endif

" Always display the status line.
set laststatus=2

set cmdheight=1

set number
syntax enable

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
" set wildignore+=*.min.*
" set wildignore+=__pycache__/*
set wildignore+=__pycache__
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=tags.*
set wildignore+=tags
" set wildignore+=.vscode/*
" set wildignore+=.idea/*
" set wildignore+=*/tmp/*
" set wildignore+=*/build/*
" set wildignore+=*/dist/*
set wildignore+=*.zip
set wildignore+=*.pdf
set wildignore+=*.so

" This shows non-printing characters
set list lcs=tab:>-,trail:\.,extends:»,precedes:«,nbsp:%

" Highlight line and column
set cursorline
set cursorcolumn

" Highlight desired line limit column (80 chars or whatever)
" set colorcolumn=80,100
set colorcolumn=97

" For more info on matching, including matchit.vim, see:
" http://vim.wikia.com/wiki/Moving_to_matching_braces
" Show matching brackets
set showmatch
" 4/10 of a second to jump back to matching brace
set matchtime=4

" Enable mouse support
set mouse=a

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Turn of error sounds
set noerrorbells
set vb t_vb=

" Don't close buffers that aren't being displayed.
set hidden

" convert double quotes to single quotes on the current line or in a visual
" selection
nnoremap <leader>' :s/"/'/g<cr>:noh<cr>
nnoremap <leader><leader>' :s/"/'/gc<cr>:noh<cr>
vnoremap <leader>' :s/"/'/g<cr>:noh<cr>
vnoremap <leader><leader>' :s/"/'/gc<cr>:noh<cr>

" visually select line without the newline on the end
nnoremap <leader><leader>v $v0

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

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch


" Use pleasant but very visible search highlighting
hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search

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

" Use indentation for folds
" toggle: za, close all: zM, open all: zR
" fold (zf), open (zo), close (zc), delete (zd), etc.
set foldmethod=manual
set foldcolumn=1  " non-zero value turns on the fold column in the gutter
" set foldnestmax=5
" set foldlevelstart=99

set backupcopy=yes

" Store swap files in fixed location, not current directory.
" From http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" Save info about the file in .viminfo
set viminfo^=%

" Unicode substitution
hi clear Conceal

" Move lines
" See https://vim.fandom.com/wiki/Moving_lines_up_or_down
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

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
" nmap <leader>d "+d
" vmap <leader>d "+d
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

" visually select to end of line
nnoremap <leader>$ v$h

" ctrl-backspace to delete w
"https://vim.fandom.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
" inoremap <C-w> <C-\><C-o>dB
" inoremap <C-BS> <C-\><C-o>db
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

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
Plug 'flazz/vim-colorschemes'
Plug 'jacoborus/tender.vim'

Plug 'epeli/slimux'

Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" <Leader>ig to turn on indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Extends the functionality of % so that it includes tags and not just
" brackets.
Plug 'tmhedberg/matchit'

" Plug 'vim-scripts/gitignore'

" ctags
" ctrl-click on something to go to definition, and ctrl-o to return
" visually selecting the name and c-] should also jump to the definition.
" Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Bars, panels, and files
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" this installs fzf on the system as well
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" 
Plug 'luochen1990/rainbow'

" Text manipulation
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'  " `gcc`, `gcu`
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'

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

" Vue.js
" Plug 'posva/vim-vue'

" Svelte
" Plug 'j127/vim-svelte'

" golang
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Markdown
Plug 'tpope/vim-markdown'

Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }
Plug 'mattn/emmet-vim'
" Plug 'junegunn/vim-easy-align' " visual mode then `ga`
Plug 'dhruvasagar/vim-table-mode'
Plug 'bronson/vim-trailing-whitespace'

Plug 'editorconfig/editorconfig-vim'

" Rails
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-bundler'

" Plug 'mustache/vim-mustache-handlebars'

" nand2tetris
" Plug 'sevko/vim-nand2tetris-syntax'

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
" Plug 'Quramy/tsuquyomi'
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/vim-js-pretty-template'
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
    colorscheme gruvbox
else
    " various themes that are good, depending on mood and lighting
    " colorscheme twilight256
    " colorscheme colorsbox-material
    " colorscheme tender
    colorscheme desertink
    " colorscheme codeschool
    " colorscheme badwolf
    " colorscheme gruvbox
    " colorscheme louver
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
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Keep certain files out of nerdtree (see wildignore settings)
let NERDTreeRespectWildIgnore=1

" Indent guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray21 ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray26 ctermbg=234

" Taglist
nmap <leader>t :TagbarToggle<CR>

" tsuquyomi
" Tooltoops
" autocmd FileType typescript nmap <buffer> <leader>z : <C-u>echo tsuquyomi#hint()<CR>

" From https://stackoverflow.com/a/3691124
" function! Browser ()
"     normal yy
"     new
"     execute ".!elinks -dump " . @"
"     set nomodified
" endfunction
" nmap owp :call Browser ()<CR>

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

" whichkey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" golang
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave = 1

" Prettier
" `f` for "format"
nmap <leader>f <Plug>(Prettier)
let g:prettier#exec_cmd_async = 1

" javascript
let g:javascript_plugin_jsdoc = 1
set conceallevel=1

" devicons
let g:webdevicons_conceal_nerdtree_brackets = 1

let g:table_mode_corner='|'

" for coc.nvim
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" mix format on save
let g:mix_format_on_save = 1
" nmap <leader><leader>f <Plug>(MixFormat)

" Set syntax highlighting for Dockerfile.dev files
augroup docker_ft
    au!
    autocmd BufNewFile,BufRead Dockerfile.dev set syntax=dockerfile
augroup END
