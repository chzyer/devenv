syntax off
" filetype off
set runtimepath+=$GOROOT/misc/vim
syntax enable
filetype plugin on

set background=dark
if(has("gui_running"))
	color vwilight
	" color solarized
else
	set encoding=utf-8	
endif

set incsearch

set guifont=monaco
set list
set listchars=tab:⋮\ ,nbsp:·,trail:·
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
let g:NERDTreeWinPos = "right"
set noexpandtab

set ts=4 " 设置缩进格式为4个空格
" set colorcolumn=80 " 提示单行最为80字符
set autochdir " 自动cd进当前目录
let g:netrw_keepdir= 0
set number " 显示行号
set nobackup
set noswapfile " 不生成swp文件
set clipboard=unnamed " 使用系统的剪贴板
set clipboard=unnamedplus
set noimdisable " normal-mode自动不使用输入法
set imdisable " normal-mode自动不使用输入法
set hlsearch
" source $VIMRUNTIME/menu.vim
set wildmenu
set autoread " 自动加载
au FileType html set omnifunc=htmlcomplete#CompleteTags
" 
source ~/.vim/map.vim

" autocmd FileType go autocmd BufWritePre <buffer> Fmt

" 触发器
autocmd VimLeavePre * call SaveSesstion()
autocmd VimEnter * call RestoreSession()
autocmd BufWritePre * call Python("ensure_save")
au BufRead,BufNewFile *.gohtml set filetype=html
au BufRead,BufNewFile *.thrift set filetype=thrift
command! Conf call Python("open_conf")
command! -nargs=* Test call Test("d", <f-args>)
command! JumpTestFile call Python("test_file")

function! SaveSesstion()
	mksession! ~/.vim/Session.vim
endfunction

function! RestoreSession()
	if argc() == 0 "vim called without arguments
		execute 'source ~/.vim/Session.vim'
	end
endfunction

func! Python(a)
python << EOF
import imp, sys, os, vim
_root = "%s/.vim" % os.environ["HOME"]
py = imp.load_source("py", "%s/py.py" % _root)
py.setup(vim, _root)
py.run(vim.eval('a:a'))
EOF
endfunc

func! Test(...)
python << EOF
import vim
print vim.eval("a:0"),  vim.eval("a:1")
EOF
endfunc
