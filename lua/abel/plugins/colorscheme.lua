return {
  -- "folke/tokyonight.nvim",
  -- priority = 1000,
  -- config = function()
  --   require("tokyonight").setup({
  --     style = "night",
  --     transparent = true,
  --     })
  --   vim.cmd("colorscheme tokyonight")
  -- end,
      -- " There are also colorschemes for the different styles.
      -- colorscheme tokyonight-night
      -- colorscheme tokyonight-storm
      -- colorscheme tokyonight-moon

------------------------------------------O-------------------------------------------------------------------------
	-- "sainnhe/gruvbox-material",
	--  lazy = false, -- make sure we load this during startup if it is your main colorscheme
	--  priority = 1000, -- make sure to load this before all the other start plugins
	--  config = function()
	--     vim.g.gruvbox_material_background = "hard"
	--     vim.g.gruvbox_material_better_performance = 1
	--     vim.g.gruvbox_material_transparent_background = 2 -- 0, 1 (only background), 2 (background and status line, etc.)
	--     vim.cmd([[colorscheme gruvbox-material]])
	-- end,

  ----------------------------------------------O------------------------------------------------------------------
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function ()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true, -- disables setting the background color.
      float = {
          transparent = true, -- enable transparent floating windows
          solid = false, -- use solid styling for floating windows, see |winborder|
      },
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    })
    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin-nvim"
  end
}
