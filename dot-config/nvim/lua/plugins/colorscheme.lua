return {
  --  {
  --    "folke/tokyonight.nvim",
  --    lazy = false,
  --    priority = 1000,
  --    opts = {},
  --    config = function(_, opts)
  --      require("tokyonight").setup(opts)
  --
  --      vim.cmd([[colorscheme tokyonight-moon]])
  --    end,
  --  },
  --
  --  {
  --    "scottmckendry/cyberdream.nvim",
  --    lazy = false,
  --    priority = 1000,
  --    opts = {
  --      transparent = true,
  --      italic_comments = true,
  --      borderless_telescope = false,
  --      terminal_colors = true,
  --      theme = {
  --        variant = "auto",
  --      },
  --    },
  --    config = function(_, opts)
  --      require("cyberdream").setup(opts)
  --
  --      vim.cmd([[colorscheme cyberdream]])
  --    end,
  --  },

  --   {
  --     "Mofiqul/vscode.nvim",
  --     lazy = false,
  --     priority = 1000,
  --     opts = {},
  --     config = function(_, opts)
  --       require("vscode").setup(opts)
  --
  --       -- vim.cmd([[colorscheme vscode]])
  --     end,
  --   },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.cmd([[colorscheme rose-pine]])
    end,
  },
}
