return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.o.background = "dark"
    vim.cmd[[colorscheme tokyonight-storm]]
  end,
}
