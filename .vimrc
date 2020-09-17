syntax on
set mouse=a
set numberwidth=1
set nu
set clipboard=unnamed
set history=1000
set cursorline
set rtp+=/usr/local/opt/fzf
set noshowmode
set relativenumber
set showcmd
set ruler
set showmatch
set sw=2
set laststatus=2

filetype plugin indent on

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50
let NERDTReeQuitOpen=1

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'morhetz/gruvbox'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'https://github.com/vim-airline/vim-airline.git' 

Plug 'https://github.com/vim-airline/vim-airline-themes.git'

Plug 'https://github.com/plasticboy/vim-markdown.git'

Plug 'https://github.com/tpope/vim-vinegar.git'

" Initialize plugin system
call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'


