local builtin = require('telescope.builtin')
-- "Project-files" fuzzy file search
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({
        hidden = true,
        file_ignore_patterns = {".git/"},
    });
end)
-- Search git files only
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- "Project-search" grep expressions in workspace
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
