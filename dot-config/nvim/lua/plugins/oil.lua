return {
  {
    "stevearc/oil.nvim",
    dependencies = {
      { "echasnovski/mini.icons", version = "*" },
    },
    opts = {
      win_options = {
        signcolumn = "yes:2",
      },
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

  {
    "refractalize/oil-git-status.nvim",
    dependencies = {
      "stevearc/oil.nvim",
    },
    config = true,
  },
}
