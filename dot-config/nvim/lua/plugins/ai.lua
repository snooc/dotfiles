return {
  {
    "robitx/gp.nvim",
    event = "VeryLazy",
    opts = {
      providers = {
        copilot = {
          secret = {
            "bash",
            "-c",
            "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
          },
        },
      },
      agents = {},
    },
    keys = {
      { "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat" },
      { "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
      { "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
      { "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", desc = "Visual Chat New", mode = "v" },
      { "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Visual Chat Paste", mode = "v" },
      { "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", desc = "Visual Toggle Chat", mode = "v" },

      { "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split", mode = { "n", "i" } },
      { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit", mode = { "n", "i" } },
      { "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew", mode = { "n", "i" } },

      { "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>", desc = "Visual Chat New split", mode = "v" },
      { "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "Visual Chat New vsplit", mode = "v" },
      { "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", desc = "Visual Chat New tabnew", mode = "v" },

      { "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite", mode = { "n", "i" } },
      { "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)", mode = { "n", "i" } },
      { "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)", mode = { "n", "i" } },

      { "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite", mode = "v" },
      { "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", desc = "Visual Append (after)", mode = "v" },
      { "<C-g>b", ":<C-u>'<,'>GpPrepend<cr>", desc = "Visual Prepend (before)", mode = "v" },
      { "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection", mode = "v" },

      { "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup", mode = { "n", "i" } },
      { "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew", mode = { "n", "i" } },
      { "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew", mode = { "n", "i" } },
      { "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew", mode = { "n", "i" } },
      { "<C-g>gt", "<cmd>GpTabnew<cr>", desc = "GpTabnew", mode = { "n", "i" } },

      { "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup", mode = "v" },
      { "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew", mode = "v" },
      { "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew", mode = "v" },
      { "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew", mode = "v" },
      { "<C-g>gt", ":<C-u>'<,'>GpTabnew<cr>", desc = "Visual GpTabnew", mode = "v" },

      { "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle Context", mode = { "n", "i" } },
      { "<C-g>x", ":<C-u>'<,'>GpContext<cr>", desc = "Visual Toggle Context", mode = "v" },

      { "<C-g>s", "<cmd>GpStop<cr>", desc = "Stop", mode = { "n", "i", "v", "x" } },
      { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent", mode = { "n", "i", "v", "x" } },
    },
  },
}
