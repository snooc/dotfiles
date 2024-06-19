return {
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      high_visibility = {
        darker = true,
      },
      plugins = {
        "gitsigns",
        "nvim-cmp",
        "nvim-notify",
        "nvim-web-devicons",
        "telescope",
        "trouble",
      },
    },
    config = function(_, opts)
      require("material").setup(opts)
      vim.g.material_style = "palenight"
      -- vim.cmd([[colorscheme material]])
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        notify = true,
        bufferline = true,
        mason = true,
        markdown = true,
        neotree = true,
        telescope = { enabled = true },
        which_key = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd([[colorscheme catppuccin]])
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {
      theme = "auto",
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          { "diagnostics" },
          { "filetype", icon_only = false, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        },

        lualine_x = {
          { "diff", symbols = { added = " ", modified = " ", removed = " " } },
        },
        lualine_y = {
          { "copilot" },
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          "mode",
        },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
          },
        },
      },
    },
  },

  {
    "stevearc/oil.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      float = {
        padding = 8,
        max_width = 80,
        max_height = 80,
      },
      view_options = {
        show_hidden = false,
        is_hidden_file = function(name, _) return require("util").is_hidden_file(name) end,
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Oil" },
    },
    lazy = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {},
    keys = {
      { "<leader>t", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>,", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch Buffers" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
