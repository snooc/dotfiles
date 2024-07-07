local M = {}

M.terminals = {}

M.toggle_terminal = function(name, cmd)
  local Terminal = require("toggleterm.terminal").Terminal

  if M.terminals[name] == nil then
    M.terminals[name] = Terminal:new({
      cmd = cmd,
      hidden = true,
      direction = "float",
      float_opts = {
        border = "none",
        winblend = 5,
      },
      highlights = {
        NormalFloat = { link = "NormalFloat" },
      },
    })
  end

  M.terminals[name]:toggle()
end

return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    keys = {
      { "<leader>\\", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      {
        "<leader>\\d",
        function() M.toggle_terminal("lazydocker", "lazydocker") end,
        desc = "Toggle lazydocker in Terminal",
      },
      {
        "<leader>\\g",
        function() M.toggle_terminal("lazygit", "lazygit") end,
        desc = "Toggle lazydocker in Terminal",
      },
      {
        "<leader>\\k",
        function() M.toggle_terminal("k9s", "k9s") end,
        desc = "Toggle lazydocker in Terminal",
      },
    },
  },
}
