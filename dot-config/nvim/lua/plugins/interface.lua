return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      borderless_telescope = true,
      terminal_colors = true,
      theme = {
        overrides = function(t)
          return {
            NormalFloat = { bg = t.bgAlt },
          }
        end,
      },
    },
    config = function(_, opts)
      require("cyberdream").setup(opts)

      vim.cmd([[colorscheme cyberdream]])
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {
      options = {
        theme = "auto",
        component_separators = { left = " ", right = " " },
        section_separators = { left = " ", right = " " },
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰝶 ",
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
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
      extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
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
        is_hidden_file = function(name, _) return require("core.utils").is_hidden_file(name) end,
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

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
  },
}
