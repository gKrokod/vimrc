" Расположение файла
" ~/.config/nvim/init.vim         (Unix and OSX) 
"	~/AppData/Local/nvim/init.vim   (Windows) 

call plug#begin()
" Оформление темы
Plug 'savq/melange'
Plug 'marko-cerovac/material.nvim'
Plug 'morhetz/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"После установки не забудь прописать :TSInstall haskell , после чего появится расцветка

"  дерево проекта открывать
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
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
" Plug 'vim-airline/vim-airline'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax ena    ble`.
call plug#end()
" --------- Взаимодействие с плагинами
" Запусти treesitter для цветового оформления
autocmd VimEnter * TSEnable highlight
" Позволяет открывать структуру проекта сочетанием ctrl + n
map <C-n> :NERDTreeToggle<CR>
" Позволяет закомментировать и раскомментировать строку ctrl + k  либо     gcc
" Так же в визуальном режиме выделяем строки нужные и жмем ctrl + k ли    бо gc
map <C-k> :TComment<CR>
" --------- Иное
set termguicolors
colorscheme melange
" тема из плагина
" colorscheme gruvbox
" set background=dark

" Номера строк включаем            
set number relativenumber 

" Включить подстветку синтаксиса
syntax enable

" I don't know
filetype plugin indent on

"Отключаем стрелки в комманд режиме
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" exit to normal mode with 'kj'
inoremap kj <ESC>


