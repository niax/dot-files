call plug#begin(stdpath('data') . '/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/completion-nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'itchyny/lightline.vim'

call plug#end()

" File options
if has("autocmd")
 filetype plugin on
 filetype indent on
endif "has("autocmd")

set backupdir=~/.vim-backups
set dir=~/.vim-swap

" Default stops
set backspace=indent,eol,start "Backspace indent, over line breaks and outside of insert
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set smartcase "Case insensitve matching
set ruler "Always show status bar
set laststatus=2 " (also) always show the status bar
set history=1000

" Enable the mouse
set mouse=a

set number
set nohlsearch " don't keep highlighting last search
syntax enable
set background=dark
set t_Co=256

" Solarized Colorscheme Config
let g:solarized_termtrans=0    "default value is 0
let g:solarized_termcolors=256   "default value is 16
let g:solarized_contrast="high"    "default value is normal
let g:solarized_visibility="high"    "default value is normal
let g:solarized_hitrail=0    "default value is 0
colorscheme solarized

" Telescope Configs
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <space>/ <cmd>Telescope live_grep<cr>
nnoremap <space>b <cmd>Telescope buffers<cr>

" lightline Configs
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" LSP configs
lua << EOF
local lspconfig = require('lspconfig')

local custom_lsp_attach = function(client)
	-- See `:help nvim_buf_set_keymap()` for more information
	vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
	vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
	-- ... and other keymappings for LSP

	-- Use LSP as the handler for omnifunc.
	--    See `:help omnifunc` and `:help ins-completion` for more information.
	vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Hook up completion
	require('completion').on_attach()
end


lspconfig.clangd.setup {
	on_attach=custom_lsp_attach,
}

lspconfig.vimls.setup {
	on_attach=custom_lsp_attach,
}
EOF

" Completion Configs
let g:completion_enable_auto_popup = 0
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" File specifics
" Git commit messages
autocmd FileType gitcommit setlocal spell

" Python
autocmd FileType python setlocal tabstop=4|setlocal shiftwidth=4|setlocal softtabstop=4
autocmd FileType python setlocal expandtab 
autocmd FileType python setlocal smarttab

" TeX
autocmd FileType tex setlocal spell
autocmd FileType tex setlocal spl=en_gb
