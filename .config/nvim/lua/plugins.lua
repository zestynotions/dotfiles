return require('packer').startup(function()
use 'wbthomason/packer.nvim'

  -- common
use 'tpope/vim-fugitive' -- Git commands
use 'neovim/nvim-lspconfig'
use 'kyazdani42/nvim-web-devicons' -- icons when searching
use 'kabouzeid/nvim-lspinstall'
use 'glepnir/lspsaga.nvim'
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
use { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}, config = function() require'nvim-tree'.setup {} end }

use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

require'lspsaga'.init_lsp_saga {
    error_sign = '!',
    warn_sign = '^',
    hint_sign = '?',
    infor_sign = '~',
    border_style = "round",
    code_action_prompt = {
    enable = false
    }
  }


  -- search
use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }



use { 'folke/which-key.nvim', config = function()
	require('which-key').setup {
    }
  end
}

use 'junegunn/goyo.vim'
use 'junegunn/limelight.vim'
use 'jiangmiao/auto-pairs'
use 'voldikss/vim-floaterm'
use 'dracula/vim'

end)
