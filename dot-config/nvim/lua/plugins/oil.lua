return {
  {
    "stevearc/oil.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      view_options = {
        show_hidden = false,
        is_hidden_file = function(name, _) return require("core.utils").is_hidden_file(name) end,
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Oil" },
    },
    lazy = false,
  },
}
