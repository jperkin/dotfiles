"
"      Jonathan Perkin <jonathan@perkin.org.uk> wrote this file.
"
" You can freely distribute/modify it (and are encouraged to do so),
" and you are welcome to buy me a beer if we ever meet and you think
" this stuff is worth it.  Improvements and cleanups always welcome.
"
" dot.vimrc - main vim resource file.
"
"   http://www.vim.org/
"


"
" Miscellaneous settings.  "set nocompatible" must come first, as it affects
" the behaviour of subsequent settings.
"
set nocompatible        " disable vi compatibility
set nobackup            " don't keep backup files
set nohlsearch          " disable highlighted search
set laststatus=2        " show status line
set nomodeline          " do not parse modes in files, big security risk
set ruler               " show the cursor position in status bar
set showmatch           " show matching brackets
set showmode            " show current mode in status bar
set spelllang=en_gb     " load native dictionary for spell check

"
" Configure auto commands.
"
if has("autocmd")

  " Clear any existing auto commands
  autocmd!

  " Enable file type detection and customisation
  filetype plugin indent on

  " Add missing filetypes
  autocmd BufNewFile,BufRead *.gv     set ft=dot
  autocmd BufNewFile,BufRead *.json   set ft=json

  " Filetype-based editing
  autocmd FileType awk        set et sta sts=4 sw=4
  autocmd FileType c          set et sta sts=4 sw=4
  autocmd FileType conf       set et sta sts=4 sw=4
  autocmd FileType dot        set et sta sts=2 sw=2
  autocmd FileType html       set et sta sts=2 sw=2
  autocmd FileType javascript set et sta sts=2 sw=2
  autocmd FileType lua        set et sta sts=2 sw=2
  autocmd FileType m4         set et sta sts=4 sw=4
  autocmd FileType perl       set et sta sts=4 sw=4
  autocmd FileType php        set et sta sts=2 sw=2
  autocmd FileType python     set et sta sts=4 sw=4
  autocmd FileType ruby       set et sta sts=2 sw=2
  autocmd FileType sh         set et sta sts=4 sw=4
  autocmd FileType vim        set et sta sts=2 sw=2

  " Enable spell checker when editing mail
  autocmd FileType mail       set spell

endif

"
" Force colours with TERM=xterm as it is invariably supported.  The problem
" with the 'proper' solution of setting TERM=xterm-xfree86 is that not all
" systems have that available and it's a pain to set up correctly.
"
if &term =~ "xterm"
  set t_Co=16
  if has("terminfo")
    set t_Sb=[4%p1%dm
    set t_Sf=[3%p1%dm
  else
    set t_Sb=[4%dm
    set t_Sf=[3%dm
  endif
endif

"
" I cannot stand terminals which clear the screen after exiting
"
set t_te=
set t_ti=

"
" Enable syntax highlighting if available
"
if has("syntax") && (&t_Co > 2)
  syntax on
  set background=dark
  colorscheme solarized
  " Override some of the default theme colours
  highlight Comment       ctermfg=10                cterm=none
  highlight Normal        ctermfg=none              cterm=none
  highlight StatusLine    ctermfg=3     ctermbg=0   cterm=none
  highlight StatusLineNC  ctermfg=3     ctermbg=0   cterm=none
  highlight mailSubject   ctermfg=6                 cterm=none
  highlight mailSignature ctermfg=4                 cterm=none
  " Match mutt colours
  highlight mailQuoted1   ctermfg=6                 cterm=none
  highlight mailQuoted2   ctermfg=3                 cterm=none
  highlight mailQuoted3   ctermfg=2                 cterm=none
  highlight mailQuoted4   ctermfg=13                cterm=none
  highlight mailURL       ctermfg=13                cterm=none
  highlight! link mailQuoted5 mailQuoted1
  highlight! link mailQuoted6 mailQuoted2
  highlight! link mailQuoted7 mailQuoted3
  highlight! link mailQuoted8 mailQuoted4
  highlight! link vimLineComment Comment
endif
