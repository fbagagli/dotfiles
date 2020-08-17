" vimplug autoinstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'saltstack/salt-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'majutsushi/tagbar'
" Initialize plugin system
call plug#end()

" function to Trim away trailing whitespaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

" for saltstack plugin
filetype plugin indent on " enabling filetype detection for plugin

" WSL
let uname = substitute(system('uname'),'\n','','')
if uname == 'Linux'
    let lines = readfile("/proc/version")
    if lines[0] =~ "Microsoft"
        set backupcopy=no " used to avoid temporary file not correctly deleted (WSL)
    endif
endif

" Colors
syntax enable           " enable syntax processing

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

" Search
set hlsearch   " highlight searched elements
set incsearch  " incremental search
set ignorecase " ignore case in search

" Shortcuts
" https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
map <C-n> :NERDTreeToggle<CR>   " opening nerd tree
map <F2> :call TrimWhiteSpace()<CR>     " normal, visual, select
map! <F2> :call TrimWhiteSpace()<CR>    " command and insert mode
nmap <F8> :TagbarToggle<CR>
