set nocompatible
filetype off
syntax on
set number
set nobackup
set showcmd
set hlsearch
set cindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set laststatus=2
set enc=utf-8
set foldenable
set foldmethod=manual

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
Plugin 'The-NERD-tree'
Plugin 'taglist.vim'
Plugin 'indentLine.vim'
Plugin 'delimitMate.vim'

call vundle#end()
filetype plugin indent on

" YCM config
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_python_binary_path='/usr/bin/python3'
" let g:ycm_add_preview_to_completeopt=1
let g:ycm_autoclose_preview_window_after_insertion=1
autocmd InsertLeave * if pumvisible() == 0|pclose|endif ""

" airline config
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" taglist config
map <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidt=40

" NERDTree config
map <F2> :NERDTreeToggle<CR>
nmap <leader>t :NERDTreeToggle<CR>
let NERDTreeWinSize=40

" vim-markdown config
" let g:vim_markdown_folding_disabled=1

autocmd BufWinEnter *.h,*.c,*.cpp loadview
autocmd BufWinLeave *.h,*.c,*.cpp mkview

autocmd BufWritePre *.h,*.c,*.cpp,*.scm,*.sml %s/\s\+$//e

let mapleader=";"

" nmap
nmap <c-n> :bn<CR>
nmap <c-p> :bp<CR>
nmap <leader>x :x<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

" ycm seem not close the preview window if i use <c-c> to leave insertion mode,
" but <esc> make it closed
inoremap <c-c> <ESC>

map <F5> :call CompileRun()<CR>
nmap <leader>r :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec '!gcc % -o %<'
        exec '!./%<'
    elseif &filetype == 'cpp'
        exec '!g++ -std=c++11 % -o %<'
        exec '!./%<'
    elseif &filetype == 'lua'
        exec '!lua %'
    elseif &filetype == 'python'
        exec '!python %'
    elseif &filetype == 'html'
        exec '!firefox % &'
    elseif &filetype == 'sh'
        exec '!bash %'
    elseif &filetype == 'sml'
        exec '!sml %'
    endif
endfunc
