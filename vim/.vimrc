set nocompatible
filetype off

" Vundle muh Bundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'chriskempson/base16-vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-dispatch'
Bundle 'fatih/vim-go'
Bundle 'rking/ag.vim'
Bundle 'ervandew/supertab'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'brettof86/vim-swigjs'
Bundle 'evidens/vim-twig'
Bundle 'othree/html5.vim'

filetype indent plugin on

" Colors
" colorscheme base16-tomorrow
" set background=dark
" colorscheme base16-brewer
colorscheme base16-eighties
set background=dark

set wildignore+=*.o,*.obj,*DS_Store*,tmp/*,*/log/*,.git/*,node_modules/*,.vagrant/*,.tmp/*,.librarian/*,.git*,.ruby-version,*.lock,.bundle/*

let g:ctrlp_custom_ignore = 'node_modules'

augroup myfiletypes
  autocmd!
  autocmd FileType ruby,eruby,yaml,javascript,scss,css,puppet setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType php setlocal relativenumber
  autocmd FileType go setlocal relativenumber
  autocmd FileType html,mustache,handlebars,twig setlocal ai sw=4 sts=4 et relativenumber
  autocmd FileType markdown setlocal ai sw=2 sts=2 et textwidth=80
augroup END

if !exists("g:gofmt_command")
	let g:gofmt_command = "goimports"
endif

" Settings
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set autochdir
set backspace=indent,eol,start
set history=500
set ruler
set number
set relativenumber
set backupdir=~/.tmp
set directory=~/.tmp
set autoread
set viminfo+=!
set guioptions-=T
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set noincsearch
set ignorecase smartcase
set laststatus=2
set gdefault
set shiftround
set nofoldenable
set hidden
set visualbell
set timeoutlen=1000 ttimeoutlen=0
set nuw=5
set colorcolumn=80
set encoding=utf8
set so=14
set previewheight=10
set list listchars=tab:\│\ ,trail:·

" Emmet
let g:user_emmet_leader_key = '<c-e>'

" NetRW
" let g:netrw_liststyle=3 " Use tree-mode
" let g:netrw_browse_split=4 " Open in previous buffer
" let g:netrw_preview=1 " Preview in vertical split
" let g:netrw_winsize=20

" Extra Syntax Higlighting for JS libs
let g:used_javascript_libs = 'angularjs,jquery'

" Free JSON highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript
" Free Podfile highlighting
autocmd BufNew,BufRead Podfile set ft=ruby
" Free Vagrantfile hightlighting
autocmd BufNew,BufRead Vagrantfile set ft=ruby
" Free Gemfile hightlighting
autocmd BufNew,BufRead Gemfile set ft=ruby
" Free Puppetfile highlighting
autocmd BufNew,BufRead Puppetfile set ft=ruby
" Free Berksfile hightlighting
autocmd BufNew,BufRead Berksfile set ft=ruby

" Status line
set statusline=%F%m%r%h%w\ \ \ \ \ \ \ 
set statusline+=%{fugitive#statusline()}\ \ \ \ \ \ \ \ 
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]\ \ \ \ \ \ \ \ 
set statusline+=\ [line\ %l\/%L]

" Catch :W when it's supposed to be :w
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Set ((getcmdtype() is# ':' && getcmdline() is# 'Set')?('set'):('Set'))

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Custom Mappings and Aliases
let mapleader=","

" NetRW can kill directories
let g:netrw_localrmdir="rm -r"

map <leader>p :CtrlP<cr>
map <leader><space> :noh<cr>
au Filetype go nnoremap <leader>r :GoRun %<cr>

" Mouse
if has("mouse")
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    set ttymouse=xterm2

    autocmd VimEnter,FocusGained,BufEnter * set ttymouse=xterm2
  endif
endif
