return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(opts)
      -- vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(opts)
      -- vim.cmd([[colorscheme kanagawa]])
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
    },
    config = function(opts)
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
