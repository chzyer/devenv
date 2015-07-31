" 快捷键绑定
map th hxp
map tl xph
map <D-r> :call Python("run")<cr>
map <D-e> :call Python("test")<cr>
map <D-E> :call Python("test2")<cr>
map <tab> I<tab>
map <S-tab> I<delete><Esc>
map <D->> :<up><cr>
imap <D->> <Esc>:<up><cr>
vmap <tab> I<tab><Esc>
vmap <S-tab> I<delete><Esc>
map ∆ ddp
map ˚ ddkP

vmap ' call AddQuote()
noremap <BackSpace> i<BackSpace>
map <C-h> <BackSpace>
map <S-BackSpace> x
imap “  "
imap ”  "
imap ， ,
imap ｛ {
imap ｝ }
imap ［ [
imap ］ ]
imap ＃ #
noremap æ f"
noremap Æ F"
noremap , f,
noremap ≤ F,
inoremap <cr> <cr><Esc>i
" inoremap " "<Esc>:call InputQuote()<cr>
noremap _ :call Python("addscore")<cr>
imap <D-e> <Esc><D-e>
imap <D-r> <Esc>:call Python("run")<cr>
imap <D-cr> <S-cr>
imap <D-S-cr> <Esc>O
imap Ô <Esc>Ji
map Ø O
imap Ø <D-S-cr>
imap ø <D-cr>
imap <S-cr> <Esc>o
imap Ï <Esc>F
imap ƒ <Esc>ea
imap Î <Esc>lDa
imap ∫ <Esc>bi
imap <D-0> <Esc>
imap <D-2> <Esc>
vmap <D-0> <Esc>
vmap <D-2> <Esc>
imap ／ /
imap ： :
map <D-[> <C-w>h
map <D-“> <C-W>H
map == <C-W>=
map <D-‘> <C-W>L
map <D-\> <C-w><C-w>
map <D-]> <C-w>l
imap <D-[> <Esc><D-[>
imap <D-]> <Esc><D-]>
map <D-k> :call Help()<cr>
map <D-K> :call HelpFinder()<cr>
map <D-d> bve
map ˙     ^
imap ˙     <Esc>^i
imap Ó    <Esc>Ó
imap Ò    <Esc>Ò
map Ó    I
map Ò    A
map ¬     $
imap ¬     <Esc>$a
imap ® <Esc>l~i
map ® ~
" alt+w
imap ∑     <Esc>ea
imap <D-L> <End>
imap <D-H> <Esc>I
inoremap <D-u> <C-n>
inoremap <D-i> <C-p>
map <D-/> :call Python("toggle_comment")<cr>
imap <D-/> <Esc>:call ToggleComment()<cr>
inoremap <C-f> <Right>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Delete>
" inoremap . .<Esc>:call CallCompite()<CR>
map <C-_> :Utu<CR>

map <D-B> :call Python("build")<cr>
imap <D-B> <Esc><D-B>
map <D-V> :w<cr>:source $MYVIMRC<cr>

map <D-F> :!open .<cr><cr>
noremap <cr> A<cr>
noremap <space> a<space><Esc>h
noremap <S-space> i<space><Esc>l

" auto indent
" inoremap <tab> <Esc>:call Python("indent")<cr>
" inoremap <cr> <Esc>:call Python("newline")<cr>
