set nomodeline      " Don't allow files arbitrary code execution :)
set shell=/bin/bash " Use bash
let mapleader = " " " Better binding for leader

set encoding=utf-8

call plug#begin('~/.vim/plugged')

" C++ syntax highlighting.
Plug 'https://github.com/bfrg/vim-cpp-modern.git'
" Auto-complete.
"Plug 'https://github.com/codota/TabNine.git'
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
Plug 'https://github.com/airblade/vim-rooter.git'
" Displays git file changes.
Plug 'https://github.com/airblade/vim-gitgutter.git'
" On-the-fly tag manager, <c-t>
Plug 'https://github.com/majutsushi/tagbar.git'
" Statusbar
Plug 'https://github.com/vim-airline/vim-airline.git'
" Easy way to outcomment code, gc<MOVE>
Plug 'https://github.com/tpope/vim-commentary.git'
" Linting for many languages, <F4>
" Plug 'https://github.com/w0rp/ale.git'
" Auto create matching delimiter.
Plug 'https://github.com/Raimondi/delimitMate.git'
" For snippets.
" Plug 'https://github.com/SirVer/ultisnips.git'
" Color calibration + pretty syntax highlighting.
Plug 'https://github.com/godlygeek/csapprox.git'
Plug 'https://github.com/morhetz/gruvbox.git'

" CoC, language completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Rust RON highlighting
Plug 'ron-rs/ron.vim'

call plug#end()

"" For language features such as rename/go to definition/etc.
" Required for modifying multiple buffers like rename.
set hidden

" --------------------------------------------------------
" COC-VIM TAB SETTINGS START

set cmdheight=2 " Number of rows to display message.
set updatetime=300 " How often ? is updated.

set shortmess+=c " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes " Always display signcolumn (leftmost column).

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" COC-VIM TAB SETTINGS END
" --------------------------------------------------------

"" For jumping between tags.
set autochdir
set tags+=./tags;

"" Text formatting.
set tabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set fo+=t       " Enable formatoptions (for textwrap).
set breakindent " Make long lines wrap with same indent level.

"" UI
set rnu             " Show line offset from cursor row.
set nu              " Show line number on cursor row.
set showcmd         " Show previous command in bottom right corner
set colorcolumn=80  " Color the linebreak column
set wildmenu        " Show auto-complete menu
colorscheme gruvbox
set background=dark

"" Utilities
set lazyredraw  " Don't redraw during macros
set showmatch   " Briefly show match when typing a search
set hlsearch    " Hilight the searches
set foldenable  " Enable folds
set foldmethod=syntax
set foldlevel=100
set hidden      " Keep undo history for open buffers.

" map <c-n> :NERDTreeToggle<CR>
map <c-t> :TagbarToggle<CR>
" Toggle making windows scroll in lockstep.
" map <c-b> :windo set scrollbind!<CR>
" Remap tag-jump, gets unbound for some reason.
map <c-]> :tjump

" Fuzzy-find files (excludes .gitignored files).
nnoremap <silent> <c-p> :GFiles --cached --others --exclude-standard<CR>
" Fuzzy-find text in files.
"nnoremap <silent> <c-e> :Rg<CR>

" Don't move over softwrapped lines.
nnoremap j gj
nnoremap k gk

" Cycle beteween last open buffers.
nnoremap <silent> <leader><space> <c-^>

" Break selection into new lines based on delimiter.
func! F()
    echo "Called F!"
    mark Z
    silent '<,'>s/,\s*/,\r/g
    mark X
    normal 'Z
    normal ='X
endfunc

xnoremap <silent> <c-l> :call F()<CR>
