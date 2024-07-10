let mapleader = '\'
filetype plugin indent on

set bg=dark "Setting background color to dark
set go=a
set mouse=a "Enabling mouse in all modes
set mousehide "Automatically hide mouse in vim
set hls is "When there is a previous search pattern, highlight all its matches.
set clipboard=unnamedplus "Syncing your primary vim register with the system clipboard
set ts=5 "Number of spaces that a <Tab> counts for
set sts=4 "Number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=4
set expandtab "Converts our tabs to spaces
set lazyredraw "the screen will not be redrawn while executing macros, registers and other commands
set aw "Write the contents of the file, if it has been modified
set ai "Copy indent from current line when starting a new line
set ar "Automatically read a file that has been changed outside of Vim
set fileformat=unix
set showcmd "Show (partial) command in the last line of the screen
set wrap "Enables line wrapping, default break at character
set statusline=%t%m%r%h%w%=\ %Y\ %l,%v\ %p%%\ [%L]

" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'dense-analysis/ale'
    Plug 'LukeSmithxyz/vimling'
    Plug 'farconics/victionary'
    Plug 'mattn/emmet-vim'
    Plug 'junegunn/goyo.vim'
    Plug 'jreybert/vimagit'
    Plug 'ap/vim-css-color'
call plug#end()

" Some basics:
	nnoremap c "_c
	set nocp "Making Vim behave in a more useful way than vi
	syntax on
	set enc=utf-8 "Sets the character encoding used inside Vim
	set rnu "Show the line number relative to the line with the cursor in front of each line
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
" Check file in shellcheck:
     map <leader>sc :!clear && shellcheck -x %<CR>
" Goyo mappings
     map <leader>f :Goyo<CR>
" Victionary mappings
     let g:victionary#map_defaults = 0
     nmap <leader>mp <Plug>(victionary#define_prompt)
     nmap <leader>mc <Plug>(victionary#define_under_cursor)
     nmap <leader>ms <Plug>(victionary#synonym_prompt)
     nmap <leader>sc <Plug>(victionary#synonym_under_cursor)
" Spell-check set to F6 and the British English library.
     map <F6> :setlocal spell! spelllang=en_gb<CR>
" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>
" Copy selected text to system clipboard (requires gvim/vim-gtk3 installed):
	nnoremap <C-y> "+y
	vnoremap <C-y> "+y
     nnoremap <C-p> "+gP
     vnoremap <C-p> "+gP
" Newtab with ctrl+t
	nnoremap <silent> <C-t> :tabnew<CR>
" Compile document, be it groff/LaTeX/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>
" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>
" Navigating with guides
	inoremap <leader><leader> <Esc>/<Enter>"_c4l
	vnoremap <leader><leader> <Esc>/<Enter>"_c4l
	map <leader><leader> <Esc>/<Enter>"_c4l
" Automatically deletes all trailing whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e
" Colorscheme
    :colorscheme delek
