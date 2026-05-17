vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"




vim.keymap.set('n', '<leader>u', ':lua vim.pack.update()<CR>')
vim.keymap.set('n', '<leader>p', ':LivePreview start<CR>')

-- move line up and down
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/brianhuster/live-preview.nvim" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/Saghen/blink.lib" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})

-- keymap To toggle comment use Visual = "gc" or Normal = "gcc" 



-- LSP 
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.lsp.enable({ "lua_ls", "bash", "php", "css", "html" })
vim.o.pumborder = "rounded"
vim.o.pumheight = 5
vim.opt.complete:append('o')
vim.opt.completeopt = { 'menuone', 'noselect' }
-- vim.cmd("set completeopt+=noselect")
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)


require "mini.pick".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "lua", "markdown", "php", "bash", "css", "html", "typescript", "javascript" },
	highlight = { enable = true }
})


-- file picker
require "oil".setup()
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")


-- Theme and color
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

-- Autocompletion
require('blink.cmp').setup({
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = {
    documentation = { auto_show = false }
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = {
    implementation = "lua"
  }
})

