let mapleader =" "
filetype on

set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard=unnamedplus
set tabstop=4 "Sets tab size to 4 spaces
set softtabstop=4
set shiftwidth=4
set expandtab "Converts our tabs to spaces
set autoindent
set fileformat=unix

" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'mattn/emmet-vim'
    Plug 'vimwiki/vimwiki'
    Plug 'LukeSmithxyz/vimling'
    Plug 'junegunn/goyo.vim'
call plug#end()

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright
" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
" Emmet Shortcuts
    let g:user_emmet_mode='n'   "Only enable normal mode functions.
    let g:user_emmet_leader_key=','
" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>
" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+P
"Newtab with ctrl+t
	nnoremap <silent> <C-t> :tabnew<CR>
"Paste from system clipboard with ctrl+i instead of shift insert
	map <S-Insert> <C-i>
"Automatically deletes all trailing whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e
"Run xrdb whenever Xdefaults or Xresources are updated.
    autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Colorscheme
    :colorscheme delek
