set smartcase
set ignorecase
set incsearch
set hlsearch

set autoread
set noswapfile

set relativenumber number

set colorcolumn=80

"https://stackoverflow.com/questions/6488683/how-to-change-the-cursor-between-normal-and-insert-modes-in-vim
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END

packadd! dracula

" Persistent undo from https://stackoverflow.com/questions/2732267/vim-loses-undo-history-when-changing-buffers
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

set hidden
nnoremap <C-j> :tabnext<CR>
nnoremap <C-k> :tabprev<CR>

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

"Plug 'tpope/vim-fugitive'

Plug 'rhysd/vim-clang-format'

Plug 'preservim/nerdcommenter'

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

map <C-n> :NERDTreeToggle<CR>
map <C-p> :NERDTree %<CR>

let NERDTreeShowHidden = 1

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

map <silent><nowait>gff :Files<CR>
map <c-s-f> :Rg<CR>

nmap <silent>gt :Tags<CR>
nmap <silent>gbt :BTags<CR>

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() :"\<CR>"

Plug 'antoinemadec/coc-fzf' 

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'buoto/gotests-vim'

Plug 'sebdah/vim-delve'

Plug 'voldikss/vim-floaterm'

let g:floaterm_keymap_toggle = '<Leader>tt'
let g:floaterm_width = 0.9

"Plug 'eliba2/vim-node-inspect'
"
"nnoremap <silent><F4> :NodeInspectStart<cr>
"nnoremap <silent><F5> :NodeInspectRun<cr>
"nnoremap <silent><F6> :NodeInspectConnect("127.0.0.1:9229")<cr>
"nnoremap <silent><F7> :NodeInspectStepInto<cr>
"nnoremap <silent><F8> :NodeInspectStepOver<cr>
"nnoremap <silent><F9> :NodeInspectToggleBreakpoint<cr>
"nnoremap <silent><F10> :NodeInspectStop<cr>

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting


syntax enable
colorscheme dracula
