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

" Activate our Theme of choice
set termguicolors

" Automatically activate the light version of the theme during the day and the
" dark version during the night
let hr = (strftime('%H'))
if hr >= 8 && hr < 18
    let ayucolor="light"
else
    " A bit lighter alternative to the dark one
    " let ayucolor="mirage"
    let ayucolor="dark"
endif

colorscheme ayu

