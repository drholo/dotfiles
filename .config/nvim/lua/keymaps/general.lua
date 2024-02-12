-- markdown settings

vim.keymap.set("n", "<leader>ms", "<Plug>MarkdownPreview")
vim.keymap.set("n", "<leader>mc", "<Plug>MarkdownPreviewStop")
vim.keymap.set("n", "<leader>mt", "<Plug>MarkdownPreviewToggle")

-- telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
