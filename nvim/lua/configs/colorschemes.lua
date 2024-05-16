
--[[---------------------------------------]]--
--       colorscheme - nord colorscheme      --
--               Author: elai                --
--              License: GPLv3               --
--[[---------------------------------------]]--

-- Nord colorscheme options
vim.g.nord_contrast = true
vim.g.nord_disable_background = true
vim.g.nord_cursorline_transparent = false
vim.g.nord_borders = false
vim.g.nord_italic = false



require('poimandres').setup {
  bold_vert_split = false, -- use bold vertical separators
  dim_nc_background = true, -- dim 'non-current' window backgrounds
  disable_background = true, -- disable background
  disable_float_background = true, -- disable background for floats
  disable_italics = false, -- disable italics
}

local night_owl = require("night-owl")

-- 👇 Add your own personal settings here
--@param options Config|nil
night_owl.setup({
    -- These are the default settings
    bold = true,
    italics = true,
    underline = true,
    undercurl = true,
    transparent_background = false,
})
require("hybrid").setup({
    terminal_colors = true,
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        folds = true,
    },
    strikethrough = true,
    inverse = true,
    transparent = false,
    overrides = function(highlights, colors) end,
})

-- Load nord colorscheme with A protected call
local colorscheme = "hybrid"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
