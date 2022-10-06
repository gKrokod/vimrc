" Положить данный файл .vimrc в каталог
" /home/user
" где user имя пользователя
call plug#begin('~/.vim/plugged')
" Оформление темы
Plug 'savq/melange'
Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-syntax-extra'

"  дерево проекта открывать
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Комментировать строки и текст - gcc
Plug 'tomtom/tcomment_vim'

" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" --------- Взаимодействие с плагинами
" Позволяет открывать структуру проекта сочетанием ctrl + n
" autocmd BufNewFile *.cpp execute "0r ~/.vim/template/".input("Template name: ").".cpp"
map <C-n> :NERDTreeToggle<CR>
" Позволяет закомментировать и раскомментировать строку ctrl + k  либо     gcc
" Так же в визуальном режиме выделяем строки нужные и жмем ctrl + k ли    бо gc
map <C-k> :TComment<CR>
" --------- Иное
set termguicolors
colorscheme melange
set number relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

filetype on
filetype indent on
syntax enable

"Отключаем стрелки в комманд режиме
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" BUILD AND RUN CPP
map <F9> :!g++ -g % -o %:r && ./%:r <CR>
" BUILD CPP
map <F5> :!g++ -g % -o %:r <CR>
map <F2> :w <CR>
map <F12> :!gdb ./%:r <CR>
" exit to normal mode with 'kj'
inoremap kj <ESC>
