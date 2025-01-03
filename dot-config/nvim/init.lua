-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { 'git', 'clone', '--filter=blob:none', 'https://github.com/echasnovski/mini.nvim', mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Plugins
now(function() require('mini.basics').setup({
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
  }
}) end)
now(function()
  vim.cmd([[colorscheme snooc]])
end)
now(function()
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify()
end)
now(function() require('mini.icons').setup() end)
now(function() require('mini.tabline').setup() end)
now(function() require('mini.statusline').setup() end)

later(function() require("mini.pick").setup() end)
later(function() require("mini.extra").setup() end)
later(function() require("mini.git").setup() end)
later(function()
  mf = require('mini.files')
  mf.setup()
  vim.keymap.set('n', '-', function() mf.open() end)
end)
