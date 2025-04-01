return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(opts)
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
