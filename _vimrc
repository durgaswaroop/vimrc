set nocompatible
execute pathogen#infect()

"Abbreviations ............. {{{
""""""""""""""""""""""""""""""""
iab tihs this
iab psvm public static void main(String [] args)
iab inorempa inoremap
iab inoreamp inoremap
iab nnorempa nnoremap
iab vnorempa vnoremap
iab syso System.out.println(

cab inoreamp inoremap
cab nnorempa nnoremap
cab vnorempa vnoremap
cab inorempa inoremap
"iab
"}}}


inoremap <C-space> <c-p>
inoremap jk <Esc>
syntax on

"sets the numbering on
set nu relativenumber
set numberwidth=3 bg=dark
"Ignores the case of searching word when all letters are lower case
set ignorecase
set smartcase
set encoding=utf-8
set fileencoding=utf-8
set incsearch     " show search matches as you type
set wildmenu
"set ft=txtfmt "for formatiing text. Txtfmt plugin
set autochdir "changes the current directory as the root directory for NERDTree
"Figure that out Douglas Adams
"set scrolloff=42  "
set scrolloff=3

set shiftwidth=2
set tabstop=2 "a tab is 4 space
"set softtabstop=2
set laststatus=2
set hlsearch      " highlight search terms
set backspace=2
set backspace=indent,eol,start
nohl
"set showbreak=...
"let &showbreak =
set wrap
set linebreak

"set invnumber "The current line number will be shown as 0

"Sets visual bell. So, no sounds
"set vb
"Disables the flashing from vb
"set t_vb=
set copyindent
set noswapfile nobackup nowritebackup
set cursorline
set autoread
set smarttab
set shell=C:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe
set history=500

lcd %:p:h

let mapleader=" "
let maplocalleader="\\"

filetype plugin indent on

inoremap :q! <Esc>:q!
"Autocmd Experiemting
""""""""""""""""""""""
"This helps to autosave a file. But you need a name for that. So, need to add
"a silent
autocmd! CursorHold silent! * update
"Disables audiobell and visual bell
autocmd! GUIEnter * set vb t_vb=

"Deletes Trailingspaces everytime before writing a file to disk
autocmd! BufWritePre silent! * call DeleteTrailingSpaces()

augroup AHK
	autocmd! FileType ahk inoremap % %<Esc>a%<Esc>i
	autocmd! FileType ahk set autoindent
	autocmd! BufNewFile,BufReadpre *.ahk nnoremap <F7> :silent exec "!autohotkey %"<cr>
	autocmd! BufNewFile,BufReadpre *.ahk inoremap <F7> <Esc>:silent exec "!autohotkey %"<cr>i
augroup END

augroup Comments
	au!
	autocmd FileType java nnoremap <buffer> <localleader>c I//<Esc>
	autocmd FileType c nnoremap <buffer> <localleader>c I//<Esc>
	autocmd FileType vim nnoremap <buffer> <localleader>c I"<Esc>
	autocmd FileType sh nnoremap <buffer> <localleader>c I#<Esc>
	autocmd FileType ahk nnoremap <buffer> <localleader>c I;<Esc>
augroup END

augroup GridMoveStuff
	au!
	autocmd BufNewFile,BufReadPre *.grid iab m1top    [Monitor1Top
	autocmd BufNewFile,BufReadPre *.grid iab m1bot    [Monitor1Bottom
	autocmd BufNewFile,BufReadPre *.grid iab m1left   [Monitor1Left
	autocmd BufNewFile,BufReadPre *.grid iab m1right  [Monitor1Right
	autocmd BufNewFile,BufReadPre *.grid iab mr1top   [MonitorReal1Top
	autocmd BufNewFile,BufReadPre *.grid iab mr1bot   [MonitorReal1Bottom
	autocmd BufNewFile,BufReadPre *.grid iab mr1left  [MonitorReal1Left
	autocmd BufNewFile,BufReadPre *.grid iab mr1right [MonitorReal1Right
augroup END

augroup Java_stuff
	au!
	autocmd BufNewFile,BufReadPre,BufWritePre *.java nnoremap <buffer> <localleader>c I//<ESC>
	"autocmd BufNewFile,BufReadPre,BufWritePre *.java :normal! set showbreak=
	"autocmd FileType java :set showbreak=
	autocmd BufNewFile,BufReadPre *.java set autoindent nospell
	"autocmd BufReadPre,BufWritePre *.java :normal! mzgg=G`z
augroup END

augroup HTML
	au!
	autocmd FileType html set autoindent
augroup END

augroup notes
	au!
	autocmd FileType notes nnoremap <leader>/ ^i-> <esc>a<cr>
	autocmd FileType notes nnoremap <leader>. ^i<c-i>>> <esc>a<cr>
	autocmd FileType notes nnoremap <leader>, ^i<c-i><c-i>-) <esc>a<cr>
	autocmd FileType notes inoremap <leader>/ <esc>^i-> <esc>a<cr>
	autocmd FileType notes inoremap <leader>. <esc>^i<c-i>>> <esc>a<cr>
	autocmd FileType notes inoremap <leader>, <esc>^i<c-i><c-i>-) <esc>a<cr>
augroup END

augroup markdown
	au!
	"autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
	autocmd BufNewFile,BufReadPost *.md set filetype=markdown
	autocmd FileType md set filetype=markdown
	autocmd FileType markdown nnoremap <leader>, ^dT0I* <Esc>o<CR>
	autocmd FileType md nnoremap <leader>, ^dT0I* <Esc>o<CR>
	autocmd BufNewFile,BufReadPost *.todo set filetype=markdown
	autocmd FileType markdown onoremap ih :<C-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<CR>
	autocmd FileType markdown onoremap ah :<C-u>execute "normal! ?^==\\+$\r:nohlsearch\r$VkOi"<CR>
	autocmd FileType markdown onoremap lh :<c-u>execute "normal! ?^[-\|=]\\+$\rkV"<cr>
	"Creates the underline for h1
	autocmd FileType markdown,md nnoremap <Leader>1 yypVr=o
	"Creates the underline for h2
	autocmd FileType markdown,md nnoremap <Leader>2 yypVr-
augroup END

":autocmd FocusLost * :set cursorline!
":autocmd FocusGained * :set cursorline!

set list
"set listchars=tab:>.,eol:�
"set listchars=tab:��,eol:�
" set listchars=tab:\ \ ,eol:�
set listchars=tab:\|\ ,eol:�

let fontSize=14
"execute "set guifont=Consolas:h14:cANSI
"set guifont=Consolas:h13:cANSI
"set guifont=courier_new:h14:cansi
"set guifont=Monaco:h12:cANSI
"set guifont=Menlo:h12:cANSI
colorscheme desert

"Converts the CURRENT word to Uppercase
inoremap <C-u> <Esc>viwUei
nnoremap <C-u> viwU
"Opens a new window to ask which file to open"
nnoremap <C-n> :browse confirm e<cr>
nnoremap <C-S-s> :browse confirm saveas<cr>
nnoremap <C-s> :update<cr>

"To move tabs around
"""""""""""""""""""""""
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" Checks in dic when spell check is enabled. 'k' would check always
set complete=.,w,b,u,t,i,kspell


"Auto Brackets and other ending Auto completion
"The expr commands help to skip over the closing character
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap { {}<Left>
inoremap {{ {
inoremap {<CR> {<CR>}<Esc>O
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap " ""<Left>
inoremap "" "
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

inoremap ' ''<Left>
inoremap '' '
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"

inoremap ( ()<Left>
inoremap (( (
inoremap (<CR> (<CR>)<Esc>O
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap [ []<Left>
inoremap [[ [
inoremap [<CR> [<CR>]<Esc>O
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

"All Leader Commands
"""""""""""""""""""""
let mapleader=" "  

nnoremap <LEADER>f :set ft=txtfmt<CR>
nnoremap <LEADER>r :vsp $MYVIMRC<CR>
nnoremap <LEADER>sv :so $MYVIMRC<CR>
"Source my current file"
nnoremap <LEADER>sc :so %<CR>
nnoremap <LEADER>h :nohl<CR>
nnoremap <LEADER>p :CtrlP<CR>
nnoremap <LEADER>w :set wrap!<cr>
"Swaps two words with marked a and b
"TODO: ADD more functionality to swap from any two registers. Currently issues
"with words of varying lengths
nnoremap <Leader>e `ayiw`bviwp`aviwp

"Easily resize the splits"
""""""""""""""""""""""""""""
nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Up> :res +5<CR>
nnoremap <C-Down> :res -5<CR>

"Random function calls
"nnoremap <LEADER>fs :call FirefoxSearch(:normal yiw)<CR>
":command! -nargs=1 FS :call FirefoxSearch(<q-args>)
"nnoremap <LEADER>cs :call TimeChanges()<CR>
"" Leader 6 to insert a line above
nnoremap <LEADER>6 O<ESC>j
 " Leader - to insert a line below
nnoremap <LEADER>- o<ESC>k

nnoremap <LEADER>n :NERDTreeToggle<CR>

"mapping Arrow keys to something useful
"""""""""""""""""""""""""""""""""""""""
nnoremap <up> ddkkp
nnoremap <down> ddp
nnoremap <left> <nop>
nnoremap <right> :vsplit <CR>

"Opens the new split keeping the current file in its exact position. Usually it pushes it to the new split loc
"and opens it in the current position
set splitright splitbelow

"; goes to the last non-blank character of the line
nnoremap ; g_
nnoremap j gj
nnoremap k gk
nnoremap G Gzz
nnoremap zz :update<CR>
nnoremap X :q<CR>
nnoremap zx :wq<CR>
nnoremap Y y$
"inoremap <C-h> <left>
"inoremap <C-j> <down>
"inoremap <C-k> <up>
"inoremap <C-l> <right>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"Surround with Particles. Should probably put this in a different file
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Surrounds the selected word with single quotes
nnoremap <LEADER>' viw<ESC>a'<ESC>bi'<ESC>el

"Adding formatting to the line
"nmap <LEADER>b ^i<C-\><C-\>fb<ESC>$a<C-\><C-\>f-<CR>
"Adding Colors to entire lines 
nmap <LEADER>. ^i<C-I>>> <Esc>A<CR>
nmap <LEADER>/ ^i-> <ESC>A<CR>
"imap <LEADER>. <Esc>^i<C-I>>> <Esc>A<CR>
"imap <LEADER>/ <Esc>^i-> <ESC>A<CR>
nmap <LEADER>6 O<ESC>j    " Leader 6 to insert a line above
nmap <LEADER>- o<ESC>k    " Leader - to insert a line below
nmap <LEADER>n :NERDTreeToggle<CR> "Opens Nerd Tree with <Leader>n
"Surrounds the selected word with double quotes
nnoremap <LEADER>" viw<ESC>a"<ESC>bi"<ESC>el
vnoremap <LEADER>" viw<ESC>a"<ESC>bi"<ESC>el

"Surrounds the selection with brackets
vnoremap <LEADER>{ <ESC>`<i{<ESC>`>a}<ESC>`>

" Easy 'split' navigation
""""""""""""""""""""""""
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"mapping Ctrl/shift/tab to switch b/w tabs
""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <C-S-Tab> :tabprevious<CR>
inoremap <C-Tab> <ESC>:tabnext<CR>
inoremap <S-Tab> <ESC>:tabprevious<CR>

"TODO:Should work more on this. Not working now"
"nnoremap <Leader><UP> :call Resizer()<CR>
"
function! DeleteTrailingSpaces()
  execute "normal! mzA  "
  "Deletes all Trailing spaces"
  %s/\s\+$//g
  execute "normal! `z"
endfunction

""function! TimeChanges()
"		if strftime("%H")<18
"				colorscheme koehler
"				"set background=light
"		else
"				colorscheme gotham
"				"set background=dark
"		endif

"endfunction

"Highlighting things
""""""""""""""""""""""""
"When a search matches it makes it yellow instead of huglighting it
"hi search guibg=NONE guifg=yellow gui=bold
hi NonText ctermfg=7 guifg=#afafaf
"For the tab character
"hi SpecialKey ctermfg=7 guifg=#414141
hi SpecialKey ctermfg=7 guifg=#afafaf
"hi cursorlinenr guifg=blue guibg=white
hi CursorLine ctermbg=black cterm=bold
"hi CursorLine guibg=grey
if has('gui_running')
  so $VIM/_gvimrc
endif
" For snipmate to work, added source C:\Program Files (x86)\Vim\vimfiles\bundle\vim-snipmate\plugin\snipMate.vim to the last line of the same file. Just remember
