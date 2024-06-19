return {
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-lua/plenary.nvim" },
  { "MunifTanjim/nui.nvim" },

  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      enabled = false,
      disabled_filetypes = {
        "NvimTree",
        "lazy",
        "mason",
        "netrw",
        "oil",
        "qf",
      },
      disabled_keys = {},
    },
  },
}
