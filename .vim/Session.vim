let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <S-CR> o
map  <BS>
vmap 	 I	
nmap 	 I	
omap 	 I	
noremap  A
map  :Utu
noremap   a h
vmap ' call AddQuote()
noremap , f,
map <D-F> :!open .
map <D-V> :w:source $MYVIMRC
map <D-B> :call Python("build")
map <D-/> :call Python("toggle_comment")
map <D-d> bve
map <D-K> :call HelpFinder()
map <D-k> :call Help()
map <D-]> l
map <D-\> 
map <D-‘> L
map <D-“> H
map <D-[> h
vmap <D-2> 
vmap <D-0> 
map <D->> :<Up>
map <D-E> :call Python("test2")
map <D-e> :call Python("test")
map <D-r> :call Python("run")
map == =
imap ® l~i
imap ¬ $a
imap Ò Ò
imap Ó Ó
imap Î lDa
imap Ï F
imap ø <D-cr>
imap Ø <D-S-cr>
imap Ô Ji
imap ƒ ea
imap ˙ ^i
noremap _ :call Python("addscore")
imap ∑ ea
imap ∫ bi
imap ” "
imap “ "
nmap gx <Plug>NetrwBrowseX
imap ： :
imap ／ /
imap ＃ #
imap ］ ]
imap ［ [
imap ｝ }
imap ｛ {
imap ， ,
map tl xph
map th hxp
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
noremap <S-Space> i l
map <S-BS> x
noremap <BS> i<BS>
vmap <S-Tab> I<Del>
nmap <S-Tab> I<Del>
omap <S-Tab> I<Del>
inoremap  <Home>
inoremap  <Left>
inoremap  <Del>
inoremap  <End>
inoremap  <Right>
inoremap  i
inoremap  <Down>
inoremap  <Up>
imap <D-B> <D-B>
imap <D-/> :call ToggleComment()
inoremap <D-i> 
inoremap <D-u> 
imap <D-H> I
imap <D-L> <End>
imap <D-]> <D-]>
imap <D-[> <D-[>
imap <D-2> 
imap <D-0> 
imap <D-S-cr> O
imap <D-cr> <S-CR>
imap <D-r> :call Python("run")
imap <D-e> <D-e>
imap <D->> :<Up>
map ® ~
map ¬ $
map Ò A
map Ó I
map Ø O
noremap Æ F"
noremap æ f"
map ˙ ^
map ˚ ddkP
noremap ≤ F,
map ∆ ddp
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoread
set background=dark
set backspace=2
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set hlsearch
set incsearch
set listchars=tab:⋮\ ,nbsp:·,trail:·
set modelines=0
set runtimepath=~/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,~/.vim/after,/usr/local/go/misc/vim
set noswapfile
set tabstop=4
set wildmenu
set window=0
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Projects/GoProject/src/github.com/chzyer/muxque
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 ~/Projects/GoProject/src/github.com/chzyer/muxque/README.md
args README.md
edit ~/Projects/GoProject/src/github.com/chzyer/muxque/README.md
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal noautoindent
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=fb:*,fb:-,fb:+,n:>
setlocal commentstring=>\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'markdown'
setlocal filetype=markdown
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcqln
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\|^[-*+]\\s\\+
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
set list
setlocal list
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=htmlcomplete#CompleteTags
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal noscrollbind
setlocal shiftwidth=8
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'markdown'
setlocal syntax=markdown
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 12 - ((0 * winheight(0) + 15) / 31)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12
normal! 05l
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
