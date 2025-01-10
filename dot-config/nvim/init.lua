-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("mini.deps").setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Mini
now(function() add("echasnovski/mini.nvim") end)
now(function()
  require("mini.basics").setup({
    options = {
      extra_ui = true,
    },
    mappings = {
      basic = true,
      windows = true,
    },
    autocommands = {
      basic = true,
      relnum_in_visual_mode = true,
    },
  })
  vim.opt.title = true
  vim.opt.titlestring = "%f [nvim]"
  vim.cmd([[colorscheme snooc]])

  require("mini.notify").setup()
  vim.notify = require("mini.notify").make_notify()

  require("mini.icons").setup()
  require("mini.tabline").setup()
  require("mini.statusline").setup()
end)
later(function()
  require("mini.pick").setup()
  require("mini.extra").setup()
  require("mini.git").setup()
  require("mini.files").setup()
  require("mini.indentscope").setup()

  vim.keymap.set("n", "-", function()
    local mf = require("mini.files")
    if not mf.close() then mf.open() end
  end)
end)

later(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    hooks = {
      post_checkout = function() vim.cmd("TSUpdate") end,
    },
  })
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "go",
      "javascript",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "typescript",
      "yaml",
    },
    highlight = {
      enable = true,
    },
  })
end)

-- Completion, LSP, Conform
later(function()
  -- Mason - Package manager for LSP, Linters, Formaters, etc
  add({ source = "williamboman/mason.nvim" })
  require("mason").setup({
    ui = {
      border = "single",
    },
  })
end)

later(function()
  add({ source = "stevearc/conform.nvim" })
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofmt", "goimports" },
    },
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
      return { timeout_ms = 1500, lsp_fallback = true }
    end,
  })
end)

later(function()
  -- Blink - Completion
  add({
    source = "saghen/blink.cmp",
    depends = {
      "rafamadriz/friendly-snippets",
    },
    checkout = "v0.9.2",
  })
  require("blink.cmp").setup({
    keymap = {
      preset = "super-tab",
    },
  })
end)

later(function()
  add({
    source = "neovim/nvim-lspconfig",
    depends = { "saghen/blink.cmp" },
  })

  local servers = {
    gopls = {},
  }

  local lspconfig = require("lspconfig")
  for server, config in pairs(servers) do
    config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
    lspconfig[server].setup(config)
  end
end)
