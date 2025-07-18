-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Neovim Settings
local opt = vim.opt
opt.autowrite = true  -- Enable auto write
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true    -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true  -- Use spaces instead of tabs
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.linebreak = true                          -- Wrap lines at convenient points
opt.list = true                               -- Show some invisible characters (tabs...
opt.mouse = "a"                               -- Enable mouse mode
opt.number = true                             -- Print line number
opt.relativenumber = true                     -- Relative line numbers
opt.ruler = false                             -- Disable the default ruler
opt.scrolloff = 4                             -- Lines of context
opt.shiftround = true                         -- Round indent
opt.shiftwidth = 2                            -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false                          -- Dont show mode since we have a statusline
opt.sidescrolloff = 8                         -- Columns of context
opt.signcolumn = "yes"                        -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true                          -- Don't ignore case with capitals
opt.smartindent = true                        -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true                         -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true                         -- Put new windows right of current
opt.tabstop = 2                               -- Number of spaces tabs count for
opt.termguicolors = true                      -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200               -- Save swap file and trigger CursorHold
opt.virtualedit = "block"          -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.wrap = false                   -- Disable line wrap

-- Show diagnostic text
vim.diagnostic.config({ virtual_text = true })

-- Quickfix
vim.keymap.set("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })
vim.keymap.set('n', ']q', function()
  local ok, _ = pcall(vim.cmd, 'cnext')
  if not ok then
    vim.cmd('cfirst')
  end
end, { desc = "Next Quick Fix" })

-- Wrap to end when reaching beginning
vim.keymap.set('n', '[q', function()
  local ok, _ = pcall(vim.cmd, 'cprev')
  if not ok then
    vim.cmd('clast')
  end
end, { desc = "Previous Quick Fix" })
