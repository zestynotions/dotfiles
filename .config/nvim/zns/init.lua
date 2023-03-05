vim.opt.number = true
vim.cmd([[packadd packer.nvim]])
require("packer").startup(function()
  use("wbthomason/packer.nvim")
  use("morhetz/gruvbox")
  vim.cmd([[colorscheme gruvbox]])
  use("nvim-treesitter/nvim-treesitter")
  require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "bash","go", "lua", "rust" },
    highlight = {
      enable = false,
    },
  })
  use("nvim-lualine/lualine.nvim")
  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = "ayu_dark",
    },
  })
  use("junegunn/fzf")
  use("junegunn/fzf.vim")
  use("folke/tokyonight.nvim")
  use("lunarvim/darkplus.nvim")
end)

local colorscheme = "tokyonight"

-- darkplus
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

vim.opt.list = true
vim.opt.listchars:append("tab:> ")
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.g.mapleader = " "
vim.opt.sidescrolloff = 8
vim.opt.fillchars.eob=" "
vim.opt.relativenumber = true

-- Open recently used files
vim.api.nvim_set_keymap("n", "<leader>fr", ":History<CR>", { noremap = true })

-- Open files in same directory as current file
vim.api.nvim_set_keymap("n", "<leader>ff", ":e %:h/<C-d>", { noremap = true })
