source ~/.vim_colors

set lines=60
set columns=180

" Don't show the toolbar, or scrollbars
set guioptions=egmt

if has('gui_macvim')
    set fuopt+=maxvert,maxhorz                       " Real full screen.
    macm Window.Select\ Previous\ Tab key=<D-S-Left> " Command+Shift+Left.
    macm Window.Select\ Next\ Tab key=<D-S-Right>    " Command+Shift+Right.
endif

set antialias
" Set in the following order to cover: OSX first, Windows second,
" Linux/FreeBSD third
set guifont=Menlo:h14,Monaco:h12,Inconsolata:h12,Consolas:h12,Lucida\ Console:h8,Bitstream\ Vera\ Sans\ Mono:h10

set termencoding=utf-8

" Maximize both horizontally and vertically when we go full-screen
set fuoptions=maxhorz,maxvert

" List all buffers for a tab in addition to the path to the visible file
function! InfoGuiTooltip()
    let bufferlist = 'Buffers:'
    for i in tabpagebuflist()
        let buffername = bufname(i)
        if strlen(buffername) == 0
            let buffername = '[No Name]'
        endif
        let bufferlist .= "\n\t".fnamemodify(buffername,':t')
    endfor
    let buffername = bufname($)
    if buffername == ''
        return '[No Name]'
    endif
    return buffername."\n".bufferlist
endfunction
set guitabtooltip=%{InfoGuiTooltip()}


