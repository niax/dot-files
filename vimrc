call pathogen#infect()
call pathogen#helptags()

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

set mouse=a

" File specifics
" Git commit messages
au FileType gitcommit setlocal spell

" Python

au FileType python setlocal tabstop=4|setlocal shiftwidth=4|setlocal softtabstop=4
au FileType python setlocal expandtab 
au FileType python setlocal smarttab 
au FileType python :source ~/.vim/python_fold.vim
au FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Javascript

au FileType javascript setlocal tabstop=4|setlocal shiftwidth=4|setlocal softtabstop=4
au FileType javascript setlocal smarttab 

" Perl

au FileType perl let perl_fold=1
au FileType perl let perl_include_pod=1

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

let g:ctrlp_map = "<c-p>"
let g:ctrlp_cmd = "CtrlP"

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
let g:solarized_termtrans=0    "default value is 0
let g:solarized_termcolors=256   "default value is 16
let g:solarized_contrast="high"    "default value is normal
let g:solarized_visibility="high"    "default value is normal
let g:solarized_hitrail=0    "default value is 0
colorscheme solarized
"colorscheme vibrantink

" Unite
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
" For ack
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
	\ 'ignore_pattern', join([
	\ '.git'
	\ ], '\|'))
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Ctrl-P replacement
nnoremap <C-p> :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async:!<cr>
nnoremap <space>p :<C-u>Unite -buffer-name=files -start-insert buffer file_rec/async:!<cr>
" Grep the things (no more Ack-Vim)
nnoremap <space>/ :Unite grep:.<cr>
" Buffer switching
nnoremap <space>b :Unite -quick-match buffer<cr>


autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
	" Exit unite
	imap <buffer> <C-c> <Plug>(unite_exit)
	nmap <buffer> <C-c> <Plug>(unite_exit)
	nmap <buffer> <Esc> <Plug>(unite_exit)

	" Movement
	imap <buffer> <C-j>	<Plug>(unite_select_next_line)
	imap <buffer> <C-k>	<Plug>(unite_select_previous_line)
	imap <buffer> <PageUp> <Plug>(unite_select_previous_page)
	imap <buffer> <PageDown> <Plug>(unite_select_next_page)

	" Opening
	imap <silent><buffer><expr> <C-x> unite#do_action('split')
	imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
	imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
endfunction

