
"
" this file contains the plugin dependencies of current configuration
"
" placing them in a separate file makes it easier for
" installation script to run ':PlugInstall' from inside 'vim -u plug_deps',
" which does not automatically source the plugin-specific configurations.
"

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf'
Plug 'skywind3000/asyncrun.vim'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'tpope/vim-fugitive'
Plug 'ilyachur/cmake4vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'antiagainst/vim-tablegen'
Plug 'voldikss/vim-floaterm'

" pilot with typescript support
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'puremourning/vimspector'

" Initialize plugin system
call plug#end()
