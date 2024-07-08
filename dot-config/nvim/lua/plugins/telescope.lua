return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        hidden = true,

        -- borderchars = { " ", " ", "", " ", " ", " ", " ", " " },
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",

        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",

        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
    },
    keys = {
      { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch Buffers" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
      { "<leader>fh", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
    },
  },
}
