set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set ignorecase smartcase

" Tabs size
set expandtab
set shiftwidth=4
set tabstop=4
filetype indent on

call plug#begin('~/.local/share/nvim/plugged')

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'edkolev/tmuxline.vim'
    Plug 'preservim/vimux'
    Plug 'sainnhe/everforest'
    Plug 'sainnhe/gruvbox-material'

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'
    Plug 'rhysd/git-messenger.vim'
    Plug 'hashivim/vim-terraform'

    " Completion / linters / formatters
    Plug 'preservim/vim-markdown'
    " Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'davidhalter/jedi-vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'scrooloose/syntastic'
    Plug 'fisadev/vim-isort'
    Plug 'vim-python/python-syntax'
    Plug 'psf/black', { 'branch': 'stable' }

    " Git
    Plug 'tpope/vim-fugitive'
      nmap     <Leader>g :Git<CR>gg<c-n>
      nnoremap <Leader>d :Gdiff<CR>
    Plug 'airblade/vim-gitgutter'
    Plug 'TimUntersberger/neogit'

    " Fuzzers
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'jmcantrell/vim-diffchanges'

    Plug 'mhinz/vim-startify'

    Plug 'nvim-lua/plenary.nvim'
call plug#end()

if has('termguicolors')
  set termguicolors
endif

let g:vim_markdown_folding_disabled = 1
let g:NERDTreeChDirMode = 2
let NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
:nnoremap <C-n> :NERDTreeToggle<CR>
" :nnoremap <C-w> :Files<CR>
:nnoremap <C-p> :Commits<CR>
:nnoremap <C-g> :Ag<CR>
" nnoremap <leader>o o<esc>
nnoremap <silent><leader>l :Buffers<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'everforest'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_tab_count = 2
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
" let g:everforest_cursor = 'orange'
" let g:everforest_current_word = 'underline'

let g:fzf_preview_window = ['right:45%', 'ctrl-/']

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Close the tab if NERDTree is the only window remaining in it.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" deoplete Close preview window after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let mapleader=" "
let maplocalleader = ' '

let g:everforest_background = 'hard'

" For better performance
let g:everforest_better_performance = 1
let g:everforest_enable_italic = 1

" deoplete
let g:deoplete#enable_at_startup = 1

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python', 'flake8']
" let g:syntastic_python_pylint_post_args="--max-line-length=88"
" let g:syntastic_python_flake8_args='--ignore=E225 --max-line-length 88'
let g:syntastic_python_flake8_args='--ignore=E501,E225'


" python-syntax
let g:python_highlight_all = 1

nnoremap <SPACE> <Nop>

nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>

" Quit
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" <leader>n | NERD Tree
nnoremap <leader>n :NERDTreeToggle<cr>

" <leader>dd | Diff Toggle
nnoremap <leader>dd :DiffChangesDiffToggle<cr>

" <leader>dp | Diff Toggle
nnoremap <leader>dp :DiffChangesPatchToggle<cr>

" ----------------------------------------------------------------------------
" Heytmux
" ----------------------------------------------------------------------------
xnoremap <leader>ht :Heytmux<cr>

" Last inserted text
nnoremap g. :normal! `[v`]<cr><left>

" Remap split windows shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ----------------------------------------------------------------------------
" tmux
" ----------------------------------------------------------------------------
function! s:tmux_send(content, dest) range
  let dest = empty(a:dest) ? input('To which pane? ') : a:dest
  let tempfile = tempname()
  call writefile(split(a:content, "\n", 1), tempfile, 'b')
  call system(printf('tmux load-buffer -b vim-tmux %s \; paste-buffer -d -b vim-tmux -t %s',
        \ shellescape(tempfile), shellescape(dest)))
  call delete(tempfile)
endfunction

function! s:tmux_map(key, dest)
  execute printf('nnoremap <silent> %s "tyy:call <SID>tmux_send(@t, "%s")<cr>', a:key, a:dest)
  execute printf('xnoremap <silent> %s "ty:call <SID>tmux_send(@t, "%s")<cr>gv', a:key, a:dest)
endfunction

call s:tmux_map('<leader>tt', '')
call s:tmux_map('<leader>th', '.left')
call s:tmux_map('<leader>tj', '.bottom')
call s:tmux_map('<leader>tk', '.top')
call s:tmux_map('<leader>tl', '.right')
call s:tmux_map('<leader>ty', '.top-left')
call s:tmux_map('<leader>to', '.top-right')
call s:tmux_map('<leader>tn', '.bottom-left')
call s:tmux_map('<leader>t.', '.bottom-right')

colorscheme gruvbox-material
