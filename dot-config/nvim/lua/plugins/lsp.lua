return {
  {
    "TheRealLorenz/nvim-lspconfig",
    lazy = false,
    config = function()
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("gopls")
      vim.lsp.enable("helm_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("terraformls")
      vim.lsp.enable("yamlls")
    end,
  }
}
