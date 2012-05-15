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
  autocmd BufNewFile,BufRead *.gv set ft=dot

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
" Enable syntax highlighting if available
"
if has("syntax") && (&t_Co > 2)
  syntax on
  "set background=dark
  colorscheme solarized
  " Override some of the default theme colours
  highlight StatusLine      ctermfg=178         ctermbg=Black       cterm=bold
  highlight StatusLineNC    ctermfg=178         ctermbg=Black       cterm=bold
endif

"
" Have a nice xterm titlebar showing what file we're editing.
"
if has("title")
  set title
  let &titlestring = expand ("%:p:~:.:h")
endif
