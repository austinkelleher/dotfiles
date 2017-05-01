" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'
Plug 'easymotion/vim-easymotion'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'mhinz/vim-grepper'
Plug 'ahw/vim-pbcopy'

" NOTE: Install 'grip' as well
Plug 'JamshedVesuna/vim-markdown-preview'

" NOTE: go to where this plugin was installed '~/.vim/plugged/command-t' and
" run 'rake make'
Plug 'wincent/command-t'

call plug#end()            " required

filetype plugin indent on    " required

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number

set nocompatible              " be iMproved, required

filetype off                  " required
colo delek
syntax on

let g:ctrlp_working_path_mode='r'
set wildignore+=**/tmp
set wildignore+=**/node_modules
set wildignore+=**/dist
set wildignore+=**/static
set wildignore+=*.so
set wildignore+=*.sw*
set wildignore+=*.zip

set wildmode=longest,list,full
set wildmenu

let g:javascript_plugin_jsdoc = 1

autocmd BufWritePre * :%s/\s\+$//e

" custom mappings
map , <leader>

" ctrl p to CommandT
map <c-p> :CommandT <enter>
map <c-a> :Grepper <enter>

map <leader>n :NERDTree <enter>
map <leader>a <Plug>(easymotion-s)
map <leader>s <Plug>(easymotion-s2)

" grepper
let g:grepper = {}
let g:grepper.ag = { 'grepperg': 'git grep -nI' }
"
" copy selected text to clipboard
let g:vim_pbcopy_local_cmd = "pbcopy"

" Use grip with markdown preview plugin
let vim_markdown_preview_github=1

" Use Google Chrome as the default web browser for markdown preview
let vim_markdown_preview_browser='Google Chrome'

" Draw a line to show the column layout limit
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=0 guibg=lightgrey
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif
