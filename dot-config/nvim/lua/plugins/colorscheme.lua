return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(opts)
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
