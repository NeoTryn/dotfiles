call plug#begin()

	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"Plug 'eldritch-theme/eldritch.nvim'
	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'maxmx03/fluoromachine.nvim'
	Plug 'catppuccin/nvim'

call plug#end()

lua << EOF
require'nvim-treesitter.configs'.setup {
	
	ensure_installed = { "vim", "vimdoc", "c", "cpp", "java", "html", "javascript", "css", "vue" },

	sync_install = false,

	auto_install = true,

	highlight = {
	enable = true,
	},
}

EOF

syntax on
filetype on
set relativenumber

colorscheme catppuccin-macchiato

set tabstop=4
set shiftwidth=4

nnoremap <A-t> :NERDTreeToggle <CR>
nnoremap <A-f> :NERDTreeFocus <CR>

nnoremap <C-i> :PlugInstall <CR>
nnoremap <C-u> :PlugUpdate <CR>
nnoremap <C-c> :PlugClean <CR>

"if &filetype ==# 'vim'
	inoremap { {}<left>
	inoremap ( ()<left>
	inoremap [ []<left>
"endif

inoremap " ""<left>
inoremap ' ''<left>

" keybind to echo filetype
" nnoremap <C-e> :echo type(&filetype) <CR>

inoremap <silent><expr> <A-a> coc#pum#visible() ? coc#pum#confirm() : "\<A-u>\<C-r>=coc#on_enter()"
