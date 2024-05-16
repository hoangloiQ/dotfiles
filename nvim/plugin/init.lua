-- require("autoclose").setup()
require('nvim-autopairs').setup()
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- neodev
require("neodev").setup()
-- empty setup using defaults
require("nvim-tree").setup()

require("mason").setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- delay update diagnostics
    update_in_insert = true,
  }
)
-- Minimal config
require("themery").setup({
  themes = { "oxocarbon", "night-owl", "poimandres", "tender", "nord", "midnight","hybrid" },  -- Your list of installed colorschemes
  -- themeConfigFile = "~/.config/nvim/lua/configs/colorschemes.lua", -- Described below
  livePreview = true,                                                                 -- Apply theme while browsing. Default to true.
})


-- vim.opt.termguicolors = true
require("bufferline").setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
}


require("dapui").setup()
