set nocompatible
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'marijnh/tern_for_vim'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'itspriddle/vim-jquery'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'othree/jspc.vim'
Plugin 'walm/jshint.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'fatih/vim-go'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'cespare/vim-toml'
Plugin 'shime/vim-livedown'

call vundle#end()
" The bundles you install will be listed here

filetype plugin indent on
set number
set cursorline
" The rest of your config follows here
"augroup vimrc_autocmds
"	autocmd!
	" highlight characters past column 120
"	autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
"	autocmd FileType python match Excess /\%80v.*/
"	autocmd FileType python set nowrap
"	augroup END

" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 12
set laststatus=2
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" Nerdtree show
map <F2> :NERDTreeToggle<CR>

" Python-mode
" " Activate rope
" " Keys:
" " K             Show python docs
" " <Ctrl-Space>  Rope autocomplete
" " <Ctrl-c>g     Rope goto definition
" " <Ctrl-c>d     Rope show documentation
" " <Ctrl-c>f     Rope find occurrences
" " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
"  [M            Jump on previous class or method (normal, visual, operator modes)
"  ]M            Jump on next class or method (normal, visual, operator modes)


" more subtle popup colors
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif

