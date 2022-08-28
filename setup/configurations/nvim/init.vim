" Basic settings
set nocompatible
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab
set showmatch
set ignorecase
set hlsearch
set incsearch
set number
set wildmode=longest,list
filetype plugin indent on
set ttyfast
set noswapfile
set mouse=a
set clipboard=unnamedplus
set statusline+=%F\ %l\:%c
set showcmd

let g:mapleader=" "

" Plugin management
source ${HOME}/.config/nvim/modules/plugins.vim

" Remappings
source ${HOME}/.config/nvim/modules/remappings.vim
