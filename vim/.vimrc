set nocompatible
filetype off

" Vundle muh Bundle
set rtp=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" Settings
filetype plugin indent on

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

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
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
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
set previewheight=20
set list listchars=tab:⇥⇥,trail:·

" Free JSON highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNew,BufRead Podfile set ft=ruby

" Ignore some files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

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

" Mouse
if has("mouse")
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    set ttymouse=xterm2

    autocmd VimEnter,FocusGained,BufEnter * set ttymouse=xterm2
  endif
endif
