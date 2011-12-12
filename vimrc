call pathogen#runtime_append_all_bundles() 

set completeopt=longest,menuone "longest first, show menu for only one

" File options
if has("autocmd")
 filetype plugin on
 filetype indent on
endif "has("autocmd")

set backupdir=~/.vim-backups
set dir=~/.vim-swap
set backspace=indent,eol,start "Backspace indent, over line breaks and outside of insert

" Default stops
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent

set smartcase "Case insensitve matching
set ruler "Always show status bar
set laststatus=2 " (also) always show the status bar
set history=1000

" File specifics
" Python

au FileType python setlocal tabstop=4|setlocal shiftwidth=4|setlocal softtabstop=4
au FileType python setlocal expandtab 
au FileType python setlocal smarttab 
au FileType python :source ~/.vim/python_fold.vim
au FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Javascript

au FileType javascript setlocal tabstop=4|setlocal shiftwidth=4|setlocal softtabstop=4
au FileType javascript setlocal expandtab 
au FileType javascript setlocal smarttab 

" Perl

au FileType perl let perl_fold=1

" GLSL
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setlocal filetype=glsl

" TeX
au FileType tex setlocal spell
au FileType tex setlocal spl=en_gb

" C++
au FileType cpp setlocal tags+=~/.vim-tags/cpp
au FileType cpp setlocal tags+=~/.vim-tags/gl
au FileType cpp setlocal tags+=~/.vim-tags/glm
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au FileType cpp au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
au FileTYpe cpp setlocal completeopt=menuone,menu,longest,preview

set foldmethod=syntax

if has('gui_running')
	set guifont="Monospace 8"
endif

set number
syntax enable
set background=dark
set t_Co=256
" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
let g:solarized_termtrans=1    "default value is 0
let g:solarized_termcolors=256    "default value is 16
let g:solarized_contrast="high"    "default value is normal
let g:solarized_visibility="high"    "default value is normal
let g:solarized_hitrail=1    "default value is 0
let g:solarized_termcolors=256
let g:solarized_bold=0
let g:solarized_termtrans=1
colorscheme solarized
"colorscheme vibrantink
