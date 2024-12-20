return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function(_, opts) require("fzf-lua").setup(opts) end,
    keys = {
      { "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Find Files" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Switch Buffers" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
      { "<leader>fh", "<cmd>FzfLua highlights<cr>", desc = "Highlights" },
    },
  },
}
