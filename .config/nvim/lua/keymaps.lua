-- [[ Basic Keymaps ]]
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>il", ":Twilight<cr>", { desc = "Toggle Twilight mode" })
vim.keymap.set("n", "<leader>zm", ":ZenMode<cr>", { desc = "Toggle Zen mode" })
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>", { desc = "Markdown Preview" })
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", { desc = "Toggle NvimTree" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- move a blocks of text up/down with K/J in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- search for files in obsidian vault
vim.keymap.set(
	"n",
	"<leader>of",
	':Telescope find_files search_dirs={"/Users/zns/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/zns"}<cr>',
	{ desc = "Search files in the Obsidian vault" }
)
vim.keymap.set(
	"n",
	"<leader>og",
	':Telescope live_grep search_dirs={"/Users/zns/library/Mobile\\ Documents/iCloud~md~obsidian/Documents/zns"}<cr>',
	{ desc = "Grep through obsidian vault" }
)
vim.keymap.set("n", "<leader>lu", ":Lazy update <cr>", { desc = "Update Lazy Plugins" })

-- [[ Basic Autocommands ]]
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
