" Расположение файла
" ~/.config/nvim/init.vim         (Unix and OSX)-
">      ~/AppData/Local/nvim/init.vim   (Windows)-

call plug#begin()
" Оформление темы
Plug 'savq/melange'
" Plug 'marko-cerovac/material.nvim'
" Plug 'morhetz/gruvbox'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"  дерево проекта открывать
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Комментировать строки и текст - gcc
Plug 'tomtom/tcomment_vim'
" Plug 'ThePrimeagen/vim-be-good'

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
" autocmd VimEnter * TSEnable highlight
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

" Номера строк включаем------------
" set number relativenumber-
" КОгда выделенный текст сдвигаем кнопкой >, то на 2 сдвинется.
"-
set expandtab
set shiftwidth=2
" скрытые символы
set list
" Включить подстветку синтаксиса
syntax enable
" Количество строк, когда начинается перемотка-    
set scrolloff = 3 

" I don't know
filetype plugin indent on

"Отключаем стрелки в комманд режиме
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" exit to normal mode with 'kj'
inoremap kj <ESC>
inoremap KJ <ESC>


set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
                                           
" полезные комманды   
" заменить tab на пробелы командой :retab
" включить мышку set mouse=a , чтобы двигать размер окон, например-  
