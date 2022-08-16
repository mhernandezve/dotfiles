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
set shiftwidth=2
set tabstop=2

call plug#begin('~/.local/share/nvim/plugged')

    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-fugitive'
      nmap     <Leader>g :Git<CR>gg<c-n>
      nnoremap <Leader>d :Gdiff<CR>
    Plug 'rhysd/git-messenger.vim'
    
    " Completion / linters / formatters
    Plug 'plasticboy/vim-markdown'

    " Git
    Plug 'airblade/vim-gitgutter'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'jmcantrell/vim-diffchanges'

    Plug 'mhinz/vim-startify'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'TimUntersberger/neogit'
call plug#end()

let g:NERDTreeChDirMode = 2
let NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
:nnoremap <C-n> :NERDTreeToggle<CR>
:nnoremap <C-j> :Files<CR>
:nnoremap <C-g> :Commits<CR>
:nnoremap <C-h> :Ag<CR>

let g:fzf_preview_window = ['right:40%', 'ctrl-/']

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let mapleader=" "
let maplocalleader = ' '
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
