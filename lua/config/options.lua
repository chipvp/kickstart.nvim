local g = vim.g
local o = vim.o
local opt = vim.opt

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- [[ General Settings ]]
g.have_nerd_font = true -- Set to true if you have a Nerd Font installed and selected in the terminal
o.number = true -- Make line numbers default
o.relativenumber = true -- Make relative line numbers default
o.showmode = false -- Don't show the mode, since it's already in the status line
o.tabstop = 2 -- an indentation every two columns
o.shiftwidth = 2 -- shift lines by 2 spaces
o.smarttab = true -- helps with backspaces because of expandtab
o.expandtab = true -- tabs are spaces, not tabs
o.softtabstop = 2 -- let backspace delete indent
o.backspace = 'indent,eol,start'
o.breakindent = true -- Enable break indent
o.updatetime = 250 -- Decrease update time
o.timeoutlen = 300 -- Decrease mapped sequence wait time
o.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
o.undofile = true -- Save undo history
o.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example!

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
  --  Schedule the setting after `UiEnter` because it can increase startup-time.
end)

-- [[ Search ]]
o.ignorecase = true -- Case-insensitive searching
o.smartcase = true --  UNLESS \C or one or more capital letters in the search term
o.inccommand = 'split' -- Preview substitutions live, as you type!

-- [[ Splits ]]
-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true

-- [[ UI ]]
o.cursorline = true -- Show which line your cursor is on
o.signcolumn = 'yes' -- Keep signcolumn on by default

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
o.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
------------------------

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
o.confirm = true
