" Vundle {{{1
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'          " required

Plugin 'chriskempson/base16-vim'    " colorscheme

Plugin 'Valloric/YouCompleteMe'     " write faster
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-surround'         " edit faster
Plugin 'tomtom/tcomment_vim'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'mattn/emmet-vim'            " zen-coding

Plugin 'scrooloose/syntastic'       " syntax-checkers / -highlighting
Plugin 'Shutnik/jshint2.vim'
Plugin 'evidens/vim-twig'

Plugin 'scrooloose/nerdtree'        " nerdtree
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'Omer/vim-sparql'            " sparql filetype detection

Plugin 'https://github.com/kien/ctrlp.vim.git'

call vundle#end()                   " required
filetype plugin indent on           " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" Setup {{{1
set noerrorbells visualbell t_vb=       " Disable beeping
set makeprg=clear;'%'	                " default makeprg if none is specified
set autowrite
set backspace=2                         " make backspace work like most other apps
set showmatch                           " (sm) briefly jump to matching bracket when inserting one
set nocompatible                        " don't behave like vi
set history=1000
filetype plugin on
let mapleader = ','
set mouse=a
set viminfo+=n~/.vim/.viminfo           " move .viminfo to dotfiles
set scrolloff=5
set backupdir=~/.vim/backups            " Directories for swp files
set directory=~/.vim/backups
set timeout                             "Fixes slow O inserts (all three)
set timeoutlen=1000
set ttimeoutlen=100
set fdm=marker
au FileType {*} set fdm=marker

" File formatting
set fileformat=unix     " Always use unix fileformat.
set encoding=utf-8      " Force UTF-8 encoding.

" Word wrap {{{1
set wrap
set linebreak
set showbreak=→\ 
set textwidth=0
set wrapmargin=0
" source: http://vim.wikia.com/wiki/Word_wrap_without_line_breaks

" set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:·
set listchars=tab:\ \ ,trail:·
noremap <Leader>l :set list!<CR>

" Navigation {{{1 "
" Cursor navigation {{{2
nnoremap H ^
nnoremap L g_

" Buffers {{{2 "
" Switch buffers
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Create new buffers
nnoremap c<c-j> :bel sp new<cr>
nnoremap c<c-k> :abo sp new<cr>
nnoremap c<c-h> :lefta vsp new<cr>
nnoremap c<c-l> :rightb vsp new<cr>

" Tabs {{{2
nnoremap <c-t> :tabnew<cr>
" 2}}} "

" Brackets & More {{{1 "
" Wrap selected text in parenthesis, brackets, quotes
" vnoremap (  <ESC>`>a)<ESC>`<i(<ESC>
" vnoremap )  <ESC>`>a)<ESC>`<i(<ESC>
" vnoremap {  <ESC>`>a}<ESC>`<i{<ESC>
" vnoremap }  <ESC>`>a}<ESC>`<i{<ESC>
" vnoremap [  <ESC>`>a]<ESC>`<i[<ESC>
" vnoremap ]  <ESC>`>a]<ESC>`<i[<ESC>
" vnoremap "  <ESC>`>a"<ESC>`<i"<ESC>
" vnoremap '  <ESC>`>a'<ESC>`<i'<ESC>
" vnoremap `  <ESC>`>a`<ESC>`<i`<ESC>
" inoremap (  ()<Esc>i
" inoremap {  {}<Esc>i
" inoremap [  []<Esc>i
" Skip to next character when typing closing bracket before a closing bracket
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Esc>i"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "''\<Esc>i"
inoremap <expr> ` strpart(getline('.'), col('.')-1, 1) == "`" ? "\<Right>" : "``\<Esc>i"
" 1}}} "
" Statusline {{{1 "
set wildmenu            " Autocomplete menu options in statusline
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
set laststatus=2        " Always show statusline

" Look/Colors {{{1 "
set ruler               " Show the cursor position
set number nu           " Line numbers
set cursorline          " Color the cursorline
syntax on               " Syntax highlighting
" Base16 (GEEN gebruik maken van de 256-color themes in iTerm!!!)
set background=dark
colorscheme base16-default-dark

" Spacing/Tabs {{{1
set tabstop=4           " Tab width
set shiftwidth=4        " Shift width
set softtabstop=4       " Shift width
set autoindent          " Auto indenting
set smartindent         " Smart indenting
set expandtab
filetype indent on		" enable indentation based on filetype

" Search {{{1
set incsearch                   " (is) highlights what you are searching for as you type
set hlsearch                    " (hls) highlights all instances of the last searched string
set ignorecase                  " (ic) ignores case in search patterns
set smartcase                   " (scs) don't ignore case when the search pattern has uppercase
set infercase                   " (inf) during keyword completion, fix case of new word (when ignore case is on)
" type '/mlqksdfj' to dismiss highlights

" Plugins {{{1
" NERDTree
let g:NERDTreeWinPos = "right"					    " Open NERDTree on right side
let g:nerdtree_tabs_open_on_console_startup = 1		" Open NERDTreeTabs on start-up
let NERDTreeShowBookmarks=1						    " Always show bookmarks when opening NERDTree
" Keybinding to toggle NERDTreeTabs
map <C-w>n <plug>NERDTreeTabsToggle<CR>
" Close NERDTree when it is last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" YouCompleteMe
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_show_diagnostics_ui = 0

" T-Comment
call tcomment#DefineType('dot', '// %s')

" Syntastic
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='•'
let g:syntastic_style_error_symbol='x'
let g:syntastic_style_warning_symbol='∙'

" UltiSnip
let g:UltiSnipsExpandTrigger="<C-B>"
let g:UltiSnipsJumpForwardTrigger="<C-B>"

" ctrlp
" :CtrlPBookmarkDirAdd "~/Documents/MAARTEN/UGent Master/"

" Filetypes {{{1
" LaTeX
let g:tex_flavor = "latex"
au BufNewFile,BufRead {*.tex} let g:ycm_auto_trigger = 0
" au FileType {tex} let g:ycm_min_num_of_chars_for_completion = 3
au FileType {tex} set fdm=marker
au FileType {tex} set foldmarker={[{,}]}
" au FileType {tex} set bg=light
au FileType {tex} set spell
au FileType {tex} set spelllang=nl
autocmd FileType tex setlocal makeprg=pdflatex\ --shell-escape\ '%'

" SPARQL
au FileType {sparql} set makeprg=sparql\ --query=%

" dot
au FileType {dot} set makeprg=dot.bash\ '%'

" XML
let g:xml_syntax_folding = 1
" au BufNewFile,BufRead {*.xml} set foldmethod=syntax
" au BufNewFile,BufRead {*.xsd} set filetype=xsd.xml

au FileType {text} set ft=markdown

" HTML
au BufNewFile,BufRead {*.html} set makeprg=open\ '%'

" php
let php_folding=1
au FileType {php} set foldlevel=2
au BufNewFile,BufRead {*.inc,*.module,*.install} set ft=php     " Drupal shizzle
au FileType {php} set makeprg=clear;php\ './%'

" JavaScript
au BufNewFile,BufRead {*.js,*.json,*.coffee} set ft=javascript	"JSON & Coffee syntax highlighting

" Perl make-program
let perl_fold=1

" Bash
let sh_fold_enabled=1

" Bashrc
au BufNewFile,BufRead {.bash_profile} set fdm=marker

" Vim
au FileType {vim} set fdm=marker

" C++
au FileType {cpp} set makeprg=ce\ './%'

" Markdown
au BufNewFile,BufRead {*.md} set ft=markdown
au fileType {markdown} set spell
au fileType {markdown} set spelllang=en

" Post-Plugin settings {{{1
" Vim save session
noremap <Leader>s :mksession! session.vim<CR>
noremap <Leader>j :set bg=dark<CR>
noremap <Leader>k :set bg=light<CR>
" 1}}} "

set fdm=marker
