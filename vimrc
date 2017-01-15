" set omnifunc=syntaxcomplete#Complete()
execute pathogen#infect()
set tabstop=4
set sw=4
set number

silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
