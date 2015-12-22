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
colorscheme desert
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
nnoremap <leader>s :so %<CR>

" Window management
nnoremap <leader>T :tabnew 
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


