return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      borderless_telescope = false,
      terminal_colors = true,
      theme = {
        variant = "auto",
      },
    },
    config = function(_, opts)
      require("cyberdream").setup(opts)

      vim.cmd([[colorscheme cyberdream]])
    end,
  },
}
