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
	"sainnhe/gruvbox-material",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
     vim.g.gruvbox_material_background = "hard"
     vim.g.gruvbox_material_better_performance = 1
     vim.g.gruvbox_material_transparent_background = 2 -- 0, 1 (only background), 2 (background and status line, etc.)
     vim.cmd([[colorscheme gruvbox-material]])
	end,

}
