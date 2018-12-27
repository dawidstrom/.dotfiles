call plug#begin('~/.vim/plugged')

" Replace surrounding tags, cs<FROM_TAG><TO_TAG>
Plug 'https://github.com/tpope/vim-surround.git'
" Some basic vim settings
Plug 'https://github.com/tpope/vim-sensible.git'
" File system explorer, <F3>
Plug 'https://github.com/scrooloose/nerdtree.git'
" FuzzyFinder, <C-p><NAME>
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
" Displays git file changes
Plug 'https://github.com/airblade/vim-gitgutter.git'
" On-the-fly tag manager, 
Plug 'https://github.com/majutsushi/tagbar.git'
" Statusbar
Plug 'https://github.com/vim-airline/vim-airline.git'
" Easy way to outcomment code, gc<MOVE>
Plug 'https://github.com/tpope/vim-commentary.git'
" Linting for many languages, <F4>
Plug 'https://github.com/w0rp/ale.git'
" Auto create matching delimiter
Plug 'https://github.com/Raimondi/delimitMate.git'

call plug#end()

" Text formatting.
set tabstop=4
set shiftwidth=4
set textwidth=79
set expandtab

" UI
set showcmd " Show previous command in bottom right corner
set number
set colorcolumn=80 " Color the linebreak column
set wildmenu " Show auto-complete menu

" Utilities
set lazyredraw " Don't redraw during macros
set showmatch " Briefly show match when typing a search
set hlsearch " Hilight the searches
set foldenable " Enable folds

" Rebind toggle folds
nnoremap <space> za 

" Don't move over softwrapped lines
nnoremap j gj
nnoremap k gk

" Better binding for leader
nnoremap <leader> , 

" Enable formatoptions (for textwrap)
set fo+=t

map <C-n> :NERDTreeToggle<CR>
map <C-t> :TagbarToggle<CR>

" Reminder to use the surround plugin more.
set laststatus=2
set statusline=Remember\ to\ use\ the\ surround\ plugin.
