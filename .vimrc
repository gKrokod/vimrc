" Положить данный файл .vimrc в каталог
" /home/user
" где user имя пользователя
call plug#begin('~/.vim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'raichoo/haskell-vim'

" Комментировать строки и текст - gcc
Plug 'tomtom/tcomment_vim'

" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" --------- Взаимодействие с плагинами
" Позволяет открывать структуру проекта сочетанием ctrl + n
" autocmd BufNewFile *.cpp execute "0r ~/.vim/template/".input("Template name: ").".cpp"
map <C-n> :NERDTreeToggle<CR>
" map <C-n> :Vex<CR>
" Позволяет закомментировать и раскомментировать строку ctrl + k  либо     gcc
" Так же в визуальном режиме выделяем строки нужные и жмем ctrl + k ли    бо gc
" map <C-h> :TComment<CR>
" --------- Иное
syntax on
set t_Co=256   " This is may or may not needed. for paprcolor theme

set background=light
colorscheme PaperColor"
" yakrie zveta
" set termguicolors
" colorscheme melange
" colorscheme gruvbox
" set number relativenumber
set tabstop=2
" set softtabstop=2

" set shiftwidth=2
set expandtab 


" set hlsearch
set incsearch

"###########################################################
"# The line below will update:                             #
"# The tab character to                 → unicode u2192    #
"# The end of line character to         ↲ unicode u21b2    #
"###########################################################
set listchars=tab:→\ ,eol:↲

" filetype on
" filetype indent on
" syntax enable


" zabul
" set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
"resize windows
set mouse=a

"Отключаем стрелки в комманд режиме
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" BUILD AND RUN CPP
" map <F9> :!g++ -g % -o %:r && ./%:r <CR>
" " BUILD CPP
" map <F5> :!g++ -g % -o %:r <CR>
" map <F2> :w <CR>
" map <F12> :!gdb ./%:r <CR>
" exit to normal mode with 'kj'
inoremap kj <ESC>
inoremap KJ <ESC>
"####################
"Lines to save text folding
"####################
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* loadview
"####################
"NerdTree
"####################
" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" autocmd VimEnter * NERDTreejjjl
"
"####################
" NetRW analog NerdTree
"####################
"nmapNerdTree

" "Map F5 to toggle on and off the line numbers in Normal mode
" nmap <F5> gh

" These next 2 lines will hide the dot files on startup
let ghregex='\(^\|\s\s\)\zs\.\S\+'    
let g:netrw_list_hide=ghregex        

" "Map F6 to toggle on and off the baner
" nmap <F6> I

"#Turn off the banner at the top of the sreen on startup
" let g:netrw_banner=0    

"# to change the way netrw shows the files and directorys
" let g:netrw_liststyle= 0    " Default view (directory name/file name)
"let g:netrw_liststyle= 1    " Show time and size
"let g:netrw_liststyle= 2    " Shows listing in 2 columns
let g:netrw_liststyle= 3    " show the tree listing


"# Set the split windows to always be equal and open splits to the right
let g:netrw_winsize = 0         "   set default window size to be always equal
let g:netrw_preview = 1		    "	open splits to the right
"############################################################
"##  Updates to .vimrc for Vim video 34 - START            ##
"############################################################
" Per default, netrw leaves unmodified buffers open.  This autocommand
" deletes netrw's buffer once it's hidden (using ':q;, for example)
autocmd FileType netrw setl bufhidden=delete  " or use :qa!

"These next three lines are for the fuzzy search:
set nocompatible      "Limit search to your project
set path+=**          "Search all subdirectories and recursively
set wildmenu          "Shows multiple matches on one line
" for quickfix ghcid----------------
set errorformat=%C%*\\s•\ %m,
                \%-C\ %.%#,
                \%A%f:%l:%c:\ %t%.%#

map <F5> :cfile quickfix<CR>
map <C-j> :cnext<CR>
map <C-k> :cprevious<CR>
" for quickfix ghcid bottom----------
