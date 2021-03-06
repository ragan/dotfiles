set nocompatible              " be iMproved, required
filetype off                  " required

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'preservim/nerdtree'
Plugin 'buoto/gotests-vim'
Plugin 'preservim/nerdcommenter'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" If installed using git
set rtp+=~/.fzf

set incsearch
set hlsearch
set ignorecase
set smartcase

set relativenumber number

map <leader>f :Files<CR>
map <c-s-f> :Rg<CR>
map <C-b> :GoDef<CR>
map <C-S-F9> :GoBuild<CR>
map <C-F12> :GoDecls<CR>
map <C-F8> :DlvToggleBreakpoint<CR>

nmap <silent>gv :Vista!!<CR>

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

map <C-n> :NERDTreeToggle<CR>
map <A-1> :NERDTree %<CR>

inoremap <silent><expr> <c-space> coc#refresh()

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

colorscheme monokai

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'sebdah/vim-delve'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vista.vim'
Plug 'vim-airline/vim-airline'
Plug 'vimcki/vim-quickfile'

nnoremap <leader>fm :call QuickFile("makefile")<cr>
nnoremap <leader>fi :call QuickFile("ci")<cr>
nnoremap <leader>fc :call QuickFile("config")<cr>
nnoremap <leader>fb :call QuickFile("build")<cr>
nnoremap <leader>fo :call QuickFile("models")<cr>
nnoremap <leader>fr :call QuickFile("readme")<cr>
nnoremap <leader>fe :call QuickFile("main")<cr>
nnoremap <leader>fd :call QuickFile("dependencies")<cr>

Plug 'eliba2/vim-node-inspect'
Plug 'othree/yajs.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()
