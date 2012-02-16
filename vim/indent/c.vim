if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetMyCIndent()

function! GetMyCIndent()
    let theIndent = cindent(v:lnum)

    let m = matchstr(getline(v:lnum - 1),
    \                '^\s*\w\+\s\+\S\+.*=\s*{\ze[^;]*$')
    if !empty(m)
        let theIndent = len(m)
    endif

    return theIndent
endfunction
setlocal cindent
