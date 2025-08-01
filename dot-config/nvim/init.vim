filetype plugin indent on

" foot keys break input solution
let &t_TI = "\<Esc>[>4;2m"
let &t_TE = "\<Esc>[>4m"

" Colorscheme
colo torte

" Transparency
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none

set bg=dark "Setting background color to dark
set mouse=a "Enabling mouse in all modes
set mousehide "Automatically hide mouse in vim
"set clipboard=unnamed "Syncing your primary vim register with the system clipboard
set hls is "When there is a previous search pattern, highlight all its matches.
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
set timeoutlen=500 ttimeoutlen=15 "Mitigating delay when pressing esc
set statusline=%t%m%r%h%w%=\ %Y\ %l,%v\ %p%%\ [%L] laststatus=2

" Some basics:
nnoremap c "_c
set nocp "Making Vim behave in a more useful way than vi
syntax on
set enc=utf-8 "Sets the character encoding used inside Vim
set rnu "Show the line number relative to the line with the cursor in front of each line

call plug#begin()
Plug 'ap/vim-css-color'
call plug#end()

" Built-in Fuzzy-finder
set wildmenu path+=**

" Tweaks for Built-in file browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

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

" Extensions mappings:
map <leader>m :Magit<CR>
map <leader>g :Goyo<CR>
map <leader>f :Files<CR>

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

" Navigating with guides
inoremap <leader><leader> <Esc>/<Enter>"_c4l
vnoremap <leader><leader> <Esc>/<Enter>"_c4l
map <leader><leader> <Esc>/<Enter>"_c4l

"Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e


