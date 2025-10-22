local builtin = require('telescope.builtin')

-- "Project-files" fuzzy file search
vim.keymap.set('n', '<leader>ff', function()
    builtin.find_files({
        hidden = true,
        file_ignore_patterns = {".git/"},
    });
end)

-- "Project-search" grep expressions in workspace (requires rip-grep)
vim.keymap.set('n', '<leader>fg', function()
    builtin.live_grep({
        hidden = true,
        file_ignore_patterns = {".git/"},
    });
end)

-- "LSP: go-to the definition of word under cursor
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})

-- "LSP: show references for the word under cursor
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})

-- https://smarttech101.com/nvim-lsp-diagnostics-keybindings-signs-virtual-texts
--
-- diagnostics - find
vim.keymap.set('n', '<leader>df', builtin.diagnostics, {})
-- diagnostics - open
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
