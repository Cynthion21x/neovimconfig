require("cynthion.remap")
require("cynthion.set")
require("cynthion.theme")

require("mason").setup()
require("mason-lspconfig").setup()

vim.opt.shortmess:append("I")  

local quotes = {
    "Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it.",
    "If you don't finish then you're just busy, not productive.",
    "A monad is just a monoid in the context of endofunctors",
    "Don't live with broken windows.",
    "Violence solves all problems. Just use brute force",
    "Computer science is stupid.",
    "If you get things right 90% of the time your not aiming high enough",
    "Better than minecraft splash text"
}

math.randomseed(os.time()) 
local random_quote = quotes[math.random(#quotes)]

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then  
            local total_width = vim.api.nvim_get_option("columns")
            local total_height = 40 
            local win_width = math.floor(total_width * 0.6) 
            local win_height = 13
            local col = math.floor((total_width - win_width) / 2)
            local row = math.floor((total_height - win_height) / 2) - 2

            local raw_lines = {
                "",
                "NeoVim - Cynthion Edition",
                "",
                "",
                "Neovim is an open-source, free-to-use text editor",
                "https://neovim.io/#chat",
                "",
                "type :intro to show the old message",
                "type :Ex to show the file tree",
                "",
                random_quote
            }

            local function center_text(text, width)
                local padding = math.floor((width - #text) / 2)
                return string.rep(" ", math.max(padding, 0)) .. text
            end

            local lines = {}
            for _, line in ipairs(raw_lines) do
                table.insert(lines, center_text(line, win_width))
            end

            local buf = vim.api.nvim_create_buf(false, true)
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

            local win_opts = {
                relative = "editor",
                width = win_width,
                height = win_height,
                row = row,
                col = col,
                style = "minimal",
                border = "rounded"
            }

            local win = vim.api.nvim_open_win(buf, false, win_opts)

            local close_win = function()
                if vim.api.nvim_win_is_valid(win) then
                    vim.api.nvim_win_close(win, true)
                end
            end

            vim.api.nvim_create_autocmd({ "InsertEnter", "BufEnter" }, {
                once = true,
                callback = close_win
            })
        end
    end
})
