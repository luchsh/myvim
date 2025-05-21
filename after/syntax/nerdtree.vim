" This block displays every other leading space in the NERDTree buffer as
" a vertical bar. It works only if your vim has the +conceal feature
" turned on, and this file must be saved as ~/.vim/after/syntax/nerdtree.vim
" to work properly.

if has("conceal")
    syntax clear NERDTreeOpenable
    syntax clear NERDTreeClosable
    let s:dirArrows = escape(g:NERDTreeDirArrowCollapsible, '~]\-').escape(g:NERDTreeDirArrowExpandable, '~]\-')
    exec 'syntax match MarkIndents #\(  \)\{-}\zs \ze \(  \)*\(['.s:dirArrows.' ] \)\?'.g:NERDTreeNodeDelimiter.'# containedin=ALL conceal cchar=|'
endif
