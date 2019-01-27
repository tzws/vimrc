"==========================================
" Initial Plugin 加载插件
"==========================================

" 修改leader键
let mapleader = ','
let g:mapleader = ','

" 开启语法高亮
syntax on


" ==========================================
" bundle 插件管理和配置项
" ==========================================

"------------------------------------------- begin of configs --------------------------------------------

" ################### 包依赖 #####################
" package dependence:  ctags, ag(he_silver_searcher)
" python dependence:   pep8, pyflake

" 非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible
filetype off " required! turn off

" ################### 插件管理 ###################

" inspired by spf13, 自定义需要的插件集合
if !exists('g:bundle_groups')
    " let g:bundle_groups=['python', 'javascript', 'markdown', 'html', 'css', 'tmux', 'beta', 'json', 'nginx', 'golang', 'ruby', 'less', 'php', 'coffeescript', 'shell']
    let g:bundle_groups=['python', 'javascript', 'markdown', 'html', 'css', 'tmux', 'json', 'nginx', 'less', 'php', 'coffeescript', 'shell']
    " let g:bundle_groups=['python', 'javascript', 'markdown', 'html', 'css', 'tmux', 'beta']
endif


" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" syntastic
Plug 'scrooloose/syntastic'

" Group dependencies, vim-snippets depends on ultisnips
" 代码片段快速插入 (snippets中,是代码片段资源,需要学习)
" Snippets are separated from the engine. Add this if you want them:
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" auto complete
" 代码自动补全
" 迄今为止用到的最好的自动VIM自动补全插件
" 重启 :YcmRestartServer
Plug 'Valloric/YouCompleteMe'
" 自动补全单引号，双引号等
Plug 'Raimondi/delimitMate'
" 自动补全html/xml标签
Plug 'docunext/closetag.vim', { 'for': ['html', 'xml'] }

" quick edit
" 快速注释
Plug 'scrooloose/nerdcommenter'


" 快速加入修改环绕字符
" for repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
" trailingwhitespace
" 快速去行尾空格 [, + <Space>]
Plug 'bronson/vim-trailing-whitespace'
" easyalign
" 快速赋值语句对齐
Plug 'junegunn/vim-easy-align'



" quick movement
" easymotion
"更高效的移动 [,, + w/fx/h/j/k/l]
Plug 'Lokaltog/vim-easymotion'

" 更高效的行内移动, f/F/t/T, 才触发
" quickscope
Plug 'unblevable/quick-scope'

Plug 'vim-scripts/matchit.zip'
" signature
" 显示marks - 方便自己进行标记和跳转
" m[a-zA-Z] add mark
" '[a-zA-Z] go to mark
" m<Space>  del all marks
" m/        list all marks
Plug 'kshenoy/vim-signature'

" quick selection and edit
" expandregion
" 选中区块
Plug 'terryma/vim-expand-region'
" 多光标选中编辑
" multiplecursors
Plug 'terryma/vim-multiple-cursors'

" quick locate file or function
" 文件搜索
" change to https://github.com/ctrlpvim/ctrlp.vim
" ctrlp ctrlpfunky
Plug 'ctrlpvim/ctrlp.vim' | Plug 'tacahiroy/ctrlp-funky'
" ctrlsf
" 类似sublimetext的搜索
" In CtrlSF window:
" 回车/o, 打开
" t       在tab中打开(建议)
" T - Lkie t but focus CtrlSF window instead of opened new tab.
" q - Quit CtrlSF window.
Plug 'dyng/ctrlsf.vim'
" incsearch
" Plug 'haya14busa/incsearch.vim'
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" quick run
" quickrun
Plug 'thinca/vim-quickrun'

" git
" fugitive
Plug 'tpope/vim-fugitive'
" gitgutter
Plug 'airblade/vim-gitgutter'

" gundo
" edit history, 可以查看回到某个历史状态
Plug 'sjl/gundo.vim'

" view
" airline
" 状态栏增强展示
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" rainbow_parentheses
" 括号显示增强
Plug 'kien/rainbow_parentheses.vim'
" 主题 solarized
" solarized
" Plug 'altercation/vim-colors-solarized'
" molokai
" 主题 molokai
" Plug 'tomasr/molokai'

" 主题 pyte
Plug 'vim-scripts/pyte'

" nav
" nerdtree nerdtreetabs
Plug 'scrooloose/nerdtree' | Plug 'jistr/vim-nerdtree-tabs'
" ctrlspace
Plug 'vim-ctrlspace/vim-ctrlspace'
" tagbar
Plug 'majutsushi/tagbar'

" text object
" 支持自定义文本对象
Plug 'kana/vim-textobj-user'
" 增加行文本对象: l   dal yal cil
Plug 'kana/vim-textobj-line'
" 增加文件文本对象: e   dae yae cie
Plug 'kana/vim-textobj-entire'
" 增加缩进文本对象: i   dai yai cii - 相同缩进属于同一块
Plug 'kana/vim-textobj-indent'

if count(g:bundle_groups, 'tmux')
    " tmux
    " For tmux navigator Ctrl-hjkl
    Plug 'christoomey/vim-tmux-navigator'
endif

if count(g:bundle_groups, 'markdown')
    Plug 'plasticboy/vim-markdown', { 'for': ['markdown', 'md'] }
    " https://github.com/suan/vim-instant-markdown
    " npm -g install instant-markdown-d
    " Plug 'suan/vim-instant-markdown'
    " let g:instant_markdown_slow = 1
    " let g:instant_markdown_autostart = 0
    " map <F12> :InstantMarkdownPreview<CR>
endif

if count(g:bundle_groups, 'golang')
    " 1. vim a.go
    " 2. :GoInstallBinaries
    " vimgo  https://github.com/fatih/vim-go
    Plug 'fatih/vim-go', {'for': 'go'}
endif


if count(g:bundle_groups, 'python')
    " for python.vim syntax highlight
    " pythonsyntax
    Plug 'hdima/python-syntax', { 'for': 'python' }
    Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
    Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'python' }

    " isort  https://github.com/timothycrosley/isort#readme + https://github.com/fisadev/vim-isort#installation
    " pip install isort
    Plug 'fisadev/vim-isort', { 'for': 'python' }
    " Shift-V 上下选中, ctrl + i 规范化
    let g:vim_isort_map = '<C-i>'
endif

if count(g:bundle_groups, 'php')
    " piv
    " shift-v可以查看函数手册 / leader-pd生成注释
    Plug 'spf13/PIV', { 'for': 'php' }
endif

if count(g:bundle_groups, 'ruby')
    Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
    Plug 'tpope/vim-rails', { 'for': 'ruby' }
    " dir / dar
    Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

    " 有bug, 和当前有冲突, 尚未解决, 不要打开 => TODO: solve this problem
    " Plug 'tpope/vim-endwise'
endif

if count(g:bundle_groups, 'javascript')
    " javascript
    " 注意: syntax这个插件要放前面
    Plug 'othree/yajs.vim' | Plug 'pangloss/vim-javascript', {'for': 'javascript'}
    " Plug 'jelera/vim-javascript-syntax' | Plug 'pangloss/vim-javascript'

    " TODO: jquery? for, remove or keep
    Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
    let g:used_javascript_libs = 'jquery,underscore,backbone'

    " for javascript 自动补全, 配合YCM, 需要安装全局环境的（非nvm中) node.js&npm
    " 安装完成后还需要在 bundle/tern_for_vim 下执行 npm install 安装依赖 `cd ~/.vim/bundle/tern_for_vim && npm install`
    " see https://github.com/marijnh/tern_for_vim
    " Plug 'marijnh/tern_for_vim', {'do': 'npm install'}
endif


if count(g:bundle_groups, 'coffeescript')
    Plug 'kchmck/vim-coffee-script', {'for': 'coffeescript'}
endif

" if count(g:bundle_groups, 'shell')
    " Plug 'Shougo/vimshell.vim'
" endif

if count(g:bundle_groups, 'json')
    " json
    Plug 'elzr/vim-json', {'for': 'json'}
endif

if count(g:bundle_groups, 'css')
    " css
    " not work in iterm2 which termianl selection is not xterm-256, and it slow
    " Plug 'ap/vim-css-color'

    " 这个有坑, see issue https://github.com/wklken/k-vim/issues/49
    " Plug 'gorodinskiy/vim-coloresque'
    " Plug 'lilydjwg/colorizer'
endif

if count(g:bundle_groups, 'less')
    " ###### vim.less : less 自动更新##########
    " Plug 'groenewege/vim-less'
    " autocmd BufWritePost *.less :!lessc % > %:p:r.css
endif

if count(g:bundle_groups, 'html')
    " ###### emmet HTML complete #########
    " Plug "mattn/emmet-vim"
endif

if count(g:bundle_groups, 'nginx')
    " Plug 'evanmiller/nginx-vim-syntax'
endif


" this is just for beta version
if count(g:bundle_groups, 'beta')
    " indent
    Plug 'nathanaelkane/vim-indent-guides'
    " <leader>ig to trigger
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black

endif

Plug 'luochen1990/rainbow'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'ShowTrailingWhitespace'
"strip all trailing whitespace in the current file
" nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

Plug 'mhinz/vim-hugefile'
Plug 'ervandew/supertab'


" Initialize plugin system
call plug#end()


" ################### 基础 ######################

" syntastic {{{
    " dependence
    " 1. shellcheck `brew install shellcheck` https://github.com/koalaman/shellcheck

    let g:syntastic_error_symbol='>>'
    let g:syntastic_warning_symbol='>'
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=0
    let g:syntastic_enable_highlighting=1

    " checkers
    " 最轻量
    " let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes
    " 中等
    " error code: http://pep8.readthedocs.org/en/latest/intro.html#error-codes
    let g:syntastic_python_checkers=['pyflakes', 'pep8'] " 使用pyflakes,速度比pylint快
    let g:syntastic_python_pep8_args='--ignore=E501,E225,E124,E712'
    " 重量级, 但是足够强大, 定制完成后相当个性化
    " pylint codes: http://pylint-messages.wikidot.com/all-codes
    " let g:syntastic_python_checkers=['pyflakes', 'pylint'] " 使用pyflakes,速度比pylint快
    " let g:syntastic_python_checkers=['pylint'] " 使用pyflakes,速度比pylint快
    " let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'

    " if js
    " let g:syntastic_javascript_checkers = ['jsl', 'jshint']
    " let g:syntastic_html_checkers=['tidy', 'jshint']

    " to see error location list
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_enable_signs = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_auto_jump = 0
    let g:syntastic_loc_list_height = 5

    function! ToggleErrors()
        let old_last_winnr = winnr('$')
        lclose
        if old_last_winnr == winnr('$')
            " Nothing was closed, open syntastic_error location panel
            Errors
        endif
    endfunction
    nnoremap <Leader>s :call ToggleErrors()<cr>

    " ,en ,ep to jump between errors
    function! <SID>LocationPrevious()
    try
        lprev
    catch /^Vim\%((\a\+)\)\=:E553/
        llast
    endtry
    endfunction

    function! <SID>LocationNext()
    try
        lnext
    catch /^Vim\%((\a\+)\)\=:E553/
        lfirst
    endtry
    endfunction

    nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>
    nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
    nmap <silent> <Leader>ep    <Plug>LocationPrevious
    nmap <silent> <Leader>en    <Plug>LocationNext

    " 修改高亮的背景色, 适应主题
    highlight SyntasticErrorSign guifg=white guibg=black

    " 禁止插件检查java
    " thanks to @marsqing, see https://github.com/wklken/k-vim/issues/164
    let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['java'] }

    " 关闭syntastic语法检查, 鼠标复制代码时用到, 防止把错误标志给复制了
    nnoremap <silent> <Leader>ec :SyntasticToggleMode<CR>
" }}}


" ################### 自动补全 ###################

" YouCompleteMe {{{
    "youcompleteme  默认tab  s-tab 和自动补全冲突
    "let g:ycm_key_list_select_completion=['<c-n>']
    let g:ycm_key_list_select_completion = ['<Down>']
    "let g:ycm_key_list_previous_completion=['<c-p>']
    let g:ycm_key_list_previous_completion = ['<Up>']
    let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
    let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
    let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
    let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
    let g:ycm_collect_identifiers_from_tags_files = 1
    " 开启语法关键字补全
    let g:ycm_seed_identifiers_with_syntax=1

    "let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开

    " 跳转到定义处, 分屏打开
    let g:ycm_goto_buffer_command = 'horizontal-split'
    " nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

    " 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
    " old version
    if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
        let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
    endif
    " new version
    if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
        let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
    endif

    " 直接触发自动补全 insert模式下
    " let g:ycm_key_invoke_completion = '<C-Space>'
    " 黑名单,不启用
    let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'gitcommit' : 1,
        \}
" }}}


" ultisnips {{{
    let g:UltiSnipsExpandTrigger       = "<tab>"
    let g:UltiSnipsJumpForwardTrigger  = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
    let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
    " 定义存放代码片段的文件夹 .vim/UltiSnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
    " 进入对应filetype的snippets进行编辑
    map <leader>us :UltiSnipsEdit<CR>

    " ctrl+j/k 进行选择
    func! g:JInYCM()
        if pumvisible()
            return "\<C-n>"
        else
            return "\<c-j>"
        endif
    endfunction

    func! g:KInYCM()
        if pumvisible()
            return "\<C-p>"
        else
            return "\<c-k>"
        endif
    endfunction
    inoremap <c-j> <c-r>=g:JInYCM()<cr>
    au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<cr>"
    let g:UltiSnipsJumpBackwordTrigger = "<c-k>"
" }}}


" delimitMate {{{
    " for python docstring ",优化输入
    au FileType python let b:delimitMate_nesting_quotes = ['"']
    au FileType php let delimitMate_matchpairs = "(:),[:],{:}"
    " 关闭某些类型文件的自动补全
    "au FileType mail let b:delimitMate_autoclose = 0
" }}}


" closetag {{{
    let g:closetag_html_style=1
" }}}

" ################### 快速编码 ###################

" nerdcommenter {{{
    let g:NERDSpaceDelims=1
    let g:NERDAltDelims_python = 1
" }}}

" trailingwhitespace {{{
    map <leader><space> :FixWhitespace<cr>
" }}}

" easyalign {{{
    vmap <Leader>a <Plug>(EasyAlign)
    nmap <Leader>a <Plug>(EasyAlign)
    if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
    endif
    let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
    " Default:
    " If a delimiter is in a highlight group whose name matches any of the followings, it will be ignored.
    let g:easy_align_ignore_groups = ['Comment', 'String']
" }}}

" ################### 快速移动 ###################

" easymotion {{{
    let g:EasyMotion_smartcase = 1
    "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
    " 重复上一次操作, 类似repeat插件, 很强大
    map <Leader><leader>. <Plug>(easymotion-repeat)
" }}}


" quickscope {{{
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    " macvim/gvim会有问题, 暂时注解
    " let g:qs_first_occurrence_highlight_color = '#afff5f' " gui vim
    " let g:qs_first_occurrence_highlight_color = 155       " terminal vim
    " let g:qs_second_occurrence_highlight_color = '#5fffff'  " gui vim
    " let g:qs_second_occurrence_highlight_color = 81         " terminal vim
" }}}

" ################### 快速选中 ###################

" expandregion {{{
    " map + <Plug>(expand_region_expand)
    " map _ <Plug>(expand_region_shrink)
    vmap v <Plug>(expand_region_expand)
    vmap V <Plug>(expand_region_shrink)
    " Extend the global default
    call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
      \ })
" }}}

" multiplecursors {{{
    let g:multi_cursor_use_default_mapping=0
    " Default mapping
    let g:multi_cursor_next_key='<C-m>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
" }}}

" ################### 功能相关 ###################

" ctrlp ctrlpfunky{{{
    let g:ctrlp_map = '<leader>p'
    let g:ctrlp_cmd = 'CtrlP'
    map <leader>f :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
        \ }
    let g:ctrlp_working_path_mode=0
    let g:ctrlp_match_window_bottom=1
    let g:ctrlp_max_height=15
    let g:ctrlp_match_window_reversed=0
    let g:ctrlp_mruf_max=500
    let g:ctrlp_follow_symlinks=1
    " 如果安装了ag, 使用ag
    " if executable('ag')
    " " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " " ag is fast enough that CtrlP doesn't need to cache
    " let g:ctrlp_use_caching = 0
    " endif

    " ctrlpfunky
    " ctrlp插件1 - 不用ctag进行函数快速跳转
    nnoremap <Leader>fu :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
    nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    let g:ctrlp_funky_syntax_highlight = 1

    let g:ctrlp_extensions = ['funky']
" }}}


" ctrlsf {{{
    nmap \ <Plug>CtrlSFCwordPath<CR>
    " let g:ctrlsf_position = 'below'
    " let g:ctrlsf_winsize = '30%'
    let g:ctrlsf_auto_close = 0
    let g:ctrlsf_confirm_save = 0
    " Note: cannot use <CR> or <C-m> for open
    " Use : <sapce> or <tab>
    let g:ctrlsf_mapping = {
        \ "open"  : "<Space>",
        \ "openb" : "O",
        \ "tab"   : "t",
        \ "tabb"  : "T",
        \ "prevw" : "p",
        \ "quit"  : "q",
        \ "next"  : "<C-J>",
        \ "prev"  : "<C-K>",
        \ "pquit" : "q",
        \ }
" }}}

" git.  git操作还是习惯命令行,vim里面处理简单diff编辑操作

" fugitive {{{
    " :Gdiff  :Gstatus :Gvsplit
    nnoremap <leader>ge :Gdiff<CR>
    " not ready to open
    " <leader>gb maps to :Gblame<CR>
    " <leader>gs maps to :Gstatus<CR>
    " <leader>gd maps to :Gdiff<CR>  和现有冲突
    " <leader>gl maps to :Glog<CR>
    " <leader>gc maps to :Gcommit<CR>
    " <leader>gp maps to :Git push<CR>
" }}}

" gitgutter {{{
    " 同git diff,实时展示文件中修改的行
    " 只是不喜欢除了行号多一列, 默认关闭,gs时打开
    let g:gitgutter_map_keys = 0
    let g:gitgutter_enabled = 0
    let g:gitgutter_highlight_lines = 1
    nnoremap <leader>gs :GitGutterToggle<CR>
" }}}

" gundo {{{
    noremap <leader>h :GundoToggle<CR>
" }}}

" ################### 显示增强 ###################

" airline {{{
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '?'
    let g:airline_left_alt_sep = '?'
    let g:airline_right_sep = '?'
    let g:airline_right_alt_sep = '?'
    let g:airline_symbols.linenr = '?'
    let g:airline_symbols.branch = '?'
    " 是否打开tabline
    " let g:airline#extensions#tabline#enabled = 1
" }}}



" rainbow_parentheses {{{
    " 不加入这行, 防止黑色括号出现, 很难识别
    " \ ['black',       'SeaGreen3'],
    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
" }}}


" ################### 显示增强-主题 ###################"

" solarized {{{
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    " let g:solarized_termcolors=256
" }}}

" molokai {{{
    " monokai原始背景色
    let g:molokai_original = 1
    let g:rehash256 = 1
" }}}

" ################### 快速导航 ###################

" nerdtree nerdtreetabs {{{
    " map <leader>n :NERDTreeToggle<CR>
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    " s/v 分屏打开文件
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'


    " nerdtreetabs
    map <Leader>n <plug>NERDTreeTabsToggle<CR>
    " 关闭同步
    " let g:nerdtree_tabs_synchronize_view=0
    " let g:nerdtree_tabs_synchronize_focus=0
    " 是否自动开启nerdtree
    " thank to @ListenerRi, see https://github.com/wklken/k-vim/issues/165
    " let g:nerdtree_tabs_open_on_console_startup=0
    " let g:nerdtree_tabs_open_on_gui_startup=0
" }}}


" Vim Workspace Controller
" ctrlspace {{{
    let g:airline_exclude_preview = 1
    hi CtrlSpaceSelected guifg=#586e75 guibg=#eee8d5 guisp=#839496 gui=reverse,bold ctermfg=10 ctermbg=7 cterm=reverse,bold
    hi CtrlSpaceNormal   guifg=#839496 guibg=#021B25 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
    hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
    hi CtrlSpaceStatus   guifg=#839496 guibg=#002b36 gui=reverse term=reverse cterm=reverse ctermfg=12 ctermbg=8
" }}}


" 标签导航
" tagbar {{{
    nmap <F9> :TagbarToggle<CR>
    let g:tagbar_autofocus = 1
    " let g:tagbar_autoshowtag = 1
    " let g:tagbar_show_visibility = 1
    " for ruby
    let g:tagbar_type_ruby = {
        \ 'kinds' : [
            \ 'm:modules',
            \ 'c:classes',
            \ 'd:describes',
            \ 'C:contexts',
            \ 'f:methods',
            \ 'F:singleton methods'
        \ ]
    \ }

    " go语言的tagbar配置
    " 1. install gotags 'go get -u github.com/jstemmer/gotags'
    " 2. make sure `gotags` in you shell PATH, you can call check it with `which gotags`
    " for gotags. work with tagbar
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }
" }}}


" ################### 语言相关 ###################

" quickrun {{{
    let g:quickrun_config = {
    \   "_" : {
    \       "outputter" : "message",
    \   },
    \}

    let g:quickrun_no_default_key_mappings = 1
    nmap <Leader>r <Plug>(quickrun)
    map <F10> :QuickRun<CR>
" }}}


" pythonsyntax {{{
    let python_highlight_all = 1
" }}}

" piv {{{
    let g:DisableAutoPHPFolding = 1
" }}}


" vimgo {{{
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1

    let g:go_fmt_fail_silently = 1
    " format with goimports instead of gofmt
    let g:go_fmt_command = "goimports"
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go', 'java'] }
" }}}

" markdown {{{
    let g:vim_markdown_folding_disabled=1
" }}}


" javascript {{{
    " pangloss/vim-javascript
    let g:html_indent_inctags = "html,body,head,tbody"
    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"
" }}}

" json {{{
    let g:vim_json_syntax_conceal = 0
" }}}

" css {{{
" }}}

" nginx {{{
" }}}


" ####### temp #######

" beta {{{
    " python code format
    " format all file
    autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
    " format select block
    " autocmd FileType python vnoremap <leader>y :!yapf<Cr>

    " Plug 'mindriot101/vim-yapf'
    " scriptencoding utf-8
    " let g:yapf_style = "google"
    " let g:yapf_style = "pep8"
    " setenv PYTHONIOENCODING UTF-8
    " nnoremap <leader>y :call Yapf()<cr>
" }}}

"------------------------------------------- end of configs --------------------------------------------


" ensure ftdetect et al work by including this after the bundle stuff
filetype plugin indent on

" NOTE: 以下配置有详细说明，一些特性不喜欢可以直接注解掉

"==========================================
" General Settings 基础设置
"==========================================


" history存储容量
set history=2000

" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 文件修改之后自动载入
set autoread
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

" 备份,到另一个位置. 防止误删, 目前是取消备份
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

" 取消备份。 视情况自己改
set nobackup
" 关闭交换文件
set noswapfile


" TODO: remove this, use gundo
" create undo file
" if has('persistent_undo')
  " " How many undos
  " set undolevels=1000
  " " number of lines to save for undo
  " set undoreload=10000
  " " So is persistent undo ...
  " "set undofile
  " set noundofile
  " " set undodir=/tmp/vimundo/
" endif

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" 突出显示当前列
set cursorcolumn
" 突出显示当前行
set cursorline


" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=


" 鼠标暂不启用, 键盘党....
set mouse-=a
" 启用鼠标
" set mouse=a
" Hide the mouse cursor while typing
" set mousehide


" 修复ctrl+m 多光标操作选择的bug，但是改变了ctrl+v进行字符选中时将包含光标下的字符
set selection=inclusive
set selectmode=mouse,key

" change the terminal's title
set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" Remember info about open buffers on close
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" set winwidth=79

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" 显示行号
set number
" 取消换行
set nowrap

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2


" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

map <S-Insert> <MiddleMouse> 
" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
set nrformats=

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
" au FocusLost * :set norelativenumber number
" au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
" autocmd InsertEnter * :set norelativenumber number
" autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
" set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

if has(" win32" )
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif

if has("gui_running")
    "hi cursorline guibg=#333333
    "hi CursorColumn guibg=#333333

    " 解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    " 解决consle输出乱码
    language messages zh_CN.utf-8
    if has ("win32")
        behave mswin
    endif
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B


"==========================================
" others 其它设置
"==========================================
" vimrc文件修改之后自动加载, windows
autocmd! bufwritepost _vimrc source %
" vimrc文件修改之后自动加载, linux
autocmd! bufwritepost .vimrc source %

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class
if has("win32")
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
else 
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
endif


" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

" command-line window
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>


" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================

" 主要按键重定义

" 关闭方向键, 强迫自己用 hjkl
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" F1 - F6 设置

" F1 废弃这个键,防止调出系统帮助
" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"

" F2 行号开关，用于鼠标复制代码用
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>

" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" F5 set paste问题已解决, 粘贴代码前不需要按F5了
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()



" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>


" Go to home and end using capitalized directions
noremap H ^
noremap L $


" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :


" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>


" 搜索相关
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" switch # *
nnoremap # *
nnoremap * #

" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#


" tab/buffer相关

" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" 使用方向键切换buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>


" tab 操作
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim

" tab切换
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>


" => 选中及操作改键

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

" auto jump to end of select
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" select all
map <Leader>sa ggVG

" select block
nnoremap <leader>v V`}

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" kj 替换 Esc
inoremap kj <Esc>

" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>


" Jump to start and end of line using the home row keys
" 增强tab操作, 导致这个会有问题, 考虑换键
"nmap t o<ESC>k
"nmap T O<ESC>j

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly save the current file
nnoremap <leader>w :w<CR>

" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"==========================================
" FileType Settings  文件类型设置
"==========================================

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
" disable showmatch when use > in php
au BufWinEnter *.php set mps-=<:>

autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>
autocmd FileType vim set nofen
au FileType javascript imap <c-t> console.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

" autocmd FileType c map <buffer> <leader><space> :w<cr>:!gcc %<cr>
au BufEnter *.txt setlocal ft=txt

"autocmd Filetype cpp setlocal tags+=D:\Qt\2010.05\qt\include\tags
autocmd Filetype cpp set tags+=D:\data\ctags58\tags\cpp
autocmd Filetype cpp set tags+=D:\data\ctags58\tags\stl

" in human-language files, automatically format everything at 72 chars:
autocmd FileType mail,human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent


" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent
let perl_extended_vars=1

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

"""""""""""""""""""""""""""""""
" => Java section
"""""""""""""""""""""""""""""""
au FileType java inoremap <buffer> <C-t> System.out.println();<esc>hi

"Java comments
"autocmd FileType java source ~/.vim/macros/jcommenter.vim
"autocmd FileType java let b:jcommenter_class_author='Amir Salihefendic (amix@amix.dk)'
"autocmd FileType java let b:jcommenter_file_author='Amir Salihefendic (amix@amix.dk)'
"autocmd FileType java map <buffer> <F2> :call JCommentWriter()<cr>

"Abbr'z
autocmd FileType java inoremap <buffer> $pr private
autocmd FileType java inoremap <buffer> $r return
autocmd FileType java inoremap <buffer> $pu public
autocmd FileType java inoremap <buffer> $i import
autocmd FileType java inoremap <buffer> $b boolean
autocmd FileType java inoremap <buffer> $v void
autocmd FileType java inoremap <buffer> $s String

"Folding
function! JavaFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
    syn match foldImports /\(\n\?import.\+;\n\)\+/ transparent fold

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType java call JavaFold()
au FileType java setl fen

au BufEnter *.sablecc,*.scc set ft=sablecc

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""


au FileType javascript imap <c-t> console.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi


" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc


" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

"==========================================
" TEMP 设置, 尚未确定要不要
"==========================================

" tmux
" function! WrapForTmux(s)
"   if !exists('$TMUX')
"     return a:s
"   endif
"
"   let tmux_start = "\<Esc>Ptmux;"
"   let tmux_end = "\<Esc>\\"
"
"   return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
" endfunction
"
" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" let &t_EI .= WrapForTmux("\<Esc>[?2004l")

" allows cursor change in tmux mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" if exists('$TMUX')
    " let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    " let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" endif


"==========================================
" Theme Settings  主题设置
"==========================================

" Set extra options when running in GUI mode
if has("gui_running")
    if has ("win32")
        " set guifont=Monaco:h14
        set guifont=DejaVu\ Sans\ Mono:h14
        "set guifont=SimSun:h15:w15
        "set guifont=NSimSun:h12:w12:cGB2312
        "set guifont=yahei:h19:cGB2312
        "set guifont=Inconsolata:h16:cGB2312
        "set guifont=Vera\ Sans\ YuanTi\ Mono\ 15
        "set guifont=Bitstream\ Vera\ Sans\ Mono\ 14
    endif

    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    " set guioptions-=T
    set guioptions+=e
    " set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

if exists("&ambiwidth")
    set ambiwidth=double
endif



" theme主题
set background=dark
set t_Co=256

colorscheme pyte
" colorscheme solarized
" colorscheme molokai
" colorscheme desert


" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

"Some nice mapping to switch syntax (useful if one mixes different languages
"in one file)
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>

"Favorite filetypes
"set ffs=unix,dos,mac

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>
nmap <leader>fv :se ft=vim<cr>

"Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Disable the stupid Bclose thing....................................
map <leader>bd :Bclose<cr>
"map <down> <leader>bd
"Use the arrows to something usefull
"map <right> :bn<cr>
"map <left> :bp<cr>

"Tab configuration
map <leader>tn :tabnew <cr>
map <c+w> :tabclose <cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
try
    set switchbuf=usetab
    set stal=2
catch
endtry

"Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i


"Switch to current dir
map <leader>cd :cd %:p:h<cr>

"Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./

cno $q <C-\>eDeleteTillSlash()<cr>

cno $c e <C-\>eCurrentFileDir("e")<cr>

cno $tc <C-\>eCurrentFileDir("tabnew")<cr>
cno $th tabnew ~/
cno $td tabnew ~/Desktop/

"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

map <C-j> gj
map <C-h> h
map <C-k> gk
map <C-l> l




"Open a dummy buffer for paste
map <leader>q :e ~/buffer<cr>

"Remove the Windows ^M
noremap <Leader>M mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Remove indenting on empty lines
" map <F2> :%s/\s*$//g<cr>:noh<cr>''

"Super paste
" 实际上，也就是在insert mode 下才会有这样的问题。
" 在normal mode下，"+p 一点问题没有
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
inoremap <C-R>+  <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

" :set clipboard=unnamed or :set clipboard=unnamedplus to make all yanking/deleting operations automatically copy to the system clipboard. 
" This could be an inconvenience in some cases where you are storing something else in the clipboard as it will override it.
" set clipboard=unnamedplus
vnoremap <C-c> "+y

"My information
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xname Zhang Chunfei

"Move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


" Go to last file if invoked without arguments.
autocmd VimEnter * nested if
  \ argc() == 0 &&
  \ bufname("%") == "" &&
  \ bufname("2" + 0) != "" |
  \   exe "normal! `0" |
  \ endif

" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
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


func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

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



func! Cwd()
    let cwd = getcwd()
    return "e " . cwd 
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


"Turn backup off
set nobackup
set nowb
set noswapfile

"Enable folding, I find it very useful
set nofen
set fdl=0

""""""""""""""""""""""""""""""
" => Yank Ring
""""""""""""""""""""""""""""""
map <leader>y :YRShow<cr>

"Maximize gvim after open
au GUIEnter * simalt ~x

map C-Enter C-Tab " Ctrl+Enter also toggles buffer
" have Y behave analogously to D and C rather than to dd and cc (which is already done by yy):
" noremap Y y$

" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>
vmap <S-Tab> <C-D>

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq


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


let g:SuperTabDefaultCompletionType = "<c-n>"

" or if your default completion type is currently context then you can use this instead:
" let g:SuperTabContextDefaultCompletionType = "<c-n>"
