-- Keybind to open the file navigator
vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<CR>', {})

-- Keybind to replace
vim.api.nvim_set_keymap('v', 'r', '"_dP', {})

-- Make split navigation easier.
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })

-- Telescope keybinds
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, expr = true })

-- Keybinds to create a new tab
vim.api.nvim_set_keymap('n', 'tnew', ':tabnew<cr>', { noremap = true })

-- Keybinds to move line up or down
vim.api.nvim_set_keymap('n', '<Leader>k', 'ddkP', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>j', 'ddp', { noremap = true })

