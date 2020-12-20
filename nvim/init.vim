" ~~~~~~~~~~ Plugins ~~~~~~~~~~
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'NLKNguyen/papercolor-theme'
call plug#end()

" ~~~~~~~~~~ General Configuration ~~~~~~~~~~
set number
set clipboard+=unnamedplus
set background=light
colorscheme PaperColor

" ~~~~~~~~~~ Nerdtree Config ~~~~~~~~~~
" Automatically opens Nerdtree when opening neovim
autocmd VimEnter * NERDTree | wincmd p
" Quits Neovim if Nerdtree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Control + N to toggle NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>
