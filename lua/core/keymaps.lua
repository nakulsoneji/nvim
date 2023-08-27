local map = vim.keymap.set

map('n', '<leader>ff', "<cmd>Telescope find_files<cr>", {})
map('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", {})
map('n', '<leader>fb', "<cmd>Telescope buffers<cr>", {})
map('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", {})
map('n', '<leader>fo', "<cmd>Telescope oldfiles")
-- telescope file_explorer
map('n', '<leader>fe', "<cmd>Telescope file_browser<cr>", {})


map('n', '<leader>ft', "<cmd>NvimTreeToggle<cr>")

map({'n','t'}, '<A-d>', '<cmd>Lspsaga term_toggle<cr>', {})
