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
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" NOTE: Install 'grip' as well
Plug 'JamshedVesuna/vim-markdown-preview'

" NOTE: go to where this plugin was installed '~/.vim/plugged/command-t' and
" run 'rake make'
" Plug 'wincent/command-t'

call plug#end()            " required

filetype plugin indent on    " required

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set backspace=indent,eol,start

set nocompatible              " be iMproved, required

filetype off                  " required
colo delek

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

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
" map <c-p> :CommandT <enter>

map <c-p> :FZF <enter>
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

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set encoding to UTF-8 to show glyphs
set encoding=utf8

" Enables syntax highlighting for JSDocs
let g:javascript_plugin_jsdoc = 1

" Set indentLine config
let g:indentLine_color_term = 239
let g:indentLine_leadingSpaceChar = '|'
let g:indentLine_char = '|'

" Draw a line to show the column layout limit
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=0 guibg=lightgrey
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif
