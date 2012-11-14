" ~/Dropbox/Code/dotfiles/vim/sessions/oh.vim: Vim session script.
" Created by session.vim 1.5 on 07 April 2012 at 11:56:29.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egmt
silent! set guifont=Menlo:h12,Monaco:h12,Inconsolata:h12,Consolas:h12,Lucida\ Console:h8,Bitstream\ Vera\ Sans\ Mono:h10
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'badwolf' | colorscheme badwolf | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +108 Dropbox/Code/oh-my-zsh/init.zsh
badd +1 Dropbox/Code/oh-my-zsh/zshrc
badd +1 Dropbox/Code/oh-my-zsh/plugins/git/alias.zsh
silent! argdel *
set lines=60 columns=180
winpos 14 22
edit Dropbox/Code/oh-my-zsh/init.zsh
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 89 + 90) / 180)
exe '2resize ' . ((&lines * 38 + 30) / 60)
exe 'vert 2resize ' . ((&columns * 90 + 90) / 180)
exe '3resize ' . ((&lines * 18 + 30) / 60)
exe 'vert 3resize ' . ((&columns * 90 + 90) / 180)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=4
setlocal fml=1
setlocal fdn=4
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Dropbox/Code/oh-my-zsh
wincmd w
argglobal
edit ~/Dropbox/Code/oh-my-zsh/zshrc
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=4
setlocal fml=1
setlocal fdn=4
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Dropbox/Code/oh-my-zsh
wincmd w
argglobal
edit ~/Dropbox/Code/oh-my-zsh/plugins/git/alias.zsh
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=4
setlocal fml=1
setlocal fdn=4
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 9) / 18)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/Dropbox/Code/oh-my-zsh
wincmd w
exe 'vert 1resize ' . ((&columns * 89 + 90) / 180)
exe '2resize ' . ((&lines * 38 + 30) / 60)
exe 'vert 2resize ' . ((&columns * 90 + 90) / 180)
exe '3resize ' . ((&lines * 18 + 30) / 60)
exe 'vert 3resize ' . ((&columns * 90 + 90) / 180)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=aTItO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
tabnext 1
1wincmd w

" vim: ft=vim ro nowrap smc=128
