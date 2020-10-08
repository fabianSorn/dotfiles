" This file is for local configuration on top of the vim bootstrap's
" initialization file. This file will be picked up in init.vim

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                               Key Mapping
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Text formatting
set colorcolumn=80
set wrap
set textwidth=80

" Code folding
set foldmethod=indent
set nofoldenable

" Turn on spell checking
set spell spelllang=en_us
let g:airline_powerline_fonts=1
set encoding=UTF-8

let g:python_host_prog = '/Users/fsorn/.pyenv/versions/nvim2/bin/python'
let g:python3_host_prog = '/Users/fsorn/.pyenv/versions/nvim3/bin/python'
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                               Key Mapping
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Close buffer without closing the entire window
noremap <leader>c :bp<bar>sp<bar>bn<bar>bd<CR>

" F2 & F3 from vim bootstrap are shit on touchbar macbooks
nnoremap <silent> <C-m> :NERDTreeFind<CR>
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                           Visual Configuration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Decrease width of Nerdtree Plugin Window
let g:NERDTreeWinSize = 38
set termguicolors     " enable true colors support

let hr = (strftime('%h'))
if hr >= 8 && hr < 18
    " Light Theme    
    let ayucolor="dark"
else
    " Dark Theme
    let ayucolor="light"
endif

colorscheme ayu
