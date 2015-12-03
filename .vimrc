set nocompatible
execute pathogen#infect()
syntax on
" lcd %:p:h
filetype plugin indent on
if filereadable(glob("~/.vimrc.local")) 
	source ~/.vimrc.local
endif

"Abbreviations ............. {{{
""""""""""""""""""""""""""""""""
iab sevearl several
iab installtaion installation
iab installtion installation
iab nad and
iab ahve have
iab tihs this
iab thier their
iab teh the
iab psvm public static void main(String [] args)
iab @m@ durgaswaroop@gmail.com
iab inorempa inoremap
iab inoreamp inoremap
iab nnorempa nnoremap
iab vnorempa vnoremap

iab syso System.out.println()<Esc>i
cab inoreamp inoremap
cab nnorempa nnoremap
cab vnorempa vnoremap
cab inorempa inoremap
"iab 
"}}}

syntax on

"sets the numbering on
set nu relativenumber
set numberwidth=3 bg=dark
"Ignores the case of searching word when all letters are lower case
set ignorecase
set smartcase 
"set encoding=utf-8
set incsearch     " show search matches as you type 
set wildmenu
"set ft=txtfmt "for formatiing text. Txtfmt plugin
set autochdir "changes the current directory as the root directory for NERDTree
"Figure that out Douglas Adams
"set scrolloff=42  "
set scrolloff=3

set shiftwidth=2
set tabstop=4 "a tab is 4 space
"set softtabstop=2
set laststatus=2
set hlsearch      " highlight search terms
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
set history=500
set list
set listchars=tab:\|\ ,eol:¬
set complete=.,w,b,u,t,i,kspell
set foldlevel=0
set splitright splitbelow
set fillchars=vert:│ "space saver
set clipboard=unnamed
let g:fontSize=13
let g:mapleader=" "
let g:maplocalleader="\\"
let g:scour_browser="Chrome"
let g:scour_search_engine="Google"
"}}}

"Auto commands"{{{
autocmd! CursorHold silent! * update "autosave a file
autocmd! GUIEnter * set vb t_vb= "Disables audiobell and visual bell
" autocmd! BufEnter * if &ft != "help" | :call ReadOnlyAlert()

"{{{ AHK autocommands
augroup AHK
	autocmd! FileType ahk inoremap % %<Esc>a%<Esc>i
	autocmd! FileType ahk setlocal autoindent
	autocmd! BufNewFile,BufReadpre *.ahk nnoremap <F5> :silent exec "!autohotkey %"<CR>
	autocmd! BufNewFile,BufReadpre *.ahk inoremap <F5> <Esc>:silent exec "!autohotkey %"<CR>i
augroup END
"}}}

"{{{ Vim autocommands
augroup VIM
	au!
	autocmd BufEnter,BufReadPre *.vim setlocal foldmethod=marker
	autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

"{{{ Comments autocommands for all languages
augroup comments
	au!
	autocmd FileType java nnoremap <buffer> <localleader>c I//<Esc>
	autocmd FileType c nnoremap <buffer> <localleader>c I//<Esc>
	autocmd FileType vim nnoremap <buffer> <localleader>c I"<Esc>
	autocmd FileType sh nnoremap <buffer> <localleader>c I#<Esc>
	autocmd FileType ahk nnoremap <buffer> <localleader>c I;<Esc>
augroup END
"}}}

"{{{ Grid moce autocommands
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
"}}}

"{{{ Java autocommands
augroup java_stuff
	au!
	autocmd BufNewFile,BufReadPre *.java setlocal autoindent nospell
	autocmd FileType java nnoremap <F5> :SCCompileRun<cr>
augroup END
"}}}

"{{{ C programming autocommands
augroup C_stuff
	au!
	autocmd BufNewFile,BufWritePre,BufReadPre *.c setlocal foldmethod=marker
	autocmd BufNewFile,BufWritePre,BufReadPre *.c nnoremap  silent! za
	autocmd FileType c nnoremap <F5> :SCCompileRun<cr>
augroup END
"}}}

"{{{ HTML autocommands
augroup HTML
	au!
	autocmd FileType html setlocal autoindent
	autocmd FileType html nnoremap <F5> :silent exec "!chrome %"<cr>
augroup END
"}}}

"{{{ Notes fileformat autocommands
augroup notes
	au!
	autocmd FileType notes nnoremap <leader>/ ^i-> <esc>a<CR>
	autocmd FileType notes nnoremap <leader>. ^i<c-i>>> <esc>a<CR>
	autocmd FileType notes nnoremap <leader>, ^i<c-i><c-i>-) <esc>a<CR>
	autocmd FileType notes inoremap <leader>/ <esc>^i-> <esc>a<CR>
	autocmd FileType notes inoremap <leader>. <esc>^i<c-i>>> <esc>a<CR>
	autocmd FileType notes inoremap <leader>, <esc>^i<c-i><c-i>-) <esc>a<CR>
augroup END
"}}}

"{{{ Markdown autocommands
augroup Markdown
	au!
	autocmd BufNewFile,BufReadPost *.md,*.todo setlocal filetype=markdown
	autocmd FileType md setlocal filetype=markdown
	autocmd FileType md setlocal spell
	autocmd FileType markdown setlocal spell
	autocmd FileType markdown nnoremap <Leader>s :set spell!<cr>
	autocmd FileType markdown setlocal expandtab
	autocmd FileType markdown setlocal nolist
	autocmd FileType markdown nnoremap <leader>, ^dT0I* <Esc>o<CR>
	autocmd FileType md nnoremap <leader>, ^dT0I* <Esc>o<CR>
	autocmd FileType markdown onoremap ih :<C-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<CR>
	autocmd FileType markdown onoremap ah :<C-u>execute "normal! ?^==\\+$\r:nohlsearch\r$VkOi"<CR>
	autocmd FileType markdown onoremap lh :<c-u>execute "normal! ?^[-\|=]\\+$\rkV"<CR>
	nnoremap <Leader>1 yypVr=o
	nnoremap <Leader>2 yypVr-o
	nnoremap <LocalLeader>1 jddkI# <Esc>
	nnoremap <LocalLeader>2 jddkI## <Esc>
augroup END
"}}}

"{{{ Textfile autocommands
augroup TextFiles
	au!
	autocmd FileType txt nnoremap <Leader>s :set spell!<cr>
augroup END
"}}}
"}}}

"TODO - In Progress functions "{{{
"nnoremap <LEADER>cs :call TimeChanges()<CR>

""function! TimeChanges()
"		if strftime("%H")<18
"				colorscheme koehler
"				"set background=light
"		else
"				colorscheme gotham
"				"set background=dark
"		endif
"endfunction 

" function! ReadOnlyAlert()
" 	if &readonly
" 		hi Normal guibg=#550000
" 	else 
" 		source $MYVIMRC
" 	endif
" endfunction"}}}

"Mappings - All of them "{{{

"{{{ Random Mappings
inoremap :q! <Esc>:q!<cr>
inoremap <C-space> <c-p>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <C-S> <C-O>:update<CR>

nnoremap  za    
nnoremap G Gzz
nnoremap j gj
nnoremap k gk
" nnoremap j <nop>
" nnoremap k <nop>
nnoremap X :q<CR>
nnoremap Y y$
nnoremap zx :wq<CR>
nnoremap zz :update<CR>
nnoremap <localleader>s :call FixMySpelling()<cr>
nnoremap [b :bprevious<cr> 
nnoremap ]b :bnext<cr>
nnoremap ]f :first<cr>
nnoremap ]l :last<cr>
nnoremap <silent> <localleader>f :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
nnoremap <Leader>fs :Scour<cr>

noremap <C-S> :update<CR>

vnoremap <C-S> <C-C>:update<CR>
vnoremap <C-C> "+y
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap <Up> dkP
vnoremap <Down> djp


" map <C-V> "+gP

"Plugin Specific Mappings {{{

"{{{ NERDTree related
nnoremap <LEADER>n :NTCustomToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
command! -nargs=0 NTCustomToggle call NERDTreeFileToggler()
autocmd! WinEnter * if exists('b:NERDTree') | execute 'normal R' | endif
"}}}
"
"CtrlP {{{
nnoremap <localleader>p :CtrlPMRU<cr>
" nnoremap <localleader>p :CtrlPMixed<cr>
let g:ctrlp_working_path_mode = 'rca' 
let g:ctrlp_root_markers = ['pom.xml']
"}}}

"Undo Tree {{{
nnoremap <Leader>u :UndotreeToggle<cr>
if has("persistent_undo")
	set undodir=~/.undodir/
	set undofile
endif
"}}}

"}}}

"All Leader Commands "{{{
nnoremap <LEADER>r :vsp $MYVIMRC<CR>
nnoremap <LEADER>sv :so $MYVIMRC<CR>
nnoremap <LEADER>sc :so %<CR>
nnoremap <LEADER>h :nohl<CR>
nnoremap <LEADER>p :CtrlP<CR>
nnoremap <LEADER>w :set wrap!<cr>
nnoremap <LEADER>6 O<ESC>j
nnoremap <LEADER>- o<ESC>k

"}}}

"Easily resize the splits"{{{
nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>
nnoremap <C-Up> :res +5<CR>
nnoremap <C-Down> :res -5<CR> 
"}}}

"Moving tabs around "{{{
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
"}}}

"{{{ Automatic brackets complete mappings
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
"}}}

"Mapping Arrow keys to something useful "{{{
nnoremap <up> ddkkp
nnoremap <down> ddp
nnoremap <left> <nop>
nnoremap <right> :vsplit <CR> 
"}}}

"{{{ surround type particles mappings
"Surround with Particles. Should probably put this in a different file
""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <LEADER>' viw<ESC>a'<ESC>bi'<ESC>el
nnoremap <LEADER>" viw<ESC>a"<ESC>bi"<ESC>el
vnoremap <LEADER>" viw<ESC>a"<ESC>bi"<ESC>el
vnoremap <LEADER>{ <ESC>`<i{<ESC>`>a}<ESC>`>
"vnoremap <C-c> "+y
"inoremap <C-v> <Esc>"+pi
"}}}

" Easy 'split' navigation "{{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l
"}}}

"mapping Ctrl/shift/tab to switch b/w tabs "{{{
nnoremap <C-Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap <C-S-Tab> :tabprevious<CR>
inoremap <C-Tab> <ESC>:tabnext<CR>
inoremap <S-Tab> <ESC>:tabprevious<CR>
"}}}
"}}}

"My Functions "{{{
function! DeleteTrailingSpaces()
	execute "normal! mzA  "
	"Deletes all Trailing spaces"
	%s/\s\+$//g
	execute "normal! `z"
endfunction

function! NERDTreeFileToggler()
	if g:NERDTree.IsOpen()
		:NERDTreeToggle
	else
		:NERDTreeFind
	endif
endfunction

function! FixMySpelling()
	execute "normal! my[s1z=`y"
endfunction
"}}}

"Highlights"{{{
hi NonText ctermfg=7 guifg=#afafaf
hi SpecialKey ctermfg=7
hi CursorLine cterm=NONE ctermbg=black
hi VertSplit ctermbg=NONE 
"}}}

"{{{ Source gvimrc if gui is available
if has('gui_running')
	so $VIM/_gvimrc
endif

" hi slred guifg=#F92672 guibg=#232526 gui=bold
" hi slgrn guifg=#A6E22E guibg=#232526 gui=bold
" hi slorg guifg=#FD971F guibg=#232526 gui=bold
" hi slblu guifg=#66D9EF guibg=#232526 gui=bold

" set statusline=%#slorg#CD=%{getcwd()}%=%#slred#\ PERM=%{getfperm(expand('%'))}\ FORMAT=%{&ff}\ TYPE=%Y\ SPELL=%{&spelllang}\ %#slgrn#\ LINE=%l/%L(%p%%)\ COL=%v\ BYTE=%o\ %#slblu#\ DEC=\%b\ HEX=\%B\ 
" color statusline colors
