call plug#begin()
"  дерево проекта открывать
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'savq/melange'
Plug 'marko-cerovac/material.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Комментировать строки и текст - gcc
Plug 'tomtom/tcomment_vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neovimhaskell/haskell-vim'
" Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh'
"    \ }
"    плагин подстветки синтаксима хаскелл
" Plug 'neovimhaskell/haskell-vim'
Plug 'morhetz/gruvbox'
" Plug 'vim-airline/vim-airline'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax ena    ble`.
call plug#end()
" set background=dark
" Номера строк включаем            
set number relativenumber 
" -- подсветка найденных слов при поиске
" Позволяет открывать структуру проекта сочетанием ctrl + n
map <C-n> :NERDTreeToggle<CR>
" Позволяет закомментировать и раскомментировать строку ctrl + k  либо     gcc
" Так же в визуальном режиме выделяем строки нужные и жмем ctrl + k ли    бо gc
map <C-k> :TComment<CR>
" Включить подстветку синтаксиса
syntax enable
" I don't know
filetype plugin indent on
" тема из плагина
" colorscheme gruvbox
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
set termguicolors
colorscheme melange
" exit to normal mode with 'jj'
inoremap kj <ESC>
autocmd VimEnter * TSEnable highlight
