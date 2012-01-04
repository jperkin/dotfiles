"  vim: set sw=4 sts=4:
"  Maintainer        : Nikolai 'pcp' Weibull <da.box@home.se>
"  URL               : http://www.pcppopper.org/
"  Revised on        : Sun, 23 Sep 2001 16:26:03 +0200
"  Patched with      : Edward L. Fox <edyfox@gmail.com> fix for case statements
"  Language          : Shell Script

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif

let b:did_indent = 1

setlocal indentexpr=GetShIndent()
setlocal indentkeys+==then,=do,=else,=elif,=esac,=fi,=fin,=fil,=done
setlocal indentkeys-=:,0#

" Only define the function once.
if exists("*GetShIndent")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

function GetShIndent()
    " Find a non-blank line above the current line.
    let lnum = prevnonblank(v:lnum - 1)

    " Hit the start of the file, use zero indent.
    if lnum == 0
        return 0
    endif

    " Add a 'shiftwidth' after if, while, else, case, until, for, function()
    " Skip if the line also contains the closure for the above
    let ind = indent(lnum)
    let line = getline(lnum)
    if line =~ '^\s*\(if\|then\|do\|else\|elif\|while\|until\|for\)\>'
                \ || (line =~ '^\s*case\>' && g:sh_indent_case_labels)
                \ || line =~ '^\s*\<\k\+\>\s*()\s*{'
                \ || line =~ '^\s*[^(]\+\s*)'
                \ || line =~ '^\s*{'
        if line !~ '\(esac\|fi\|done\)\>\s*$' && line !~ '}\s*$'
            let ind = ind + &sw
        endif
    endif

    if line =~ ';;'
        let ind = ind - &sw
    endif

    " Subtract a 'shiftwidth' on a then, do, else, esac, fi, done
    " Retain the indentation level if line matches fin (for find)
    let line = getline(v:lnum)
    if (line =~ '^\s*\(then\|do\|else\|elif\|fi\|done\)\>'
                \ || (line =~ '^\s*esac\>' && g:sh_indent_case_labels)
                \ || line =~ '^\s*}'
                \ )
                \ && line !~ '^\s*fi[ln]\>'
        let ind = ind - &sw
    endif

    return ind
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
