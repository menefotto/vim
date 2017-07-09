set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle
" " required!
Bundle 'gmarik/vundle'
" general
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ervandew/supertab'
Plugin 'vim-syntastic/syntastic'
Plugin 'Townk/vim-autoclose'
Plugin 'nathanaelkane/vim-indent-guides'
" colorschemes
Plugin 'flazz/vim-colorschemes'
" autocomplete
Plugin 'Valloric/YouCompleteMe'
"c++
Plugin 'rhysd/vim-clang-format'
Plugin 'octol/vim-cpp-enhanced-highlight'
" python
Bundle 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
"javascript
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'walm/jshint.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
" go 
Plugin 'fatih/vim-go'
" live markdown preview
Plugin 'shime/vim-livedown'
" tmux
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()

" general
"

set nocompatible
colo maui
set background=dark
syntax on
filetype off

filetype plugin indent on
set path+=**
set number
set cursorline

" Persistence undo
set undodir=~/.vim/undodir
set undofile   " Maintain undo history between sessions

" Appereance
set guifont=Go\ Mono\ Regular\ Powerline\ 12
set laststatus=2

set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set timeoutlen=100 ttimeoutlen=1

set colorcolumn=80 
let g:Powerline_symbols = 'fancy'

" Tabs spaces 
autocmd FileType css setlocal tabstop=2
autocmd FileType html,markdown setlocal  tabstop=2
autocmd FileType javascript setlocal  tabstop=2
autocmd FileType python setlocal tabstop=2 
autocmd FileType go setlocal tabstop=4
autocmd FileType cpp setlocal tabstop=2

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType go setlocal omnifunc=gocomplete#CompleteTags
autocmd FileType cpp setlocal omnifunc=cppcomplete#CompleteTags

" ctags generation
noremap <c-c> :!ctags -R --exclude='.git' . <CR>
set tags=./tags,tags; " where to look for the tags file

" Syntatic
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1

"let g:syntastic_cpp_include_dirs = ['include']
"let g:syntastic_cpp_config_file = '/home/wind85/Documents/cpp/runtime/.syntastic_cpp_config'

" C++ run and build remaps
autocmd filetype cpp nnoremap <c-b> :!clang++-4.0 -std=c++11 % -o %:r <CR>
autocmd filetype cpp nnoremap <c-r> :!clang++-4.0 -std=c++11 % -o %:r && ./%:r <CR>

let g:ycm_global_ycm_extra_conf= '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Indent guides conf
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=grey

" C++ autoformat
let g:clang_format#code_style = "google"
let g:clang_format#command = "/usr/bin/clang-format-4.0"
let g:clang_format#auto_format = 1

if has ('gui_running')
	highlight Pmenu guibg=#cccccc gui=bold
endif
