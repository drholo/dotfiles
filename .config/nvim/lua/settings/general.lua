local set = vim.opt

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- general settings

set.clipboard = unnamedplus
set.paste = true
set.splitright = true
set.splitbelow = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
vim.cmd.set("nu")
vim.cmd.colorscheme("nord")
vim.cmd[[
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1
]]

