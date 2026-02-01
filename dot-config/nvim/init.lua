-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

local MiniDeps = require("mini.deps")
MiniDeps.setup({ path = { package = path_package } })

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  add({ source = "scottmckendry/cyberdream.nvim" })
  add({ source = "catppuccin/nvim", name = "catppuccin" })
  add({ source = "stevearc/oil.nvim" })
  add({ source = "neovim/nvim-lspconfig" })
  add({ source = "lewis6991/gitsigns.nvim" })
end)

now(function()
  vim.opt.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣',
    extends = '…',
  }
end)

now(function()
  require("cyberdream").setup({
    variant = "auto",
    transparent = true,
  })
  require("catppuccin").setup({
    background = {
      light = "latte",
      dark = "frappe",
    },
    transparent_background = true,
  })
  require("mini.icons").setup({})
  require("gitsigns").setup({})
  require("mini.basics").setup({
    options = {
      extra_ui = true,
    },
  })
  require("mini.notify").setup({})
  require("mini.git").setup({})
  require("mini.diff").setup({})
  require("mini.statusline").setup({})
  require("mini.tabline").setup({})
  require("mini.indentscope").setup({})

  local miniclue = require("mini.clue")
  miniclue.setup({
    triggers = {
      -- Leader triggers
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },

      -- Built-in completion
      { mode = 'i', keys = '<C-x>' },

      -- `g` key
      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },

      -- Marks
      { mode = 'n', keys = "'" },
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },

      -- Registers
      { mode = 'n', keys = '"' },
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },

      -- Window commands
      { mode = 'n', keys = '<C-w>' },

      -- `z` key
      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },
    },

    clues = {
      -- Enhance this by adding descriptions for <Leader> mapping groups
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows(),
      miniclue.gen_clues.z(),
    },
  })

  vim.cmd([[colorscheme cyberdream]])
  -- vim.cmd([[colorscheme catppuccin]])
end)

later(function()
  require("oil").setup({
    default_file_explorer = true,
  })
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

  local MiniExtra = require("mini.extra")
  MiniExtra.setup({})

  local MiniPick = require("mini.pick")
  local win_config = function()
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)
    return {
      anchor = 'NW',
      height = height,
      width = width,
      row = math.floor(0.5 * (vim.o.lines - height)),
      col = math.floor(0.5 * (vim.o.columns - width)),
    }
  end
  MiniPick.setup({
    window = {
      config = win_config
    },
  })

  vim.keymap.set("n", "<leader><space>", function() MiniPick.builtin.files({}) end, { desc = "Fuzzy Find Files" })
  vim.keymap.set("n", "<leader>/", function() MiniPick.builtin.grep_live({}) end, { desc = "Grep Files" })
  vim.keymap.set("n", "<leader>e", function() MiniExtra.pickers.explorer({}) end, { desc = "File Explorer" })
  vim.keymap.set("n", "<leader>d", function() MiniExtra.pickers.diagnostic({}) end, { desc = "Diagnostics" })

  local MiniMap = require("mini.map")
  require("mini.map").setup({
    integrations = {
      MiniMap.gen_integration.builtin_search(),
      MiniMap.gen_integration.diff(),
      MiniMap.gen_integration.diagnostic(),
    }
  })
  vim.keymap.set("n", "<Leader>mc", function() MiniMap.close() end, { desc = "Close minimap" })
  vim.keymap.set("n", "<Leader>mf", function() MiniMap.toggle_focus() end, { desc = "Toggle focus for minimap" })
  vim.keymap.set("n", "<Leader>mo", function() MiniMap.open() end, { desc = "Open minimap" })
  vim.keymap.set("n", "<Leader>mr", function() MiniMap.refresh() end, { desc = "Refresh minimap" })
  vim.keymap.set("n", "<Leader>ms", function() MiniMap.toggle_side() end, { desc = "Toggle minimap side (left / right)" })
  vim.keymap.set("n", "<Leader>mt", function() MiniMap.toggle() end, { desc = "Toggle minimap" })
end)

later(function()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
      local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
      if client:supports_method("textDocument/implementation") then
        -- Create a keymap for vim.lsp.buf.implementation ...
      end
      -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
      if client:supports_method("textDocument/completion") then
        -- Optional: trigger autocompletion on EVERY keypress. May be slow!
        local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
        client.server_capabilities.completionProvider.triggerCharacters = chars
        vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      end

      -- Auto-format ("lint") on save.
      -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
      if not client:supports_method("textDocument/willSaveWaitUntil")
          and client:supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
          end,
        })
      end
    end,
  })

  vim.lsp.config('lua_ls', {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
            path ~= vim.fn.stdpath('config')
            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
        then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          -- Tell the language server which version of Lua you're using (most
          -- likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Tell the language server how to find Lua modules same way as Neovim
          -- (see `:h lua-module-load`)
          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
            -- Depending on the usage, you might want to add additional paths
            -- here.
            '${3rd}/luv/library',
            '${3rd}/busted/library'
          }
          -- Or pull in all of 'runtimepath'.
          -- NOTE: this is a lot slower and will cause issues when working on
          -- your own configuration.
          -- See https://github.com/neovim/nvim-lspconfig/issues/3189
          -- library = {
          --   vim.api.nvim_get_runtime_file('', true),
          -- }
        }
      })
    end,
    settings = {
      Lua = {
        format = {
          enable = true,
          defaultConfig = { indent_style = "space", indent_size = "2" },
        }
      }
    }
  })

  vim.lsp.enable("lua_ls")
  vim.lsp.enable("gopls")
end)
