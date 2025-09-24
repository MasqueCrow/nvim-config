-- ===Vim Settings===
local o = vim.opt
local g = vim.g

o.number = true                 -- show line numbers
-- o.relativenumber = true      -- display relative line numbers (commented out as in original)
o.hlsearch = true              -- highlight search
o.expandtab = true             -- convert tabs to space
o.tabstop = 4                  -- indent using four spaces
o.shiftwidth = 4               -- set shiftwidth as four spaces
o.confirm = true               -- display a confirmation dialog when closing an unsaved file
o.history = 1000               -- increase the undo limit
vim.cmd("syntax enable")       -- enable syntax highlighting
o.showcmd = true               -- show typed command at bottom right

o.clipboard = "unnamedplus"   -- synchronize with system clipboard (allow direct copy/paste)

-- Set cursor shape when switching between normal and insert mode
vim.cmd([[
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[2 q"
]])

-- Reset the cursor on start (for older versions of vim)
vim.api.nvim_create_augroup("myCmds", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = "myCmds",
  command = [[silent !echo -ne "\e[2 q"]],
})

-- include lazy nvim
require("config.lazy")
