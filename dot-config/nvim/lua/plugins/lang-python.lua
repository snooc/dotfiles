local python_path = nil

local function find_python()
  if python_path ~= nil then return python_path end

  local p
  if vim.env.VIRTUAL_ENV then
    p = vim.fs.joinpath(vim.env.VIRTUAL_ENV, "bin", "python3")
  else
    local env_info = nil

    local poetry_root = vim.fs.root(0, { "poetry.lock" })
    if poetry_root then
      local poetry_output = vim.fn.system({ "poetry", "env", "info", "--path", "-C", poetry_root })
      for line in poetry_output:gmatch("[^\r\n]+") do
        local stat = vim.loop.fs_stat(line)
        if stat and stat.type == "directory" then
          env_info = line
          break
        end
      end
    end

    if env_info ~= nil then
      p = vim.fs.joinpath(env_info:gsub("\n", ""), "bin", "python3")
    else
      local venv_dir = vim.fs.find(".venv", {
        upward = true,
        type = "directory",
        path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
      })

      if #venv_dir > 0 then
        p = vim.fs.joinpath(venv_dir[1], "bin", "python3")
      else
        p = "python3"
      end
    end
  end

  python_path = p

  return p
end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { { "isort", "black" } },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          before_init = function(_, config) config.settings.python.pythonPath = find_python() end,
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },
}
