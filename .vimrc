set nomodeline      " Don't allow files arbitrary code execution :)
set shell=/bin/bash " Use bash
let mapleader = " " " Better binding for leader

call plug#begin('~/.vim/plugged')

" C++ syntax highlighting.
Plug 'https://github.com/bfrg/vim-cpp-modern.git'
" Auto-complete.
Plug 'https://github.com/codota/TabNine.git'
" Replace surrounding tags, cs<FROM_TAG><TO_TAG>
Plug 'https://github.com/tpope/vim-surround.git'
" Some basic vim settings.
Plug 'https://github.com/tpope/vim-sensible.git'
" File system explorer, <F3>
Plug 'https://github.com/scrooloose/nerdtree.git'
" Fuzzy finder, <c-p><NAME>
Plug 'https://github.com/junegunn/fzf.git', {'dir': '~/.fzf', 'do': './install -all'}
Plug 'https://github.com/junegunn/fzf.vim.git'
" Sets working directory to git root directory.
Plug 'https://github.com/junegunn/fzf.vim.git'
" Displays git file changes.
Plug 'https://github.com/airblade/vim-gitgutter.git'
" On-the-fly tag manager, <c-t>
Plug 'https://github.com/majutsushi/tagbar.git'
" Statusbar
Plug 'https://github.com/vim-airline/vim-airline.git'
" Easy way to outcomment code, gc<MOVE>
Plug 'https://github.com/tpope/vim-commentary.git'
" Linting for many languages, <F4>
Plug 'https://github.com/w0rp/ale.git'
" Auto create matching delimiter
Plug 'https://github.com/Raimondi/delimitMate.git'

" Color calibration + pretty syntax highlighting
Plug 'https://github.com/godlygeek/csapprox.git'
Plug 'https://github.com/morhetz/gruvbox.git'

call plug#end()

" For jumping between tags.
set autochdir
set tags+=./tags;

" Text formatting.
set tabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set fo+=t       " Enable formatoptions (for textwrap).
set breakindent " Make long lines wrap with same indent level.

" UI
set number
set showcmd         " Show previous command in bottom right corner
set colorcolumn=80  " Color the linebreak column
set wildmenu        " Show auto-complete menu
colorscheme gruvbox
set background=dark

" Utilities
set lazyredraw  " Don't redraw during macros
set showmatch   " Briefly show match when typing a search
set hlsearch    " Hilight the searches
set foldenable  " Enable folds
set foldmethod=syntax

map <c-n> :NERDTreeToggle<CR>
map <c-t> :TagbarToggle<CR>
" Toggle making windows scroll in lockstep.
map <c-b> :windo set scrollbind!<CR>
" Remap tag-jump, gets unbound for some reason.
map <c-]> :tjump

" Fuzzy-find files.
nnoremap <silent> <c-p> :FZF<CR>
" Fuzzy-find text in files.
nnoremap <silent> <c-e> :Rg<CR>

" Don't move over softwrapped lines.
nnoremap j gj
nnoremap k gk

" Cycle beteween last open buffers.
nnoremap <silent> <leader><space> <c-^>
