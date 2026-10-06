local Plug = vim.fn['plug#']

vim.call('plug#begin')
	Plug('folke/tokyonight.nvim')
	Plug('preservim/nerdtree')
	Plug('windwp/nvim-autopairs')
	Plug('nvim-treesitter/nvim-treesitter')
	Plug('vim-airline/vim-airline')
vim.call('plug#end')

vim.lsp.config['lua-server'] = {

    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
	root_dir = vim.fs.dirname(vim.fs.find({'.git', '.vim', 'nvim'}, { upward = true })[1]),
    settings = { Lua = { diagnostics = { globals = {'vim', 'hl'} } } },
}

vim.lsp.config['typst-server'] = {

	cmd = { 'tinymist' },
	filetypes = { 'typst' },
	root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true})[1]),
}

vim.lsp.config['c-cpp-server'] = {

	cmd = { 'clangd' },
	filetypes = { 'c', 'cpp' },
	root_dir = vim.fs.dirname(vim.fs.find({'.git'}, { upward = true})[1]),
}

vim.lsp.enable('lua-server')
vim.lsp.enable('typst-server')
vim.lsp.enable('c-cpp-server')
vim.lsp.codelens.enable()

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = false})
	end
})

vim.opt.completeopt = {
	"menu",
	"menuone",
	"noselect",
}

vim.keymap.set('i', '<c-space>', function()
	vim.lsp.completion.get()
end, { expr = true, desc = 'Accept the current inline completion' })

require("nvim-autopairs").setup {}

vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>', { desc = "Toggle NERDTree" })

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true

vim.cmd.colorscheme "tokyonight-night"

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'typst',
	callback = function()
		vim.opt.backupcopy = "yes"
	end,
})
