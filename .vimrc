set nocompatible              " 这是必需的

filetype off                  " 这是必需的

" vundle {{{
	if has('win32')
		set rtp+=$HOME/vimfiles/bundle/vundle.vim/
		call vundle#begin('$HOME/vimfiles/bundle/')
	else
		" 你在此设置运行时路径
		set rtp+=~/.vim/bundle/Vundle.vim/
		" set rtp+=~/.vim/bundle/vundle/
		" vundle初始化
		call vundle#begin()

		" alternatively, pass a path where Vundle should install plugins
		"let path = '~/some/path/here'
		"call vundle#begin(path)
	endif

	" 这应该始终是第一个
	" Plugin 'gmarik/Vundle.vim'
	Plugin 'VundleVim/Vundle.vim'

	" programming {{{
		"未托管在GitHub上的Git插件
		"Plugin 'git://git.wincent.com/command-t.git'

		"本地机器上的git软件库（即编写自己的插件时）
		"Plugin 'file:///home/gmarik/path/to/plugin'
		" 来自http://vim-scripts.org/vim/scripts.html的插件
		Plugin 'L9'
		" 与L9避免名称冲突
		" Plugin 'user/L9', {'name': 'newL9'}


		" Web、HTML、Js {{{
			" 神级插件，ZenCoding(原名)可以让你以一种神奇而无比爽快的感觉写HTML、CSS
			Bundle 'mattn/emmet-vim'
			" from: http://jsbeautifier.org
			" vim: sourcebeautify.vim, a plugin by michalliu (requires node.js, V8, SpiderMonkey or cscript js engine),
			" vim: vim-jsbeautify, a plugin by Maksim Ryzhikov (node.js or V8 required),
			" 但是sourcebeautify支持的更多：
			" Language support:
				" Javascript,CSS,HTML by js-beautify
				" JSON by jsonlint ==> 这个是node.js的程序，用npm安装
				" XML,SQL by vkBeautify ==> 这个看起来，像是一个jQuery 的插件
			" sourcebeautify 也依赖于：https://github.com/beautify-web/js-beautify

			Plugin 'elzr/vim-json'
			Plugin 'michalliu/jsruntime.vim'
			Plugin 'michalliu/jsoncodecs.vim'
			" Beautify your javascript,html,css source code inside Vim
			Plugin 'michalliu/sourcebeautify.vim'

            " Bundle 'jslint.vim'
            " Bundle 'wookiehangover/jshint.vim'
			" Use Node.js for JavaScript interpretation
            let $JS_CMD='node'
            " ==> 这个变量是 jslint.vim 这个项目的。 但报的错，明显是在jsruntime.vim里面。
            " https://github.com/hallettj/jslint.vim/issues/13
            " 就是 jsruntime.vim 里的问题，按照
            " https://github.com/hallettj/jslint.vim/blob/master/ftplugin/javascript/jslint.vim 里面的代码改就行
			" Bundle 'jsbeautify' "这个似乎不维护了。
			"这家伙就那个http://jsbeautifier.org的避免版。需要nodejs或者V8，同时依赖于 https://github.com/beautify-web/js-beautify"
			Plugin 'maksimr/vim-jsbeautify'
			" Plugin 'einars/js-beautify' " 这个就是https://github.com/beautify-web/js-beautify，是同一个东西
			Plugin 'beautify-web/js-beautify'

			Plugin 'Chiel92/vim-autoformat' " 这个除了不支持sql，支持的比前两个多多了。
      " Plugin 'beanworks/vim-phpfmt'
		"}}}

		Plugin 'SQLComplete.vim'
		Plugin 'sukima/xmledit'

	"}}}

	" git {{{
		Plugin 'tpope/vim-fugitive'
	"}}}

	" unite {{{
		Plugin 'Shougo/vimshell.vim'
		Plugin 'Shougo/vimproc.vim'
		Plugin 'Shougo/unite.vim'
		Plugin 'Shougo/neco-vim'
		Plugin 'junkblocker/unite-tasklist'
		Plugin 'kmnk/vim-unite-svn'
		Plugin 'Shougo/neomru.vim'
		Plugin 'henices/unite-stock'
		"Plugin 'farseer90718/unite-workflow'
	"}}}

	"界面 {{{
		" Plugin 'Lokaltog/vim-powerline'
		Plugin 'bling/vim-airline'
		Plugin 'vim-airline/vim-airline-themes'
		Plugin 'Yggdroot/indentLine' " 缩进提示线插件

		" 在VIM的编辑窗口树状显示文件目录
		Plugin 'scrooloose/nerdtree'
	"}}}

	" 编辑增强 {{{
		" Use the repeat command (.) with supported plugins
		Plugin 'dhruvasagar/vim-table-mode'  " 这个是画表格的
		Plugin 'repeat.vim'
		Plugin 'increment.vim'
		Plugin 'visualrepeat.vim'
		Plugin 'scrooloose/nerdcommenter'
		" Commentary: 快速注释。
		Plugin 'tpope/vim-commentary'
		Plugin 'ShowTrailingWhitespace' " 代码行尾部的空格高亮显示 http://www.vim.org/scripts/script.php?script_id=3966
		nnoremap <silent> <Leader>t$ :<C-u>call ShowTrailingWhitespace#Toggle(0)<Bar>echo (ShowTrailingWhitespace#IsSet() ? 'Show trailing whitespace' : 'Not showing trailing whitespace')<CR>

		"strip all trailing whitespace in the current file
		nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

		" Plugin 'vim-scripts/matchit.zip'
                " match-up is a drop-in replacement for the vim plugin matchit.vim
                Plugin 'andymass/vim-matchup'
		Plugin 'vim-scripts/matchit.zip'
		Plugin 'jiangmiao/auto-pairs'
		Plugin 'Valloric/MatchTagAlways' "让vim像Notepad++一样智能高亮匹配HTML标签
		Plugin 'ShowPairs'
		" 在两端加上、修改、删除匹配的符号如（）
		Plugin 'tpope/vim-surround'

		" Plugin 'mark'
		" 相对于 mark.vim、MultipleSearch，作者更推荐这个。http://www.vim.org/scripts/script.php?script_id=2666
		Plugin 'dimasg/vim-mark' " my clone for http://www.vim.org/scripts/script.php?script_id=2666
		" Plugin 'MultipleSearch'

		Plugin 'bsdelf/bufferhint'
		Plugin 'sjl/gundo.vim'
                Plugin 'YankRing.vim'
		" Plugin 'maxbrunsfeld/vim-yankstack'
		" Plugin 'svermeulen/vim-easyclip'


		Plugin 'Konfekt/FastFold'
		" Plugin 'taglist-plus'
		Plugin 'majutsushi/tagbar'
	"}}}

	" 自动补全 {{{
		"""""""""""""""自动补全 """"""""""""""
		Plugin 'jistr/vim-nerdtree-tabs'
		if has('lua')
			Plugin 'Shougo/neocomplete.vim'
			Plugin 'Shougo/neosnippet.vim'
			Plugin 'Shougo/neosnippet-snippets'
		endif

		Plugin 'ervandew/supertab'
		" Plugin 'Valloric/YouCompleteMe'
		"""""""""""""""自动补全 """"""""""""""

		Plugin 'SirVer/ultisnips'
		Plugin 'honza/vim-snippets'

		" 感觉 SearchComplete 还是很好用的。
		" 我觉得，可能是completeopt搞得，因为这两个插件开发的时间可能比较久。
		" Plugin 'SearchComplete'
		" Plugin 'CmdlineComplete' " This script is functional similar with (but far more better than) SearchComplete vimscript #474 (version 1.1).

		Plugin 'sherlock.vim'
	"}}}
	" 模糊搜索 {{{
		" 这个可能是比较老的模糊搜索了
		" Plugin 'FuzzyFinder'
		Plugin 'junegunn/fzf.vim'
		" If installed using Homebrew
		set rtp+=/usr/local/opt/fzf
	" }}}

	" utils {{{
		Plugin 'mattn/webapi-vim'
		Plugin 'drmikehenry/vim-fontsize'

		Plugin 'utl.vim'
		" 感觉有了fileencodings，FencView也没太大用了。
		" Plugin 'mbbill/fencview'
		" 感觉，还是fencview 加上 fileencodings 好用。
		" Plugin 's3rvac/AutoFenc'

		Plugin 'mhinz/vim-startify'
		Plugin 'skywind3000/asyncrun.vim'
		Plugin 'skywind3000/vimmake'

		Plugin 'luochen1990/rainbow'

		Plugin 'luochen1990/select-and-search'
		Plugin 'terryma/vim-expand-region'


		Plugin 'mileszs/ack.vim'
		Plugin 'EasyGrep'
		Plugin 'dyng/ctrlsf.vim'

		Plugin 'terryma/vim-multiple-cursors'


		" Plugin 'VOoM'
		Plugin 'VimIM'
		Plugin 'LargeFile'

		Plugin 'Valloric/ListToggle'
		Plugin 't9md/vim-quickhl'

		" Plugin 'vcscommand.vim'
		Plugin 'SudoEdit.vim'

		" sparkup vim脚本在名为vim的该软件库子目录下。
		" 传递路径，合理设置运行时路径。
		Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

		Plugin 'Shougo/denite.nvim'
		" Plugin 'kien/ctrlp.vim'

		"..................................
		" non github repos
		" Plugin 'git://git.wincent.com/command-t.git'
		"......................................
	"}}}


	" syntax {{{
		"语法检查 {{{
			Plugin 'scrooloose/syntastic'
			Plugin 'w0rp/ale'

		"}}}
		Plugin 'pangloss/vim-javascript' "JavaScript语法高亮、缩进
		Plugin 'godlygeek/tabular' " 这里作者提到如用vundle管理插件，那么godlygeek/tabular这个插件必须在plasticboy/vim-markdown之前
        Plugin 'junegunn/vim-easy-align'               " 都说这个比 Tabularize 好用。
		" coffee-scrpit support
		" Plugin 'kchmck/vim-coffee-script'

        " 應該是目前最新、最全的PHP語法高亮插件了，它解決了舊版本無法高亮 @throws 的問題。
        Plugin 'StanAngeloff/php.vim'
		function! PhpSyntaxOverride()
			hi! def link phpDocTags  phpDefine
			hi! def link phpDocParam phpType
		endfunction

		augroup phpSyntaxOverride
			autocmd!
			autocmd FileType php call PhpSyntaxOverride()
		augroup END
	"}}}

	"color scheme {{{
		Plugin 'peaksea'
		Plugin 'desert256.vim'
		Plugin 'vim-scripts/tir_black'
		Plugin 'vim-scripts/af.vim'
		Plugin 'vim-scripts/enzyme.vim'
		Plugin 'vim-scripts/tango.vim'
		Plugin 'vim-scripts/BusyBee'
		Plugin 'nanotech/jellybeans.vim'
		Plugin 'w0ng/vim-hybrid'
		Plugin 'twerth/ir_black'
		Plugin 'tomasr/molokai'
		Plugin 'sjl/badwolf'
		Plugin 'Lokaltog/vim-distinguished'
		Plugin 'rainux/vim-desert-warm-256'
		" Solarized: 非常流行的配色。
		Plugin 'altercation/vim-colors-solarized'
		Plugin 'NLKNguyen/papercolor-theme'
		Plugin 'morhetz/gruvbox'
		Plugin 'therubymug/vim-pyte'
		Plugin 'reedes/vim-colors-pencil'
		Plugin 'simpleandfriendly.vim'
		Plugin 'ironman.vim'
	"}}}
	"Markdown {{{
		" vim 8.0 自带了 Markdown 的语法插件。如果加载这个，会非常慢。自带的语法插件会自动替换conceal。
		" 而conceal 是 Plugin 'Yggdroot/indentLine' 里设置的，所以，把这个插件
		" 也干掉。或者let g:indentLine_conceallevel = 2
		" 设置了conceal 的话，加粗两边的 ** 不显示，编辑非常不变。
		Plugin 'plasticboy/vim-markdown' " 语法高亮及识别
		let g:vim_markdown_frontmatter=1
		" let g:vim_markdown_folding_disabled = 1
		let g:vim_markdown_conceal = 0
		" au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd

		" Plugin 'jtratner/vim-flavored-markdown' "
		" augroup markdown
		"     au!
		"     au BufNewFile,BufRead *.mkd,*.md,*.markdown setlocal filetype=ghmarkdown
		" augroup END
		" Plugin 'suan/vim-instant-markdown'
		" Plugin 'iamcco/markdown-preview.vim'
		" Plugin 'gabrielelana/vim-markdown'
		" let g:markdown_enable_spell_checking = 0
		Plugin 'shime/vim-livedown'
		nmap gm :LivedownToggle<CR>

		" Plugin 'Markdown'
		" Plugin 'Markdown-syntax' " 这个就是plasticboy的


	"
	"}}}

	"每个插件都应该在这一行之前

	call vundle#end()            "required

"}}}

"Basic settings{{{
    " from: https://github.com/spf13/spf13-vim/blob/3.0/.vimrc
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }
    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        " if WINDOWS()
        "   set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        " endif
    " }
    " Arrow Key Fix {
        " https://github.com/spf13/spf13-vim/issues/780
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }
" Use before config if available {
    " if filereadable(expand("~/.vimrc.before"))
    "     source ~/.vimrc.before
    " endif
" }

" Use bundles config {
    " if filereadable(expand("~/.vimrc.bundles"))
    "     source ~/.vimrc.bundles
    " endif
" }
	"视觉辅助 {{{
		set number
		if has('syntax')
			syntax enable
		endif
		syntax on
		set nospell
        " 去掉beep，听歌的时候很烦
        " set noeb vb t_vb=
        " au GUIEnter * set vb t_vb=

        set noerrorbells visualbell t_vb=
        if has('autocmd')
            autocmd GUIEnter * set visualbell t_vb=
        endif

		" 用浅色高亮当前行
		" set textwidth=80
		" let &colorcolumn=join(range(81,999),",")
		" let &colorcolumn="80,".join(range(120,999),",")
		" set colorcolumn=+1
        " http://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
		set tabstop=4 " Tab键的宽度  "PSR-2 代码风格规范  代码必须使用4个空格符而不是 tab键 进行缩进
		set softtabstop=0
		set shiftwidth=0
		set smarttab
		" set noexpandtab " 不要用空格代替制表符
		set expandtab " 用空格代替制表符
		"  统一缩进为4
		set smartindent " 智能对齐
		set autoindent " 自动对齐
		" set cindent
        " javascript 设置为2
        autocmd FileType javascript set tabstop=2

		" set linebreak

		"将tab替换为空格
        nmap <leader>ts :%s/\t/    /<CR>

		" set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
		" set matchtime=2 " 短暂跳转到匹配括号的时间
		set showmatch " 高亮显示对应的括号
		set matchtime=5 " 对应括号高亮的时间（单位是十分之一秒）

		set completeopt=menuone,menu,preview,longest
		" set completeopt=longest,menu
		" set completeopt=preview,menu "代码补全

		" CursorLine, CursorColumn
		" autocmd InsertLeave * se nocul
		" autocmd InsertEnter * se cul

		" turn off searching include files during autocomplete
		" set complete-=i

		au WinLeave * set cursorline nocursorcolumn
		au WinEnter * set cursorline cursorcolumn

		if has("gui_macvim")
			set cursorline " 突出显示当前行
			set cursorcolumn
		endif

		highlight CursorLine term=reverse
		highlight CursorColumn term=reverse

	"}}}

	"Mac 下MacVim中文输入 {{{
		"别忘了在 MacVim 的偏好设置界面里面（按 ⌘+, ），把 Draw marked text inline
		"这个选项去掉，否则的话在里面用输入法会有问题。>>
		set noimdisable
		autocmd! InsertLeave * set imdisable|set iminsert=0
		autocmd! InsertEnter * set noimdisable|set iminsert=0
	"}}}

	"搜索相关 {{{
		set magic " 设置魔术
		set ignorecase
		" set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
		set gdefault " When on, the ":substitute" flag 'g' is default on.
		set hlsearch
		" set nowrapscan " 禁止在搜索到文件两端时重新搜索
		set incsearch " 输入搜索内容时就显示搜索结果
		" set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割

	"}}}


	"折叠 {{{
		set foldenable " 开始折叠
		set foldmethod=syntax " 设置语法折叠
		set foldcolumn=0 " 设置折叠区域的宽度
		set nofoldenable                  " Auto fold code
		" set foldlevel=1
		setlocal foldlevel=1 " 设置折叠层数为
		set foldlevelstart=99

		" set foldclose=all " 设置为自动关闭折叠
		" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
		" 用空格键来开关折叠
	"}}}

	"文件相关{{{
		set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
		set confirm " 在处理未保存或只读文件的时候，弹出确认
		set backupcopy=yes " 设置备份时的行为为覆盖
		"禁止生成临时文件
		set nobackup " 覆盖文件时不备份
		set noswapfile
		set history=1000 " 历史纪录数
	"}}}


	"Vim 本身的一些设置{{{
		set noerrorbells " 关闭错误信息响铃
		set novisualbell " 关闭使用可视响铃代替呼叫
		set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示

		set selection=inclusive
		set mousemodel=popup

		set viminfo+=!  " 保存全局变量

		set cmdheight=2 " 命令行（在状态行）的高度，默认为1,这里是2
		set ruler " 在编辑过程中，在右下角显示光标位置的状态行
		set laststatus=2 " 总是显示状态行
		set showtabline=2 " always show tabline


		set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
		" set virtualedit=onemore " used with caution of breaking plugins

		set showcmd " 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来
		set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离

		set autowrite " 在切换buffer时自动保存当前文件
		set autowriteall "Auto-write all file changes
		set autoread " 设置当文件被改动时自动载入

		set t_Co=256
		set nomodeline                  " disable mode lines (security measure)


		" no annoying sound on errors
		set timeoutlen=500
		set formatoptions+=t
		if v:version > 703 || v:version == 703 && has("patch541")
			set formatoptions+=j " Delete comment chars when join comment lines
		endif
		" set formatoptions-=l " wrap long lines
		set wrapmargin=2 " 2 chars wrap margin from the right window border, hard wrap
		set conceallevel=0
		" set list

		set guioptions=e "only show guitablabel
		"set guioptions=



        " 因为 Yankring 的配置改了，所以，下面的不需要了
		" have x (removes single character) not go into the default registry
		" nnoremap x "_x
		" Make X an operator that removes without placing text in the default registry
		" nmap X "_d
		" nmap XX "_dd
		" vmap X "_d
		" vmap x "_d

		" when changing text, don't put the replaced text into the default registry
		nnoremap c "_c
		vnoremap c "_c
		" 0 is the 'yank register', and the ] formats it to indent you're pasting into. This command does all that with control + p (from http://vimcasts.org/episodes/meet-the-yank-register/)
		"nmap <c-p> "0]P

		" use leader to interact with the system clipboard {{{
			nnoremap <Leader>p "*]p
			nnoremap <Leader>P "*]P

			nnoremap <Leader>y :y*<cr>
			" nnoremap <Leader>y ma^"*y$`a
			nnoremap <Leader>c ^"*c$
			nnoremap <Leader>d ^"*d$

			vnoremap <Leader>y "*y
			vnoremap <Leader>c "*c
			vnoremap <Leader>d "*d

			noremap gV `[v`] " 快速选择粘贴的文本

		" }}}

		" place whole file on the system clipboard (and return cursor to where it was)
		" nmap <Leader>a maggVG"*y`a
		nnoremap <Leader>a :%y*<cr>


		" Make a simple "search" text object.
		vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR> :<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
		omap s :normal vs<CR>


		"共享剪贴板
		if has('clipboard')
			" if has('unnamedplus')  " When possible use + register for copy-paste
				" set clipboard=unnamed,unnamedplus
			" else         " On mac and Windows, use * register for copy-paste
				" set clipboard=unnamed
			" endif
		endif

		" Make the dot command work as expected in visual mode (via
		" https://www.reddit.com/r/vim/comments/3y2mgt/do_you_have_any_minor_customizationsmappings_that/cya0x04)
		vnoremap . :norm.<CR>


		set linespace=2 " 字符间插入的像素行数目
		" set linespace=0             " No extra spaces between rows

		" set whichwrap=b,s,<,>,[,]
		" 开启Normal或Visual模式下Backspace键，空格键，左方向键，右方向键，Insert或replace模式下左方向键，右方向键跳行的功能。

		" 允许backspace和光标键跨越行边界
		" set whichwrap+=<,>,h,l
		set whichwrap=b,s,h,l,<,>,>h,[,]   " Backspace and cursor keys wrap too

		set display+=lastline
		" set nowrap      " Do not wrap long lines == 中文的话，很长一段话，可能只有一行，所以，还是需要wrap的。

		" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
		set mouse=a
		" allow mouse select and etc operation
		" set mouse=a

		set selectmode=mouse,key
		" 通过使用: commands命令，告诉我们文件的哪一行被改变过
		set report=0

		" 在被分割的窗口间显示空白，便于阅读
		set fillchars=vert:\ ,stl:\ ,stlnc:\


		set backspace=2  " more powerful backspacing
		" set backspace这一命令有两种写法：后面接数字或其他属性，
		" set backspace=0     等同于 set backspace= (Vi 兼容)
		" set backspace=1     等同于 set backspace=indent,eol
		" set backspace=2     等同于 set backspace=indent,eol,start

		set lazyredraw      " don't update the display while executing macros
		" set copyindent
		" set wildmode=list:longest,full
		set wildmode=longest,list,full
		set wildmenu " 增强模式中的命令行自动完成操作
		if !&scrolloff
			set scrolloff=1           " Minimum lines to keep above and below cursor
		endif
		if !&sidescrolloff
			set scrolloff=5
		endif

		set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
		set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows
		set wildignore+=*.o,*~,*.pyc,*.swp,*.bak,*.class
		if has("win16") || has("win32")
			set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
		else
			set wildignore+=.git\*,.hg\*,.svn\*
		endif

		filetype plugin indent on
		" 分为三部分命令：file on, file plugin on, file indent on.分别表示自动识别文件类型，用文件类型脚本，使用缩进定义文件。
		" filetype plugin on

	"}}}

	"设置颜色主题{{{

		" colorscheme torte
		set background=dark
		" set background=light
		" colorscheme solarized

		" set background=light
		colorscheme PaperColor
		" colorscheme pyte
		" set background=dark
		" colorscheme gruvbox

	"}}}

	"配置多语言环境{{{
		if has("multi_byte")
			" UTF-8 编码
			" set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
			" set fencs=utf-8,gbk
			set fileencodings=utf-8,gb2312,ucs-bom,euc-cn,euc-tw,gb18030,gbk,cp936,big5,euc-jp,euc-kr,latin1
			" set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1 "编码设置

			set fileformats=unix,dos,mac

			set encoding=utf-8
			set termencoding=utf-8
			set formatoptions+=mM

			" if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
			"     set ambiwidth=double
			" endif
			if exists("&ambiwidth")
				    set ambiwidth=double
			endif



			if has("win32")
				source $VIMRUNTIME/delmenu.vim
				source $VIMRUNTIME/menu.vim
				set termencoding=cp936
				"解决consle输出乱码
				language messages zh_CN.utf-8
			endif
			set nobomb
			" set nobomb 是让vim不要自动设置字节序标记，因为并不是所有编辑器都可以识别字节序标记的。
		else
			echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
		endif
	"}}}

	if has("gui_macvim")
		" autocmd GUIEnter * set fullscreen
		set fuoptions=maxvert,maxhorz
	endif

	if has('win32')
		" set guioptions-=T " 隐藏工具栏
		" set guioptions-=m " 隐藏菜单栏
		"默认最大化窗口打开
		au GUIEnter * simalt ~x
	endif


	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" CTags的设定
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	let Tlist_Sort_Type = "name"    " 按照名称排序
	let Tlist_Use_Right_Window = 1  " 在右侧显示窗口
	let Tlist_Compart_Format = 1    " 压缩方式
	let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer
	""let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags
	""let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树
	"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
	"设置tags
	set tags=tags;
	set autochdir


	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	""实用设置
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"}}}

" 其他配置
"{Mappings
	" 把leader map 成 ","
	let mapleader=","
	let g:mapleader=","

	nnoremap <leader>ma :set mouse=a<cr>
	nnoremap <leader>mu :set mouse=<cr>

	" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
	" map <space> /
	" map <c-space> ?


	" nnoremap <Leader>2 :set tabstop=2  softtabstop=2 shiftwidth=2<CR>
	" nnoremap <Leader>4 :set tabstop=4  softtabstop=4 shiftwidth=4<CR>
	nnoremap <Leader>eg :e ++enc=gbk<CR>
	nnoremap <Leader>eu :e ++enc=utf8<CR>
	" nnoremap <Leader>h :nohlsearch<CR>
	" Use <C-L> to clear the highlighting of :set hlsearch
	if maparg('<C-L>', 'n') ==# ''
		nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
	endif
	" nnoremap <leader>l :set list!<CR>
	nnoremap <leader>w :set wrap!<CR>
	nnoremap <leader>f :%!js-beautify -j -q -B -f -<CR>
	nnoremap <c-s> :w<CR>
	nnoremap <C-S-k> :w<CR>
	inoremap <c-s> <esc>:w<CR>a
	vnoremap <c-s> <Esc>:w<CR> " visual mode: escape to normal and save
	" Faster mapping for saving - thanks Paradigm
	nnoremap <space>w :w<cr>
	" autofill magic - make a M-q for Vim
	nmap <space><space> gwip

	" Use ii for exit
	map ii <Esc>
	imap ii <Esc>
	cmap ii <ESC>
	nmap ss :w<CR>
	" cmap w!! w !sudo tee >/dev/null %
	" nmap SS :w !sudo tee % >/dev/null<CR>
	nmap qq :wq<CR>
	nmap QQ :wqall<CR>
	nmap cc :q!<CR>

	" Insert new lines
	" nmap <S-Enter> O<Esc>j
	" nmap <C-Enter> o<Esc>k
	" nmap <CR> o<Esc>k
	" nnoremap <C-J> a<CR><Esc>k$
	" nmap <F8> o<Esc>
	" nmap <F9> O<Esc>
	" nmap <CR><CR> o<ESC>
	nmap oo o<Esc>k
	nmap OO O<Esc>j

	nnoremap <leader>dd :1,$d<CR>:w<CR>
	nnoremap <leader>uu u<esc>:w<CR>

	"noremap <Leader>W :w !sudo tee % > /dev/null
	" Quickly edit/reload the vimrc file
	nnoremap <leader>ev :tabe $MYVIMRC<CR>
	nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
	nnoremap <space> za
	vnoremap <space> zf
	" tab switch key mappings
		" http://vim.wikia.com/wiki/Alternative_tab_navigation
		"nnoremap <A-1> 1gt
		"nnoremap <A-2> 2gt
		"nnoremap <A-3> 3gt
		"nnoremap <A-4> 4gt
		"nnoremap <A-5> 5gt
		"nnoremap <A-6> 6gt
		"nnoremap <A-7> 7gt
		"nnoremap <A-8> 8gt
		"nnoremap <A-9> 9gt
		"nnoremap <A-0> 10gt
	" map for xxd editing
	nnoremap <Leader>xd :%!xxd<CR>
	nnoremap <Leader>xr :%!xxd -r<CR>


	"Simplify help navigation
		"http://vim.wikia.com/wiki/Learn_to_use_help
		"Press Enter to jump to the subject (topic) under the cursor.
		"Press Backspace to return from the last jump.
		"Press s to find the next subject, or S to find the previous subject.
		"Press o to find the next option, or O to find the previous option.
		"nnoremap <buffer> <CR> <C-]>
		"nnoremap <buffer> <BS> <C-T>
		"nnoremap <buffer> o /'\l\{2,\}'<CR>
		"nnoremap <buffer> O ?'\l\{2,\}'<CR>
		"nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
		"nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
	"==================自定义的键映射======================

	" 括号自动生成
	vnoremap $1 <esc>`>a)<esc>`<i(<esc>
	vnoremap $2 <esc>`>a]<esc>`<i[<esc>
	vnoremap $3 <esc>`>a}<esc>`<i{<esc>
	vnoremap $$ <esc>`>a"<esc>`<i"<esc>
	vnoremap $q <esc>`>a'<esc>`<i'<esc>
	vnoremap $e <esc>`>a"<esc>`<i"<esc>


	" 单键<F7>控制syntax on/off。原因是有时候颜色太多会妨碍阅读。
	map <F7> :if exists("syntax_on") <BAR>
	\    syntax off <BAR><CR>
	\  else <BAR>
	\syntax enable <BAR>
	\  endif
	\<CR>


	"C，C++ 按F5编译运行
	map <F15> :call CompileRunGcc()<CR>
	func! CompileRunGcc()
		exec "w"
		if &filetype == 'c'
			exec "!g++ % -o %<"
			exec "!time ./%<"
		elseif &filetype == 'cpp'
			exec "!g++ % -o %<"
			exec "!time ./%<"
		elseif &filetype == 'java'
			exec "!javac %"
			exec "!time java %<"
		elseif &filetype == 'sh'
			:!time bash %
		elseif &filetype == 'python'
			exec "!time python2.7 %"
		elseif &filetype == 'html'
			exec "!firefox % &"
		elseif &filetype == 'go'
	"        exec "!go build %<"
			exec "!time go run %"
		elseif &filetype == 'mkd'
			exec "!~/.vim/markdown.pl % > %.html &"
			exec "!firefox %.html &"
		endif
	endfunc
	"C,C++的调试
	" map <F8> :call Rungdb()<CR>
	func! Rungdb()
		exec "w"
		exec "!g++ % -g -o %<"
		exec "!gdb ./%<"
	endfunc


	" Don't write backup file if vim is being called by "crontab -e"
	" au BufWrite /private/tmp/crontab.* set nowritebackup
	" Don't write backup file if vim is being called by "chpass"
	" au BufWrite /private/etc/pw.* set nowritebackup

	" Buffers操作快捷方式!
	nnoremap <C-RETURN> :bnext<CR>
	nnoremap <C-S-RETURN> :bprevious<CR>

	"设置切换Buffer快捷键"
	nnoremap <C-N> :bn<CR>
	nnoremap <C-P> :bp<CR>


	" MacVim settings
	if has('gui_running')
		" bind command-j and command-k to move between buffers.
		" and command-K and command-J to move between tabs.
		nmap <D-j> :bp <enter>
		nmap <D-k> :bn <enter>
		nmap <D-K> :tabnext <enter>
		nmap <D-J> :tabprevious <enter>
	else
		" nmap <C-j> :bp <enter>
		" nmap <C-k> :bn <enter>
	endif


	" Tab操作快捷方式!
	nnoremap <C-TAB> :tabnext<CR>
	nnoremap <C-S-TAB> :tabprev<CR>
	"nnoremap    <C-Tab>    :tabnext<CR>
	"imap   <C-Tab>    <C-O>:tabnext<CR>
	"map    <C-S-Tab>  :tabprev<CR>
	"imap   <C-S-Tab>  <C-O>:tabprev<CR>

	"在iterm2或者term下，<C-Tab> 和 <C-S-Tab> 被映射成term本身的tab切换了，所
	"以需要这种模式的tab切换。同时 <C-S> :w<CR> 不起作用，也是因为被term本身映射了。
	"关于tab的快捷键
	" Tab management
	nmap tt :tabnew .<CR>
	nmap tk :tabnext<CR>
	nmap tj :tabprevious<CR>

	map tn :tabnext<cr>
	map tp :tabprevious<cr>
	" map td :tabnew .<cr>
	map te :tabedit
	map tc :tabclose<cr>
	" map <c+w> :tabclose <cr>
	map <leader>tc :tabclose<cr>
	map <leader>tn :tabnew <cr>
	map <leader>te :tabedit<cr>
	" map <leader>tm :tabmove
	nnoremap <leader>v :vnew<cr>
	nnoremap <leader>to :tabonly<cr>
	nnoremap <leader>x :q<cr>
	" nnoremap <leader>t :tabe<cr>
	nnoremap <leader>tx :tabclose<cr>
    " bq 用的顺手一点
	nnoremap <leader>bq :bn!<cr>


	"Moving fast to front, back and 2 sides ;)
	imap <m-$> <esc>$a
	imap <m-0> <esc>0i
	imap <D-$> <esc>$a
	imap <D-0> <esc>0i


	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => General Autocommands
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	"Switch to current dir
	map <leader>cd :cd %:p:h<cr>

	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" => General Abbrevs
	"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	"My information
	iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
	iab xname Zhang Chunfei
	nnoremap <leader>tm :echo strftime('%c')<cr>

	"Move a line of text using control
	nmap <M-j> mz:m+<cr>`z
	nmap <M-k> mz:m-2<cr>`z
	vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
	vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z



	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	"键盘命令
	""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	" :nmap <silent> <F9> <ESC>:Tlist<RETURN>
	" :nmap <silent> <F9> <ESC>:Tagbar<RETURN>
	" shift tab pages
	map <S-Left> :tabp<CR>
	map <S-Right> :tabn<CR>
	map! <C-Z> <Esc>zzi
	map! <C-O> <C-Y>,
	map <C-A> ggVG$"+y
	map <F12> gg=G
	map <C-w> <C-w>w
	imap <C-k> <C-y>,
	imap <C-t> <C-q><TAB>
	" imap <C-j> <ESC>
	" 选中状态下 Ctrl+c 复制
	"map <C-v> "*pa
	imap <C-v> <Esc>"*pa
	imap <C-a> <Esc>^
	imap <C-e> <Esc>$
	" nmap <C-a> ^
	" nmap <C-e> $


	"Super paste
	" 实际上，也就是在insert mode 下才会有这样的问题。
	" 在normal mode下，"+p 一点问题没有
	" 这已经是 <C-R>+ 了
	inoremap <C-R>+  <esc>:set paste<cr>mua<C-R>+<esc>mv'uV'v=:set nopaste<cr>
	" 这个map不行，说明，这个map 里的key 是original 的key，不是map过之后的key
	" inoremap <C-v> <C-R>+
	inoremap <C-v> <esc>:set paste<cr>mua<C-R>+<esc>mv'uV'v=:set nopaste<cr>

	" :set clipboard=unnamed or :set clipboard=unnamedplus to make all yanking/deleting operations automatically copy to the system clipboard.
	" This could be an inconvenience in some cases where you are storing something else in the clipboard as it will override it.
	" set clipboard=unnamedplus


	" 选中状态下 Ctrl+c 复制
	vmap <C-c> "+y


	"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
	"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
	"时候会变得非常方便.
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

	"Bash like
	cnoremap <C-A>    <Home>
	cnoremap <C-E>    <End>
	cnoremap <C-K>    <C-U>
	cnoremap <C-B> <Left>
	cnoremap <C-F> <Right>

	"Smart mappings on the command line
	cno $h e ~/
	cno $d e ~/Desktop/
	cno $j e ./

	cno $q <C-\>eDeleteTillSlash()<cr>

	cno $c e <C-\>eCurrentFileDir("e")<cr>

	cno $tc <C-\>eCurrentFileDir("tabnew")<cr>
	cno $th tabnew ~/
	cno $td tabnew ~/Desktop/

	map <C-j> gj
	map <C-h> h
	map <C-k> gk
	map <C-l> l
	" Treat long lines as break lines (useful when moving around in them)
	map j gj
	map k gk

	" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
	" where possible):
	nnoremap <F6> <C-W>w
	nnoremap <S-F6> <C-W>W

	" use <Ctrl>+N/<Ctrl>+P to cycle through files:
	" nnoremap <C-N> :next<CR>
	" nnoremap <C-P> :prev<CR>
	" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

	" have the usual indentation keystrokes still work in visual mode:
	vnoremap <C-T> >
	vnoremap <C-D> <LT>
	vmap <S-Tab> <C-D>

	" have Y behave analogously to D and C rather than to dd and cc (which is
	" already done by yy):
	noremap Y y$
	nmap da d^
	nmap de d$


	"Favorite filetypes
	"set ffs=unix,dos,mac

	nmap <leader>fd :se ff=dos<cr>
	nmap <leader>fu :se ff=unix<cr>
	nmap <leader>fv :se ft=vim<cr>


	"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
    nnoremap <leader>1 :set filetype=html<CR>
    nnoremap <leader>2 :set filetype=javascript<CR>
    nnoremap <leader>3 :set filetype=php<CR>
    nnoremap <leader>4 :set filetype=css<CR>
    nnoremap <leader>5 :set filetype=sql<CR>
"}


"{Plugin settings
	" scrooloose/syntastic
		set statusline+=%{SyntasticStatuslineFlag()}
		let g:syntastic_check_on_open=0
		let g:syntastic_always_populate_loc_list=1
		let g:syntastic_auto_loc_list=1
		let g:syntastic_check_on_wq=1
		let g:syntastic_enable_signs=1
		let g:syntastic_aggregate_errors=1
		let g:syntastic_error_symbol="E"
		let g:syntastic_warning_symbol="W"
		highlight SyntasticError guibg=#2F0000
		" nnoremap <leader>n :lnext<CR>
		" nnoremap <leader>p :lprevious<CR>
		"prerequisite:
		"  npm packages:
		"    eslint jsxhint babel-eslint eslint-plugin-react json-lint jshint
		"let g:syntastic_javascript_checkers = ['eslint',
		"    \'jsxhint', 'babel-eslint', 'eslint-plugin-react', 'json-lint',
		"    \'jshint', 'jscs']
		let g:syntastic_json_checkers=['jsonlint']
		let g:syntastic_javascript_checkers = ['eslint']
		"let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
		let g:syntastic_python_checkers = ['pylint']
		"let g:syntastic_python_python_exec="/usr/local/bin/python3"
		let g:syntastic_sass_checkers = ['sass', 'sassc']
		"let g:syntastic_scss_checkers = ['sass', 'sassc', 'scsslint']
		let g:syntastic_php_checkers = ['php']
		"let g:syntastic_ruby_checkers = ['robocop']
		"let g:syntastic_coffee_checkes = ['coffeelint']
		let g:syntastic_shell_checkers = ['shellcheck']
		" Set up the arrays to ignore for later
		if !exists('g:syntastic_html_tidy_ignore_errors')
			let g:syntastic_html_tidy_ignore_errors = []
		endif
		if !exists('g:syntastic_html_tidy_blocklevel_tags')
			let g:syntastic_html_tidy_blocklevel_tags = []
		endif
		" Try to use HTML5 Tidy for better checking?
		let g:syntastic_html_tidy_exec = '/usr/local/bin/tidy5'
		" AP: honestly can't remember if this helps or not
		" installed with homebrew locally

		" Ignore ionic tags in HTML syntax checking
		" See http://stackoverflow.com/questions/30366621
		" ignore errors about Ionic tags
		let g:syntastic_html_tidy_ignore_errors += [
			  \ "<ion-",
			  \ "discarding unexpected </ion-"]
		" Angular's attributes confuse HTML Tidy
		let g:syntastic_html_tidy_ignore_errors += [
			  \ " proprietary attribute \"ng-"]
		" Angular UI-Router attributes confuse HTML Tidy
		let g:syntastic_html_tidy_ignore_errors += [
			  \ " proprietary attribute \"ui-sref"]
		" Angular in particular often makes 'empty' blocks, so ignore
		" this error. We might improve how we do this though.
		" See also https://github.com/scrooloose/syntastic/wiki/HTML:---tidy
		" specifically g:syntastic_html_tidy_empty_tags
		let g:syntastic_html_tidy_ignore_errors += ["trimming empty "]
		" Angular ignores
		let g:syntastic_html_tidy_blocklevel_tags += [
			  \ 'ng-include',
			  \ 'ng-form'
			  \ ]
		" Angular UI-router ignores
		let g:syntastic_html_tidy_ignore_errors += [
			  \ " proprietary attribute \"ui-sref"]

	" scrooloose/syntastic  done ============
	" 使用ack.vim 来调用 ag
		if executable('ag')
		  let g:ackprg = 'ag --vimgrep'

		  " Use ag over grep
		  " set grepprg=ag\ --nogroup\ --nocolor
		  set grepprg=ag\ -a

		  " https://github.com/rking/ag.vim/issues/124#issuecomment-227038003
		  cnoreabbrev ag Ack
		  cnoreabbrev aG Ack
		  cnoreabbrev Ag Ack
		  cnoreabbrev AG Ack
		endif


	"vim multiple cursors
		" vim-multiple-cursors  https://github.com/terryma/vim-multiple-cursors
		" If you don't like the plugin taking over your favorite key bindings, you can turn off the default with
		let g:multi_cursor_use_default_mapping=0

		" Default mapping
		let g:multi_cursor_next_key='<C-n>'
		let g:multi_cursor_prev_key='<C-p>'
		let g:multi_cursor_skip_key='<C-x>'
		let g:multi_cursor_quit_key='<Esc>'

		" Map start key separately from next key
		let g:multi_cursor_start_key='<F6>'

		"Note that when multicursor mode is started, it selects current word with boundaries, i.e. it behaves like *. If you want to avoid word boundaries in Normal mode (as g* does) but still have old behaviour up your sleeve, you can do the following:

		let g:multi_cursor_start_key='<C-n>'
		let g:multi_cursor_start_word_key='g<C-n>'


	" nerdcommenter 配置
		" Add spaces after comment delimiters by default
		let g:NERDSpaceDelims = 4

		" Use compact syntax for prettified multi-line comments
		let g:NERDCompactSexyComs = 1

		" Align line-wise comment delimiters flush left instead of following code indentation
		let g:NERDDefaultAlign = 'left'

		" Set a language to use its alternate delimiters by default
		let g:NERDAltDelims_java = 1

		" Add your own custom formats or override the defaults
		let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

		" Allow commenting and inverting empty lines (useful when commenting a region)
		let g:NERDCommentEmptyLines = 1

		" Enable trimming of trailing whitespace when uncommenting
		let g:NERDTrimTrailingWhitespace = 1

	" YouCompleteMe 配置
		let g:ycm_error_symbol = '>>'
		let g:ycm_warning_symbol = '>*'
		nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
		nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
		nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
		nmap <F4> :YcmDiags<CR>


	""""""""""" neocomplete 配置 """""""""""""""""""
		"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
		" Disable AutoComplPop.
		let g:acp_enableAtStartup = 0
		" Use neocomplete.
		let g:neocomplete#enable_at_startup = 1
		" Use smartcase.
		let g:neocomplete#enable_smart_case = 1
		" Set minimum syntax keyword length.
		let g:neocomplete#sources#syntax#min_keyword_length = 3
		let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

		" Define dictionary.
		let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
				\ }

		" Define keyword.
		if !exists('g:neocomplete#keyword_patterns')
			let g:neocomplete#keyword_patterns = {}
		endif
		let g:neocomplete#keyword_patterns['default'] = '\h\w*'

		" Plugin key-mappings.
		inoremap <expr><C-g>     neocomplete#undo_completion()
		inoremap <expr><C-l>     neocomplete#complete_common_string()

		" Recommended key-mappings.
		" <CR>: close popup and save indent.
		inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
		function! s:my_cr_function()
		  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
		  " For no inserting <CR> key.
		  "return pumvisible() ? "\<C-y>" : "\<CR>"
		endfunction
		" <TAB>: completion.
		inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
		" <C-h>, <BS>: close popup and delete backword char.
		inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
		inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
		" Close popup by <Space>.
		"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

		" AutoComplPop like behavior.
		"let g:neocomplete#enable_auto_select = 1

		" Shell like behavior(not recommended).
		"set completeopt+=longest
		"let g:neocomplete#enable_auto_select = 1
		"let g:neocomplete#disable_auto_complete = 1
		"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

		" Enable omni completion.
		autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
		" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
		autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
		autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
		autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

		" Enable heavy omni completion.
		if !exists('g:neocomplete#sources#omni#input_patterns')
		  let g:neocomplete#sources#omni#input_patterns = {}
		endif
		"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
		"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
		"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

		" For perlomni.vim setting.
		" https://github.com/c9s/perlomni.vim
		let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

	""""""""""" neocomplete 配置 done """""""""""""""""""
	""""""""""" Neosnippet 配置 """""""""""""""""""
		" Plugin key-mappings.
		imap <C-k>     <Plug>(neosnippet_expand_or_jump)
		smap <C-k>     <Plug>(neosnippet_expand_or_jump)
		xmap <C-k>     <Plug>(neosnippet_expand_target)

		" SuperTab like snippets behavior.
		"imap <expr><TAB>
		" \ pumvisible() ? "\<C-n>" :
		" \ neosnippet#expandable_or_jumpable() ?
		" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
		smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
		\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

		" For conceal markers.
		" if has('conceal')
		"     set conceallevel=2 concealcursor=niv
		" endif


	  " Default snippets files are available in: neosnippet-snippets
	  " Installing default snippets is optional. If choose not to install them, you must deactivate them with g:neosnippet#disable_runtime_snippets.
	  "disables all runtime snippets
	  " let g:neosnippet#disable_runtime_snippets = {
	  "             \ '_' : 1
	  "             \ }

		" But if you enable g:neosnippet#enable_snipmate_compatibility, neosnippet will load snipMate snippets from runtime path automatically.

		" Enable snipMate compatibility feature.
		" let g:neosnippet#enable_snipmate_compatibility = 1

		" Tell Neosnippet about the other snippets
		" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

	""""""""""" Neosnippet 配置 done """""""""""""""""""


	""""""""""" Rainbow 配置 """""""""""""""""""
		let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

		let g:rainbow_conf = {
		\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
		\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
		\   'operators': '_,_',
		\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
		\   'separately': {
		\       '*': {},
		\       'tex': {
		\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
		\       },
		\       'lisp': {
		\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
		\       },
		\       'vim': {
		\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
		\       },
		\       'html': {
		\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
		\       },
		\       'css': 0,
		\   }
		\}

	""""""""""" Rainbow 配置 done """""""""""""""""""

	""""""""""" Select & Search 配置 """""""""""""""""""
		let g:select_and_search_active = 1

		" let g:select_and_search_active = 2 " will not jump when pressing the first n or N
		" let g:select_and_search_active = 3 " will map * instead of n and N

	""""""""""" Select & Search 配置 done """""""""""""""""""

	""""""""""" Buffer Hint  配置 done """""""""""""""""""
		nnoremap - :call bufferhint#Popup()<CR>
		nnoremap \ :call bufferhint#LoadPrevious()<CR>

	""""""""""" Buffer Hint  配置 done """""""""""""""""""


	"""""""""""  NERDTree  配置 """""""""""""""""""
		" How can I open a NERDTree automatically when vim starts up?
		autocmd vimenter * NERDTree
		autocmd VimEnter * wincmd w " 开启NERDTree后进入vim默认光标在文件编辑区


		" How can I open a NERDTree automatically when vim starts up if no files were specified?
		autocmd StdinReadPre * let s:std_in=1
		autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

		" How can I close vim if the only window left open is a NERDTree?
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


		" How can I map a specific key or shortcut to open NERDTree?
		" map <C-n> :NERDTreeToggle<CR> " 这个map 不起作用，不知道为啥
		" 设置NerdTree plugin
		" map <F3> :NERDTreeMirror<CR>
		" nnoremap <silent> <F5> :NERDTree<CR>
		" 按下 F2 调出/隐藏 NERDTree
		" map  :silent! NERDTreeToggle


		map <F10> :NERDTreeToggle<CR>
		nnoremap <leader>ne :NERDTreeFind<CR>
		" nnoremap <leader>nt :NERDTreeToggle<CR>
		let NERDChristmasTree = 1 " 让树更好看,我是没看出来
		let NERDTreeCaseSensitiveSort = 1 " 让文件排列更有序
		let NERDTreeChDirMode = 1 " 改变tree目录的同时改变工程的目录
		let NERDTreeHijackNetrw = 1 " 当输入 [:e filename]不再显示netrw,而是显示nerdtree
		let NERDTreeWinPos="right"
		let g:NERDTreeWinSize=25
		" let NERDTreeBookmarksFile='/Users/admin/.vim/NERDTreeBookmarks'
		" 当打开 NERDTree 窗口时，自动显示 Bookmarks
		let NERDTreeShowBookmarks=1
		let g:NERDTreeShowLineNumbers=1

		" jistr/vim-nerdtree-tabs
        " map <Leader>n <plug>NERDTreeTabsToggle<CR>

		"设置不同文件的不同高亮
		function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
			exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
			exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'.a:extension .'$#'
		endfunction
		call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
		call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
		call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
		call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
		call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow','#151515')
		call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
		call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
		call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
		call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
		call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
		call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
		call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
		call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

		" How can I change default arrows?
		" let g:NERDTreeDirArrowExpandable = '▸'
		" let g:NERDTreeDirArrowCollapsible = '▾'

	""""""""""" NERDTree 配置 done """""""""""""""""""

	""""""""""" emmet  配置 done """""""""""""""""""
		" let g:user_emmet_leader_key = '<F2>' "设置快捷键为F2+, 使用 emmet

		" 如果要限制只对html,css文件使用的话:
        let g:user_emmet_install_global = 0
        autocmd FileType html,css EmmetInstall


		" 对于vim的不同模式,可以在.vimrc有不同配置:
		" let g:user_emmet_mode='n'    "only enable normal mode functions.
        let g:user_emmet_mode='inv'  "enable all functions, which is equal to
		" let g:user_emmet_mode='a'    "enable all function in all mode.

	""""""""""" emmet 配置 done """""""""""""""""""

	""""""""""" fencview.vim 配置  """""""""""""""""""
		" 对于方法2因为每次打开都将执行检测运算,所以效率比较低,使用方法1效率最高的(推荐),
		" 当方法1不能识别时,可以使用:FencAutoDectect自动检测,然后追加encoding到方法1中.
		" let g:fencview_autodetect=1
		" let g:fencview_auto_patterns='*'

		"关闭自动检测
		" let g:fencview_autodetect=0
		" map <F1> :FencView<cr>

	""""""""""" fencview.vim 配置 done """""""""""""""""""

	"indentLine ===========

		let g:indentLine_enabled=1
		let g:indentLine_concealcursor = 'inc'
		" let g:indentLine_conceallevel = 2
		let g:indentLine_conceallevel=0
	" Vim
		" let g:indentLine_color_term = 239

		"GVim
		" let g:indentLine_color_gui = '#A4E57E'

		" none X terminal
		let g:indentLine_color_tty_light = 7 " (default: 4)
		let g:indentLine_color_dark = 1 " (default: 2)
		let g:indentLine_char = '┊'
	"indentLine done ===========
	" vim-json
		au! BufRead,BufNewFile *.json set filetype=json
		augroup json_autocmd
			autocmd!
			autocmd FileType json set autoindent
			autocmd FileType json set formatoptions=tcq2l
			autocmd FileType json set textwidth=78 shiftwidth=2
			autocmd FileType json set softtabstop=2 tabstop=8
			autocmd FileType json set expandtab
			autocmd FileType json set foldmethod=syntax
		augroup END


		let g:vim_json_syntax_conceal = 0
		let g:indentLine_noConcealCursor=""
	" vim-json done =======
	" vim-airline =====
		if !exists('g:airline_symbols')
			let g:airline_symbols = {}
		endif
		let g:airline_theme="papercolor"

		"这个是安装字体后 必须设置此项"
		let g:airline_powerline_fonts = 1
		" MacVim settings
		if has('gui_running')
			if has('win32')
				set guifont=Consolas:h13
			else
				" set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h11
				" set guifont=Source\ Code\ Pro\ for\ Powerline:h16
				set guifont=Meslo\ LG\ S\ for\ Powerline:h16
				" set guifont=Cousine\ for\ Powerline:h16
			endif
		else
			" nmap <C-j> :bp <enter>
			" nmap <C-k> :bn <enter>
		endif


		"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
		"我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
		let g:airline#extensions#tabline#enabled = 1
		let g:airline#extensions#tabline#buffer_nr_show = 1

		let g:airline#extensions#tabline#left_sep = ' '
		let g:airline#extensions#tabline#left_alt_sep = '|'



		" 关闭状态显示空白符号计数,这个对我用处不大"
		let g:airline#extensions#whitespace#enabled = 0
		let g:airline#extensions#whitespace#symbol = '!'
	" vim-airline done =====



	" mhinz/vim-startify =====
		noremap <Leader>s :Startify<CR>
		let g:startify_list_order = [
			  \ ['   Bookmarks'],     'bookmarks',
			  \ ['   MRU'],           'files' ,
			  \ ['   MRU '.getcwd()], 'dir',
			  \ ['   Sessions'],      'sessions',
			  \ ]
		let g:startify_bookmarks = [
			  \ '~/projects/assets/daily.md',
			  \ '~/projects/assets/',
			  \ '~/downloads/',
			  \ '~/projects/node/',
			  \  '~/projects/daily/',
			  \ '~/projects/daily/fe-learning/',
			  \  '~/projects/assets/item-detail/',
			  \ '~/projects/assets/noscripter.github.io/',
			  \ '~/projects/assets/noscripter.github.io/_posts/',
			  \ '~/projects/assets/noscripter.github.io/lab/',
			  \  '~/projects/daily/fe-learning/playground/']
		let g:startify_change_to_dir          = 0
		let g:startify_enable_special         = 0
		let g:startify_files_number           = 8
		let g:startify_session_autoload       = 1
		let g:startify_session_delete_buffers = 1
		let g:startify_session_persistence    = 1
		let g:startify_use_env                = 1

	" startify done =====

	" CtrlP  =====
		if exists(':CtrplP')
		  let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'dir': 'node_modules\|bower_components',
			\ 'file': '\v\.(exe|so|dll)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }
		  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
		  " modify for spf13
		  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
		  " ag is fast enough that CtrlP doesn't need to cache
		  let g:ctrlp_use_caching = 0
		endif

	" CtrlP done =====


	" YouCompleteMe  =====
		let g:ycm_min_num_of_chars_for_completion = 3
		let g:ycm_autoclose_preview_window_after_completion=1
		let g:ycm_complete_in_comments = 1
		"leave '<tab>', '<c-j>' for ultisnips
		let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
		"leave '<s-tab>', '<c-k>' for ultisnips
		let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
		let g:ycm_confirm_extra_conf = 0
		let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
		" http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/
		let g:ycm_key_list_select_completion=[]
		let g:ycm_key_list_previous_completion=[]
		let g:ycm_filetype_blacklist = {
			  \ 'tagbar' : 1,
			  \ 'qf' : 1,
			  \ 'notes' : 1,
			  \ 'markdown' : 1,
			  \ 'unite' : 1,
			  \ 'text' : 1,
			  \ 'vimwiki' : 1,
			  \ 'pandoc' : 1,
			  \ 'infolog' : 1,
			  \ 'mail' : 1
			  \}
		let g:ycm_semantic_triggers =  {
			  \ 'c' : ['->', '.'],
			  \ 'objc' : ['->', '.'],
			  \ 'ocaml' : ['.', '#'],
			  \ 'cpp,objcpp' : ['->', '.', '::'],
			  \ 'perl' : ['->'],
			  \ 'php' : ['->', '::'],
			  \ 'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
			  \ 'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
			  \ 'ruby' : ['.', '::'],
			  \ 'lua' : ['.', ':'],
			  \ 'erlang' : [':'],
			  \}

	" YouCompleteMe done =====

	" maksimr/vim-jsbeautify =====
		" map <c-f> :call JsBeautify()<cr>
		" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
		" autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
		" autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
		" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
		" autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
		" autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
		" autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
		" autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
		" autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
		" autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

	" maksimr/vim-jsbeautify done =====

	" SirVer/ultisnips done =====
		"customize python and keymapping
		"ref:https://gist.github.com/lencioni/dff45cd3d1f0e5e23fe6
		"ref:https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
		let g:UltiSnipsUsePythonVersion     = 2
		let g:UltiSnipsExpandTrigger       = "<c-tab>"
		let g:UltiSnipsListSnippets        = "<c-l>"
		let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
		let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
	" SirVer/ultisnips done =====


	" moll/vim-node  =====
		autocmd User Node
		  \ if &filetype == "javascript" |
		  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
		  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
		  \ endif
	" moll/vim-node done =====

	" pangloss/vim-javascript =====
		let g:javascript_conceal_function   = "ƒ"
		let g:javascript_conceal_null       = "ø"
		let g:javascript_conceal_this       = "@"
		let g:javascript_conceal_return     = "⇚"
		let g:javascript_conceal_undefined  = "¿"
		let g:javascript_conceal_NaN        = "ℕ"
		let g:javascript_conceal_prototype  = "¶"
		let g:javascript_conceal_static     = "•"
		let g:javascript_conceal_super      = "Ω"
	" pangloss/vim-javascript done =====

	" Yggdroot/indentLine done =====

	" Yggdroot/indentLine done =====

	" junegunn/vim-easy-align done =====
        vmap <Leader>a <Plug>(EasyAlign)
        nmap <Leader>a <Plug>(EasyAlign)
	" junegunn/vim-easy-align done =====


	" godlygeek/tabular =====
		" let mapleader=','
		" if exists(":Tabularize")
		"   nmap <Leader>a= :Tabularize /=<CR>
		"   vmap <Leader>a= :Tabularize /=<CR>
		"   nmap <Leader>a: :Tabularize /:\zs<CR>
		"   vmap <Leader>a: :Tabularize /:\zs<CR>
		" endif

    " 上面的mapping不起作用，是因为
    " https://stackoverflow.com/questions/5010162/if-existscommand-fails-on-startup-using-pathogen
    " autocmd VimEnter * if exists(":Tabularize") |
    "       \ exe " nmap <Leader>a= :Tabularize /=<CR>" |
    "       \ exe " vmap <Leader>a= :Tabularize /=<CR>" |
    "       \ exe " nmap <Leader>a: :Tabularize /:\zs<CR>" |
    "       \ exe " vmap <Leader>a: :Tabularize /:\zs<CR>" |
    "       \ endif
    " https://github.com/spf13/spf13-vim/blob/3.0/.vimrc
    " Tabularize {
    "
	if (has('win32') && isdirectory(expand("$HOME/vimfiles/bundle/tabular"))) || (has('linux') && isdirectory(expand("$HOME/.vim/bundle/tabular")))
        " if isdirectory(expand("~/vimfiles/bundle/tabular"))
            nmap <Leader>a& :Tabularize /&<CR>
            vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
            nmap <Leader>a=> :Tabularize /=><CR>
            vmap <Leader>a=> :Tabularize /=><CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            nmap <Leader>a:: :Tabularize /:\zs<CR>
            vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            nmap <Leader>a,, :Tabularize /,\zs<CR>
            vmap <Leader>a,, :Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        endif
    " }

		inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

		function! s:align()
			let p = '^\s*|\s.*\s|\s*$'
			if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
				let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
				let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
				Tabularize/|/l1
				normal! 0
				call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
			endif
		endfunction

	" godlygeek/tabular done=====

	" terryma/vim-expand-region =====
		vmap v <Plug>(expand_region_expand)
		vmap <C-v> <Plug>(expand_region_shrink)
	" terryma/vim-expand-region done=====


	" majutsushi/tagbar =====
		nmap <F9> :TagbarToggle<CR>
		" 启动时自动focus
		let g:tagbar_autofocus = 0
        let g:tagbar_sort = 0
	" majutsushi/tagbar done=====
"}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" omnicppcomplete 可以被ctrlp 或者 unite 代替吗？
" omnicppcomplete
"
filetype plugin indent on
filetype on

" putting these last seems to help solve issues (silly Vim).
" filetype off
" filetype on

let OmniCpp_DefaultNamespaces = ["std"] 	"下面的设置用于当用户预先声明namespace时也能自动补全代码（如使用using std::string）
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

autocmd FileType python set omnifunc=pythoncomplete#Complete

if has("win32") 				" 设置代码提示窗口的颜色（默认为粉红色)
"	highlight Pmenu ctermbg=13 guibg=LightGray
"	highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
	highlight Pmenu ctermbg=7 guibg=DarkBlue guifg=White
"       highlight PmenuSbar ctermbg=7 guibg=DarkGray
"	highlight PmenuThumb guibg=Black
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope
"
if has("cscope")
	set csto=0
	set cst
	set nocsverb
	if filereadable("cscope.out")		" add any database in current directory
	    cs add cscope.out
	elseif $CSCOPE_DB != "" 		" else add database pointed to by environment
	    cs add $CSCOPE_DB
	endif
	set csverb 				" 这个必须放在后面,不然windows上找不到cscope.out
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> :cw<CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> :cw<CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR> :cw<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> :cw<CR>
"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Using 'CTRL-spacebar' then a search type makes the vim window
" split horizontally, with search result displayed in
" the new window.
nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" Hitting CTRL-space *twice* before the search type does a vertical
" split instead of a horizontal one
nmap <C-Space><C-Space>s
	\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>g
	\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>c
	\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>t
	\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>e
	\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space><C-Space>i
	\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-Space><C-Space>d
	\:vert scs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lookupfile 是不是已经可以被 ctrlp 和 unite 代替了？
" lookupfile.vim 插件设置
"
" let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
" let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
" let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
" let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
" let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
" let g:LookupFile_SortMethod = ""                "关闭对搜索结果的字母排序
"if filereadable("/home/ganquan/linux-2.6.34-rc4/filenametags")                "设置tag文件的名字
"let g:LookupFile_TagExpr ='"/home/ganquan/linux-2.6.34-rc4/filenametags"'
"endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lookupfile.vim 插件设置
"
"{helper functions
  " Set tabstop, softtabstop and shiftwidth to the same value
  command! -nargs=* Stab call Stab()
  function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
      let &l:sts = l:tabstop
      let &l:ts = l:tabstop
      let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
  endfunction

  function! SummarizeTabs()
    try
      echohl ModeMsg
      echon 'tabstop='.&l:ts
      echon ' shiftwidth='.&l:sw
      echon ' softtabstop='.&l:sts
      if &l:et
        echon ' expandtab'
      else
        echon ' noexpandtab'
      endif
    finally
      echohl None
    endtry
  endfunction

  function! GuiTabLabel()
    let label = ''
    let bufnrlist = tabpagebuflist(v:lnum)
    " Add '+' if one of the buffers in the tab page is modified
    for bufnr in bufnrlist
      if getbufvar(bufnr, "&modified")
        let label = '+'
        break
      endif
    endfor
    " Append the tab number
    let label .= v:lnum.': '
    " Append the buffer name
    let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
    if name == ''
      " give a name to no-name documents
      if &buftype=='quickfix'
        let name = '[Quickfix List]'
      else
        let name = '[No Name]'
      endif
    else
      " get only the file name
      let name = fnamemodify(name,":t")
    endif
    let label .= name
    " Append the number of windows in the tab page
    let wincount = tabpagewinnr(v:lnum, '$')
    return label . '  [' . wincount . ']'
  endfunction
  function! SetTabLabel()
    set guitablabel=%{GuiTabLabel()}
  endfunction

  " http://vimdoc.sourceforge.net/htmldoc/gui.html
  "echom "May The FORCE be with U!"
  if exists("+showtabline")
    function! MyTabLine()
      let s = ''
      let t = tabpagenr()
      let i = 1
      while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T'
        let s .= (i == t ? '%1*' : '%2*')
        let s .= ' '
        let s .= i . ':'
        let s .= ' %*'
        let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
        let file = bufname(buflist[winnr - 1])
        let file = fnamemodify(file, ':p:t')
        if file == ''
          let file = '[No Name]'
        endif
        let s .= file
        let i = i + 1
      endwhile
      let s .= '%T%#TabLineFill#%='
      let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
      return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
  endif

  "http://vim.wikia.com/wiki/Show_tab_number_in_your_tab_line
  " set up tab tooltips with every buffer name
  function! GuiTabToolTip()
    let tip = ''
    let bufnrlist = tabpagebuflist(v:lnum)
    for bufnr in bufnrlist
      " separate buffer entries
      if tip != ''
        let tip .= " \n "
      endif
      " Add name of buffer
      let name = bufname(bufnr)
      " add modified/modifiable flags
      if getbufvar(bufnr, "&modified")
        let tip .= ' [+]'
      endif
    endfor
    return tip
  endfunction
  set guitabtooltip=%{GuiTabToolTip()}

  " url:http://vimcasts.org/episodes/tidying-whitespace/
  function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
  endfunction
  nnoremap _$ :call Preserve("%s/\\s\\+$//e")<CR>
  nnoremap _= :call Preserve("normal gg=G")<CR>

  "Allow to toggle background
    function!  ToggleBG()
      let s:tbg = &background
      " Inversion
      if s:tbg == 'dark'
        set background=light
      else
        set background=dark
      endif
    endfunction
    noremap <leader>bg :call ToggleBG()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Cwd()
  let cwd = getcwd()
  return "e " . cwd
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc


" Go to last file if invoked without arguments.
autocmd VimEnter * nested if
  \ argc() == 0 &&
  \ bufname("%") == "" &&
  \ bufname("2" + 0) != "" |
  \   exe "normal! `0" |
  \ endif

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Restore cursor to file position in previous editing session
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" autocmd BufReadPost *
  " \ if line("'\"") > 1 && line("'\"") <= line("$") |
  " \   exe "normal! g`\"" |
  " \ endif

" Restore cursor position upon reopening files {{{
" autocmd BufReadPost *
"   \ if &filetype != "gitcommit" && line("'\"") > 0 && line("'\"") <= line("$") |
"   \   exe "normal! g`\"" |
"   \ endif
" }}}

   "  if has("autocmd")
	"       autocmd BufReadPost *
	"           \ if line("'\"") > 0 && line("'\"") <= line("$") |
	"           \   exe "normal g`\"" |
	"           \ endif
	" endif

"Enable folding, I find it very useful
set nofen
set fdl=0

""""""""""""""""""""""""""""""
" => Yank Ring
""""""""""""""""""""""""""""""
map <leader>y :YRShow<cr>
" Some settings to try to get yank ring to not mess with default vim
" functionality so much.
let g:yankring_manage_numbered_reg = 0
let g:yankring_clipboard_monitor = 0
let g:yankring_paste_check_default_buffer = 0

" Don't let yankring use f, t, /. It doesn't record them properly in macros
" and that's my most common use. Yankring also blocks macros of macros (it
" prompts for the macro register), but removing @ doesn't fix that :(
let g:yankring_zap_keys = ''

" Disable yankring for regular p/P. This preserves vim's normal behavior, but
" I can still use C-p/C-n to cycle through yankring.
let g:yankring_paste_n_bkey = ''
let g:yankring_paste_n_akey = ''
let g:yankring_paste_v_key = ''

" Turns out there are undocumented options (I found by typing :echo g:yankring_paste_<Tab>).
let g:yankring_paste_v_bkey = ''
let g:yankring_paste_v_akey = ''



if has("win32")
    " 这句在windows下是管用的
    "Maximize gvim after open
    " autocmd GUIEnter * simalt ~x
endif

map C-Enter C-Tab " Ctrl+Enter also toggles buffer
" have Y behave analogously to D and C rather than to dd and cc (which is already done by yy):
noremap Y y$

" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>
vmap <S-Tab> <C-D>

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq



let g:SuperTabDefaultCompletionType = "<c-n>"

" or if your default completion type is currently context then you can use this instead:
" let g:SuperTabContextDefaultCompletionType = "<c-n>"



" noremap p gp
" noremap p gp
" noremap gP P
" noremap gP P


xnoremap p pgvye
" xnoremap p "_dP
" xnoremap <expr> p 'pgv"'.v:register.'y'
" xnoremap <expr> p 'pgv"'.v:register.'y`>'
" 这个插件解决了这个问题。 很好用
" https://raw.githubusercontent.com/LucHermitte/lh-misc/master/plugin/repl-visual-no-reg-overwrite.vim
""""""""""""""""""""""""""""""
" => Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    else
        execute "normal /" . l:pattern . "^M"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"Basically you press * or # to search for
"the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


"}


"{auto commands
" Return to last edit position when opening files (You want this!)
	autocmd BufReadPost *
	   \ if line("'\"") > 0 && line("'\"") <= line("$") |
	   \   exe "normal! g`\"" |
	   \ endif


   """"""""""""""""""""""""""""""
   " => VIM
   """"""""""""""""""""""""""""""
   autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>

   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " => MISC
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   "Remove the Windows ^M
   noremap <Leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

   "Paste toggle - when pasting something in, don't indent.
   set pastetoggle=<F3>



	"markdown配置
	" au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
	au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
	" 这个是设置成 filetype=markdown 是为自带的markdown syntax file 设置的。
	" au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
	" let g:markdown_syntax_conceal = 0 " vim 8.0 使用了https://github.com/tpope/vim-markdown 这个syntax。把conceal 关掉，太烦人了。

	au BufRead,BufNewFile *.{go}   set filetype=go
	au BufRead,BufNewFile *.{js}   set filetype=javascript

	autocmd! BufRead,BufNewFile,BufReadPost *.snippets set filetype=snippets
	autocmd! BufRead,BufNewFile *.json set filetype=json
	autocmd! BufRead,BufNewFile *.ts set filetype=typescript
	autocmd BufNewFile,BufRead *.vm set filetype=html
	autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

	autocmd BufNewFile,BufRead *.conf set filetype=config
	au BufRead,BufNewFile *.scss set filetype=scss.css
	autocmd BufNewFile,BufRead *.coffee set filetype=coffee
	autocmd FileType haskell setlocal commentstring=--\ %s
	autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
	autocmd FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
	" Instead of reverting the cursor to the last position in the buffer, we
	" set it to the first line when editing a git commit message
	au FileType gitcommit au! BufEnter COMMIT_EDITMSG
		\ call setpos('.', [0, 1, 1, 0])
	au VimEnter * :call SetTabLabel()

	autocmd BufNewFile * normal G
	autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr> " quickfix模式

	" autocmd BufRead,BufNewFile *.json setf json
	autocmd BufNewFile,BufReadPost *.xtpl set filetype=html
	autocmd BufNewFile,BufRead *.xtpl set ft=html
	autocmd FileType xtpl set ft=html
	autocmd BufNewFile,BufRead *.vm set ft=velocity
	autocmd BufNewFile,BufRead *.ejs set ft=html
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
	autocmd FocusGained, BufEnter * :silent! !
	autocmd FileType python syn keyword pythonDecorator True None False self
	autocmd BufNewFile,BufRead *.jinja set syntax=htmljinja
	autocmd BufNewFile,BufRead *.mako set ft=mako
	au! BufRead,BufNewFile *.bat
		\ if getline(1) =~ '--\*-Perl-\*--' | setf perl | endif
	autocmd WinEnter call SetTabLabel()
	autocmd BufEnter call SetTabLabel()
	"https://superuser.com/questions/195022/vim-how-to-synchronize-nerdtree-with-current-opened-tab-file-path
	if expand("%:p")
	autocmd BufEnter * lcd %:p:h
	endif
	"http://inlehmansterms.net/2014/09/04/sane-vim-working-directories/
	"http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
	autocmd BufEnter * silent! lcd %:p:h
	autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
	let s:default_path = escape(&path, '\ ') " store default value of 'path'

	" Always add the current file's directory to the path and tags list if not
	" already there. Add it to the beginning to speed up searches.
	autocmd BufRead *
		\ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
		\ exec "set path-=".s:tempPath |
		\ exec "set path-=".s:default_path |
		\ exec "set path^=".s:tempPath |
		\ exec "set path^=".s:default_path
	autocmd Filetype *
		\if &omnifunc == "" |
		\setlocal omnifunc=syntaxcomplete#Complete |
		\endif
	" Automatically open and close the popup menu / preview window
	au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
	" gnuplot syntax highlighting
	au BufNewFile,BufRead *.plt,.gnuplot setf gnuplot
	" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
	autocmd FileType ruby set dictionary+=~/.vim/dict/ruby.dict
	au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict
"}

" vim: ts=4 sw=4 fdm=marker
