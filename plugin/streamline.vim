"set statusline=%f      "Path to the file (filename)"
"set statusline+=\ \    "Add spaces after that"
"set statusline+=FileType:
"set statusline+=\ %y
"set statusline+=\ \ \  "Adds spaces after that"
"set statusline+=%l     "Shows the current line number"
"set statusline+=/%L    "Shows the total number of line"

set statusline=%f%m%r   "Adds the current file name, flg for Readonly files, '+' if changed"
set statusline+=\ %<[Fmt=%{&ff}]  "unix or dos format. < to show that it should wrap there"
set statusline+=\ [FileType=%Y] "File type displayed"
set statusline+=\ [Ascii=%03b]  "ascii value of character under cursor"
set statusline+=\ [Hex=%02B]    "hex value of character under cursor"
"set statusline+=\ [POS=%02v]
"set statusline+=\ \-           " Adds space for readability"
set statusline+=\%=				"Adds the next parts to the right"
set statusline+=\ [%003p%%]	   "shows the percentage of file currently at"
set statusline+=\ [Pos=%02v/%03l/%03L]   "Shows cursor pos. Column/Line/Total lines"
