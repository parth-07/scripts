" Plugin management
call plug#begin()
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'neoclide/coc.nvim', {'branch' : 'release', 'do' : 'yarn install'}
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'junegunn/fzf', {'do' : { -> fzf#insall() } }
    Plug 'ryanoasis/vim-devicons'
call plug#end()

" Plugin specific configurations
source ${HOME}/.config/nvim/modules/coc.vim
source ${HOME}/.config/nvim/modules/fzf.vim
