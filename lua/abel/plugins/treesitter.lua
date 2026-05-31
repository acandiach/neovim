return{
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPre", "BufNewFile" },
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup ({
      highlight = {
        enable = true,
      },
      -- install_dir = vim.fn.stdpath('data') .. '/site',
      indent = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "vimdoc",
        "c",
      },
    })
    -- use bash parser for zsh files
    -- vim.treesitter.language.register("bash", "zsh")
  end,
}
