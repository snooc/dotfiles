return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
        javascript = { "prettierd" },
        python = { { "isort", "black" } },
        ["*"] = { "codespell" },
        ["_"] = { "trim_whitespace" },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {},
        pyright = {},
        helm_ls = {
          settings = {
            ["helm-ls"] = {
              yamlls = {
                enabled = false,
              },
            },
          },
        },
        ts_ls = {},
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "xml",
      },
    },
  },
}
