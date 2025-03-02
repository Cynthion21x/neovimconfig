require("catppuccin").setup({
        flavour = "mocha",
        show_end_of_buffer = true,
        intergrations = {
                treesitter = true
        }
})

vim.cmd.colorscheme "catppuccin"

-- [[
--require('onedark').setup {
--    style = 'deep',
--    ending_tildes = true
--}
--require('onedark').load()
--]]

