-- Keybind to open the file navigator
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', {})

-- Keybind to replace
vim.api.nvim_set_keymap('v', 'r', '"_dP', {})

-- Make split navigation easier.
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })

-- Opens a telescope menu that allows you to search in the whole project
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })

-- Opens a telescope menu with all the active buffers
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })

-- Opens the telescope file finder
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', { noremap = true })

-- Keybinds to create a new tab
vim.api.nvim_set_keymap('n', 'tnew', ':tabnew<cr>', { noremap = true })

-- Removes the previous highlight
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<cr>', { noremap = true })

-- Keybinds to move line up or down
vim.api.nvim_set_keymap('n', '<Leader>k', 'ddkP', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>j', 'ddp', { noremap = true })

-- Keybinds to trigger my custom plugins
vim.api.nvim_set_keymap('n', '<Leader>file', ":lua require('createFile').start();<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>model', ":lua require('modelCreator').start();<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>list', ":lua require('overviewCustomPlugins').start();<CR>", { noremap = true })
