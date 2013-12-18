set nocompatible
filetype off

" Vundle muh Bundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'ervandew/supertab'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'othree/html5.vim'
Bundle 'mattn/emmet-vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'elixir-lang/vim-elixir'
Bundle 'chriskempson/base16-vim'
Bundle 'jnwhiteh/vim-golang'

filetype indent plugin on

augroup myfiletypes
  autocmd!
  autocmd FileType ruby,eruby,yaml,html,javascript setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
augroup END

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
set list listchars=tab:»·,trail:·

" Emmet
let g:user_emmet_leader_key = '<c-e>'

" NetRW
let g:netrw_liststyle=3 " Use tree-mode
"let g:netrw_browse_split=4 " Open in previous buffer
"let g:netrw_preview=1 " Preview in vertical split
"let g:netrw_winsize=20

" Colors
colorscheme base16-railscasts
set background=dark

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

" Ignore some files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.Trash,.Trash,.DS_STORE,config.codekit
let NERDTreeIgnore=['config.codekit']

" Status line
" set statusline=%F%m%r%h%w\
" set statusline+=%{fugitive#statusline()}
" set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
" set statusline+=\ [line\ %l\/%L]

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

map <leader>p :CtrlP<cr>
map <leader>nt :NERDTreeToggle<cr>

" Close NERDTREE if it is last man standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Mouse
if has("mouse")
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    set ttymouse=xterm2

    autocmd VimEnter,FocusGained,BufEnter * set ttymouse=xterm2
  endif
endif
