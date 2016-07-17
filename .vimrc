"""""""""""""""""""""""""""
" Basic Settings
"""""""""""""""""""""""""""
set nocompatible " Vim settings rather than Vi. Must appear first
set history=999

"""""""""""""""""""""""""""
" Interface
"""""""""""""""""""""""""""

set incsearch " do incremental searching
set number
set ignorecase
set go-=T " Remove toolbar in Gvim
set guifont=monospace\ 13
colorscheme desert
set mouse=a " Add mouse support in terminal
set t_Co=256 " From http://vim.wikia.com/wiki/256_colors_in_vim
set cursorline    " highlight current line
set cursorcolumn  " highlight current column


"""""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""""

" See Plugin Settings for additional keybindings

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
nnoremap <leader>g :gui<CR>

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
" Plugins
"""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'Shougo/neocomplete.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jmcomets/vim-pony'  " Django
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'tpope/vim-commentary'  " `gcc`, `gcu`
Plug 'tpope/vim-fugitive'
Plug 'Shougo/unite.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'Raimondi/delimitMate'
Plug 'mhinz/vim-signify'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align' " visual mode then `ga`
Plug 'dhruvasagar/vim-table-mode'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-vinegar' " use `-`, `.`, `cg`, `lcd`, `~`
Plug 'epeli/slimux'

" Plug 'Olical/vim-enmasse' " :EnMasse
" Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Plug 'tpope/vim-markdown', { 'for': 'markdown' }
" Plug 'SirVer/ultisnips', { 'on': [] }
" Plug 'Valloric/YouCompleteMe', { 'on': [] }

" https://github.com/junegunn/vim-plug/wiki/faq#loading-plugins-manually
" augroup load_us_ycm
"   autocmd!
"   autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
"                      \| call youcompleteme#Enable() | autocmd! load_us_ycm
" augroup END

call plug#end()

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

" Prevent Vim from adding two spaces after a period.
" See also: http://stackoverflow.com/questions/4760428/how-can-i-make-vims-j-and-gq-commands-use-one-space-after-a-period
set nojoinspaces

"""""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""""

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" Ultisnips
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" {{ Surround }}, for Django
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

" Vim Table Mode
" ReST-compatible tables
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

" Unite
let g:unite_source_history_yank_enable = 1  " like yankring
nnoremap <space>y :Unite history/yank<cr>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <C-p> :Unite file_rec/async<cr>  " like ctrlp
nnoremap <space>/ :Unite grep:.<cr>  " like ack.vim
nnoremap <space>n :Unite -quick-match buffer<cr>  " switch buffers

" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
" nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
" nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" Slimux
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
