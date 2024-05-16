--[[--------------------------------------]]
--
--     plugins + packer - configuration     --
--     Author: elai, ChristianChiarulli     --
--             License: GPLv3               --
--[[--------------------------------------]]
--

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins
  -- Git integration for buffers
  use {
    'lewis6991/gitsigns.nvim',
    event = { "CursorMoved", "CursorMovedI" },
    config = function()
      require("gitsigns")
    end
  }
  use {
    "williamboman/mason.nvim"
  }

  -- use Color Scheme --
  use { 'nyoom-engineering/oxocarbon.nvim' }
  use "rebelot/kanagawa.nvim"
  use 'olivercederborg/poimandres.nvim'
  use("oxfist/night-owl.nvim")
  use 'zaldih/themery.nvim'
  use { "HoNamDuong/hybrid.nvim" }
  use { 'rafi/neo-hybrid.vim' }
  -- -- -- -- -- -- -- --
  use 'windwp/nvim-autopairs'
  use "wbthomason/packer.nvim"          -- A use-package inspired plugin manager for Neovim
  use "kyazdani42/nvim-web-devicons"    -- Lua fork of vim-web-devicons for neovim
  use "kyazdani42/nvim-tree.lua"        -- A file explorer tree for neovim written in lua
  use "nvim-treesitter/nvim-treesitter" -- Treesitter Syntax highlighting and abstraction layer
  use "nvim-lualine/lualine.nvim"       -- Fast and easy statusline for neovim
  use "shaunsingh/nord.nvim"            -- Neovim theme based off of the Nord Color Palette
  use "goolord/alpha-nvim"              -- Lua powered greeter like vim-startify / dashboard-nvim
  use "akinsho/nvim-toggleterm.lua"     -- Plugin to easily toggle a terminal
  use "terrortylor/nvim-comment"        -- Comment toggler for Neovim written in Lua
  use "norcalli/nvim-colorizer.lua"     -- Colors highlighter for neovim
  use "hrsh7th/nvim-cmp"                -- Completion plugin for neovim coded in Lua
  use "hrsh7th/cmp-buffer"              -- Nvim-cmp source for buffer words
  use "hrsh7th/cmp-path"                -- Nvim-cmp source for path
  use "L3MON4D3/LuaSnip"                -- Snippet Engine for Neovim written in Lua
  use "lewis6991/impatient.nvim"        -- Speed up loading Lua modules to improve startup time
  use "karb94/neoscroll.nvim"           -- Smooth scrolling plugin written in lua
  use 'nvim-telescope/telescope.nvim'   -- Find, filter, preview, pick. all lua, with telescope
  use 'nvim-lua/plenary.nvim'           -- Plenary, a dependency of telescope
  --use 'nvim-tree/nvim-tree.lua'
  use 'jacoborus/tender.vim'
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }
  use {
    'mrcjkb/rustaceanvim',
  }
  use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }
  use { 'dasupradyumna/midnight.nvim' }
  -- Debugging
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
  use 'folke/neodev.nvim'
  use {
    's1n7ax/nvim-search-and-replace',
    config = function() require'nvim-search-and-replace'.setup() end,
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
