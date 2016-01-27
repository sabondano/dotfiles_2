" Leader
let mapleader = " "

set nocompatible
filetype off

" load all plugins in ~/.vimrc.bundles
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
source ~/.vimrc.bundles
call vundle#end()

filetype plugin indent on
syntax on
set mouse+=a
set number

set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set incsearch

inoremap kj <esc>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

set noswapfile

" added the stuff below from instructions when installing solarized http://blog.likewise.org/2012/04/how-to-set-up-solarized-color-scheme.html
set ruler
set cursorline
"call pathogen#infect()
syntax enable
" Solarized stuff
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" add spell checking and automatic wrapping at the recommended 72 columns to
" you commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Switch between the last two files
nnoremap <leader><leader> <c-^>

runtime macros/matchit.vim

" Auto-indent the entire file
map <Leader>i mmgg=G`m

" Copy the entire buffer into the system register
nmap <leader>co ggVG*y

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Determine proper commmand to run the current spec or spec file, and then
" hand off to Vim Tmux Runner
" let g:rspec_runner = "call VtrSendCommand('rspec {spec}')"
let g:rspec_command = "VtrSendCommandToRunner! rspec {spec}"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
