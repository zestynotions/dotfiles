"   ___     ___     ____
" /\_ ,`\ /' _ `\  /',__\
" \/_/  /_/\ \/\ \/\__, `\
"   /\____\ \_\ \_\/\____/
"   \/____/\/_/\/_/\/___/
"
"
" Personal vim configuration of zns <zestynotions@gmail.com>
"
"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------


set exrc " looks at direcory level vimrc
set expandtab
set guicursor=
set shiftwidth=4
set tabstop=4
set nohlsearch
set noerrorbells
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set noswapfile
set nobackup
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm

highligh Normal guibg=none

" set backup
" set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>k :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<cr>
nmap <leader>g :Goyo<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Toggle Telescope
nnoremap <leader>T :Telescope find_files<cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" lf Config
let g:lf_replace_netrw = 1 " Open lf when vim opens a directory
let g:lf_width = 0.9
let g:lf_height = 0.7

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Make Y behave like the other capitals
nnoremap Y y$

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

cmap w!! %!sudo tee > /dev/null %
"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

"----------------------------------------
" ------------ ColorSchemes -------------

source ~/.config/nvim/plugins/dracula.vim
" source ~/.config/nvim/plugins/nord.vim

colorscheme dracula
" ---------------------------------------

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/goyo.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/which-key.vim
source ~/.config/nvim/plugins/autopairs.vim


call plug#end()
doautocmd User PlugLoaded


"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

" Boilerplates
autocmd BufNewFile readme.md 0r ~/.config/nvim/templates/readme.md
autocmd BufNewFile index.html 0r ~/.config/nvim/templates/index.html
autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/bash.sh

augroup FileTypeOverrides
    autocmd!
    " Use '//' instead of '/* */' comments
    autocmd FileType php setlocal commentstring=//%s
    autocmd TermOpen * setlocal nospell
augroup END
