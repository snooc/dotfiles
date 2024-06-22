-- Leader key =================================================================
vim.g.mapleader = " "

-- General ====================================================================
vim.opt.backup = false -- Don"t store backup
vim.opt.mouse = "a" -- Enable mouse
-- vim.opt.mousescroll  = "ver:25,hor:6" -- Customize mouse scroll
vim.opt.switchbuf = "usetab" -- Use already opened buffers when switching
vim.opt.writebackup = false -- Don"t store backup
vim.opt.undofile = true -- Enable persistent undo

vim.opt.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit what is stored in ShaDa file

vim.cmd("filetype plugin indent on") -- Enable all filetype plugins

-- UI =========================================================================
vim.opt.breakindent = true -- Indent wrapped lines to match line start
vim.opt.colorcolumn = "+1" -- Draw colored column one step to the right of desired maximum width
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.laststatus = 2 -- Always show statusline
vim.opt.linebreak = true -- Wrap long lines at "breakat" (if "wrap" is set)
vim.opt.list = true -- Show helpful character indicators
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.pumblend = 10 -- Make builtin completion menus slightly transparent
vim.opt.pumheight = 10 -- Make popup menu smaller
vim.opt.ruler = false -- Don"t show cursor position
vim.opt.shortmess = "aoOWFcS" -- Disable certain messages from |ins-completion-menu|
vim.opt.showmode = false -- Don"t show mode in command line
vim.opt.showtabline = 2 -- Always show tabline
vim.opt.signcolumn = "yes" -- Always show signcolumn or it would frequently shift
vim.opt.splitbelow = true -- Horizontal splits will be below
vim.opt.splitright = true -- Vertical splits will be to the right
vim.opt.termguicolors = true -- Enable gui colors
vim.opt.winblend = 10 -- Make floating windows slightly transparent
vim.opt.wrap = false -- Display long lines as just one line

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
--vim.opt.listchars = table.concat({ "extends:…", "nbsp:␣", "precedes:…", "tab:> " }, ",")
vim.opt.cursorlineopt = "screenline,number" -- Show cursor line only screen line when wrapped

-- Colors =====================================================================
-- Enable syntax highlighting if it wasn"t already (as it is time consuming)
-- Don"t use defer it because it affects start screen appearance
if vim.fn.exists("syntax_on") ~= 1 then vim.cmd("syntax enable") end

-- Editing ====================================================================
vim.opt.autoindent = true -- Use auto indent
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.formatoptions = "rqnl1j" -- Improve comment editing
vim.opt.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
vim.opt.incsearch = true -- Show search results while typing
vim.opt.infercase = true -- Infer letter cases for a richer built-in keyword completion
vim.opt.shiftwidth = 2 -- Use this number of spaces for indentation
vim.opt.smartcase = true -- Don"t ignore case when searching if pattern has upper case
vim.opt.smartindent = true -- Make indenting smart
vim.opt.tabstop = 4 -- Insert 2 spaces for a tab
vim.opt.virtualedit = "block" -- Allow going past the end of line in visual block mode

vim.opt.iskeyword:append("-") -- Treat dash separated words as a word text object

-- Define pattern for a start of "numbered" list. This is responsible for
-- correct formatting of lists when using `gw`. This basically reads as "at
-- least one special character (digit, -, +, *) possibly followed some
-- punctuation (. or `)`) followed by at least one space is a start of list
-- item"
vim.opt.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Spelling ===================================================================
vim.opt.spelllang = "en,ru,uk" -- Define spelling dictionaries
vim.opt.spelloptions = "camel" -- Treat parts of camelCase words as separate words
vim.opt.complete:append("kspell") -- Add spellcheck options for autocomplete
vim.opt.complete:remove("t") -- Don"t use tags for completion

vim.opt.dictionary = vim.fn.stdpath("config") .. "/misc/dict/english.txt" -- Use specific dictionaries

-- Folds ======================================================================
vim.opt.foldmethod = "indent" -- Set "indent" folding method
vim.opt.foldlevel = 999 -- Display all folds except top ones
vim.opt.foldnestmax = 10 -- Create folds only for some number of nested levels
vim.g.markdown_folding = 1 -- Use folding by heading in markdown files

if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.foldtext = "" -- Use underlying text with its highlighting
end

-- Custom autocommands ========================================================
local augroup = vim.api.nvim_create_augroup("CustomSettings", {})
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function()
    -- Don"t auto-wrap comments and don"t insert comment leader after hitting "o"
    -- If don"t do this on `FileType`, this keeps reappearing due to being set in
    -- filetype plugins.
    vim.cmd("setlocal formatoptions-=c formatoptions-=o")
  end,
  desc = [[Ensure proper "formatoptions"]],
})
