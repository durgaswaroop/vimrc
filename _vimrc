set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"Sets number
set nu
let mapleader=" "  
"sets relative number
set relativenumber

set tabstop=4 "a tab is 4 spaces

"for formatiing text. Txtfmt plugin
set ft=txtfmt

"changes the current directory as the root directory for NERDTree
set autochdir 

"Mapping of Esc to jj
:imap jj <Esc>

"Mapping Arrow keys to nothing 
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

nmap yy "*y
execute pathogen#infect()
"Goes to the end of the file and puts it at the center
"nmap G Gzz 
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


"Mapping Ctrl/shift/tab to switch b/w tabs
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
imap <C-Tab> <ESC>:tabnext<CR>
imap <C-S-Tab> <ESC>:tabprevious<CR>

nmap nt :NERDTree<CR> "Opens Nerd Tree with nt
nmap <LEADER>n :NERDTreeToggle<CR>
colorscheme koehler

set guifont=Courier_New:h14:cANSI

set hlsearch      " highlight search terms

set incsearch     " show search matches as you type 
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

