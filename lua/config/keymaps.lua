local g = vim.g
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
g.mapleader = ' '
g.maplocalleader = ' '

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Allow moving the cursor through wrapped lines with j, k
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- save file without auto-formatting
map('n', '<leader>sn', '<cmd>noautocmd w<CR>', opts)

-- delete single character without copying into register
map('n', 'x', '"_x', opts)

-- vertical scroll and center
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Resize with arrows
map('n', '<Up>', ':resize -2<CR>', opts)
map('n', '<Down>', ':resize +2<CR>', opts)
map('n', '<Left>', ':vertical resize -2<CR>', opts)
map('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
map('n', '<Tab>', ':bnext<CR>', opts)
map('n', '<S-Tab>', ':bprevious<CR>', opts)
map('n', '<leader>x', ':Bdelete!<CR>', opts) -- close buffer
map('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Increment/decrement numbers
map('n', '<leader>+', '<C-a>', opts) -- increment
map('n', '<leader>-', '<C-x>', opts) -- decrement

-- Window management
map('n', '<leader>v', '<C-w>v', opts) -- split window vertically
map('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
map('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
map('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Tabs
map('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
map('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
map('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
map('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab
map('n', 'H', 'gT', opts)
map('n', 'L', 'gt', opts)

-- Toggle line wrapping
map('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Move text up and down
map('v', '<A-j>', ':m .+1<CR>==', opts)
map('v', '<A-k>', ':m .-2<CR>==', opts)

-- Keep last yanked when pasting
map('v', 'p', '"_dP', opts)

-- Replace word under cursor
map('n', '<leader>j', '*``cgn', opts)

-- Toggle diagnostics
local diagnostics_active = true

map('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable(true)
  end
end)

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Save and load session
map('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
map('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false })
