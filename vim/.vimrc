set nocompatible
filetype off

" Vundle muh Bundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'chriskempson/base16-vim'
Bundle 'kien/ctrlp.vim'

filetype indent plugin on

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
set previewheight=10
set list listchars=tab:⇥⇥,trail:·

" NetRW
let g:netrw_liststyle=3 " Use tree-mode
"let g:netrw_browse_split=4 " Open in previous buffer
"let g:netrw_preview=1 " Preview in vertical split
"let g:netrw_winsize=20

" Colors
let base16colorspace=256
colorscheme base16-railscasts
set background=dark

" Free JSON highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNew,BufRead Podfile set ft=ruby

" Ignore some files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.Trash,.Trash,.DS_STORE

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

" Toggleable Vexplore
" function! ToggleVExplorer()
"   if exists("t:expl_buf_num")
"     let expl_win_num = bufwinnr(t:expl_buf_num)
"     if expl_win_num != -1
"       let cur_win_nr = winnr()
"       exec expl_win_num . 'wincmd w'
"       close
"       exec cur_win_nr . 'wincmd w'
"       unlet t:expl_buf_num
"     else
"       unlet t:expl_buf_num
"     endif
"   else
"     exec '1wincmd w'
"     Vexplore
"     let t:expl_buf_num = bufnr("%")
"   endif
" endfunction

" Custom Mappings and Aliases
let mapleader=","

map <leader>ve :call ToggleVExplorer()<cr>
map <leader>p :CtrlP<cr>

" Mouse
if has("mouse")
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    set ttymouse=xterm2

    autocmd VimEnter,FocusGained,BufEnter * set ttymouse=xterm2
  endif
endif
