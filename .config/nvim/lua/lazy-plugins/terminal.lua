local terminals = {}
local toggle_terminal = function(name, cmd)
  local Terminal = require("toggleterm.terminal").Terminal

  if terminals[name] == nil then
    terminals.insert(
      name,
      Terminal:new({
        cmd = cmd,
        hidden = true,
        direction = "float",
        float_opts = {
          border = "double",
        },
      })
    )
  end

  terminals[name]:toggle()
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
        function() toggle_terminal("lazydocker", "lazydocker") end,
        desc = "Toggle lazydocker in Terminal",
      },
      {
        "<leader>\\g",
        function() toggle_terminal("lazygit", "lazygit") end,
        desc = "Toggle lazydocker in Terminal",
      },
      {
        "<leader>\\k",
        function() toggle_terminal("k9s", "k9s") end,
        desc = "Toggle lazydocker in Terminal",
      },
    },
  },
}
