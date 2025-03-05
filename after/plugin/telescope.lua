local builtin = require('telescope.builtin')
vim.keymap.set('n', ' pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', ' pg', builtin.git_files, {});
vim.keymap.set('n', ' ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") } );
end)
