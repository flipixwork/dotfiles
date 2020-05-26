call plug#begin('~/.vim/plugged')
" colorschemas
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'

" webdev
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', {
  \'do': 'yarn install',
  \'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jiangmiao/auto-pairs'
Plug '1c-syntax/vim-language-1c-bsl'
call plug#end()

set guifont=Hack
colorscheme solarized
set background=dark
set encoding=utf-8

if has("syntax")
  syntax on
endif
set number relativenumber
set autowrite " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch
set laststatus=2  " Always display the status line
set mouse=a
set showmatch
set numberwidth=5
set wildmenu
set expandtab
set autoindent
set smartindent

" prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 1
" emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','
autocmd FileType html,css EmmetInstall

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set smarttab

" Powerline status
"let g:powerline_pycmd="python3.8"
"set rtp+=/usr/lib/python3.8/site-packages/powerline/bindings/vim

" coc.nvim
set nobackup
set nowritebackup
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

:set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

"""""" mappings
let mapleader = " "
map <C-n> :NERDTreeToggle<CR>
"map <C-l> :noh<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <C-p> :Files<cr>

if has('nvim')
    " Neovim specific commands
else
    " Standard vim specific commands
endif
