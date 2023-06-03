local builtin = require('telescope.builtin')
-- "Project-files" fuzzy file search
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- Search git files only
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- "Project-search" grep expressions in workspace
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

