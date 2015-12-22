"""""""""""""""""""""""""""
" Basic Settings
"""""""""""""""""""""""""""
set nocompatible " Vim settings rather than Vi. Must appear first
set history=200	

"""""""""""""""""""""""""""
" Interface
"""""""""""""""""""""""""""

set incsearch " do incremental searching
set number
set ignorecase
set go-=T " Remove toolbar in Gvim
set guifont=monospace\ 12

if has('gui_running')
  let g:seoul256_background = 233
  colorscheme seoul256
else
  colorscheme desert
endif
set mouse=a " Add mouse support in terminal
set t_Co=256 " From http://vim.wikia.com/wiki/256_colors_in_vim

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
nnoremap <leader>s :so ~/.vimrc<CR>

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

"""""""""""""""""""""""""""
" Backup Files
"""""""""""""""""""""""""""

if has("vms")
  set nobackup
else
  set backup
endif

" Store swap files in fixed location, not current directory.
" From http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

"""""""""""""""""""""""""""
" Text Formatting
"""""""""""""""""""""""""""

set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab " Spaces instead of tabs
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType jade setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType elixir setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType haskell setlocal shiftwidth=8 tabstop=8 softtabstop=8
autocmd FileType php set ft=php.laravel

" Prevent Vim from adding two spaces after a period.
" See also: http://stackoverflow.com/questions/4760428/how-can-i-make-vims-j-and-gq-commands-use-one-space-after-a-period
set nojoinspaces


"""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""
" Docs: https://github.com/junegunn/vim-plug

" TODO: find more plugins here: https://github.com/Olical/dotfiles/blob/9c5f008620287bb495e56452123d6bff76bb4639/vim/.vim/plugins.vim#L5
" TODO: replace some of the plugins from the older vimrc files

call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'easymotion/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/vim-easy-align' " visual mode then `ga`
Plug 'Olical/vim-enmasse' " :EnMasse
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ternjs/tern_for_vim'
Plug 'mhinz/vim-signify'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'

" NerdTree replacement
" use `-`, `.`, `cg`, `lcd`, `~`
Plug 'tpope/vim-vinegar' 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wakatime/vim-wakatime'
Plug 'elixir-lang/vim-elixir'
Plug 'epeli/slimux'

call plug#end()

"""""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""""

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:signify_vcs_list = [ 'git', 'hg' ]

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

