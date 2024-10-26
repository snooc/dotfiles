local lspconfig = require("lspconfig")
local cmp_lsp_default_capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
lspconfig.lua_ls.setup({
  capabilities = cmp_lsp_default_capabilities,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then return end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths here.
          "${3rd}/luv/library",
          "${3rd}/busted/library",
        },
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

-- Go
lspconfig.gopls.setup({
  capabilities = cmp_lsp_default_capabilities,
})

-- Python
lspconfig.pyright.setup({
  capabilities = cmp_lsp_default_capabilities,
})

-- Markdown
lspconfig.marksman.setup({
  capabilities = cmp_lsp_default_capabilities,
})

-- Helm LS
lspconfig.helm_ls.setup({
  capabilities = cmp_lsp_default_capabilities,
  settings = {
    ["helm-ls"] = {
      yamlls = {
        enabled = false,
      },
    },
  },
})

-- Typescript / Javascript
lspconfig.ts_ls.setup({
  capabilities = cmp_lsp_default_capabilities,
})

-- YAML
-- lspconfig.yamlls.setup({
--   capabilities = cmp_lsp_default_capabilities,
-- })
