vim.opt.signcolumn = 'yes'

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

require("mason").setup()
require("mason-lspconfig").setup({automatic_enable = false,})

local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")

null_ls.setup()

mason_null_ls.setup({
    handlers = {},
})


vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

vim.diagnostic.config({

  underline = { severity = { min = vim.diagnostic.severity.ERROR } },

  virtual_text = false,
  signs = { severity = { min = vim.diagnostic.severity.ERROR } },
  severity_sort = true,
})

local signs = {
    Error = "X",
    Warn = "",
    Hint = "H",
    Info = ""
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local cmp = require('cmp')


cmp.setup({
    enabled = function()
        local context = require("cmp.config.context")
        if context.in_treesitter_capture("string") or context.in_syntax_group("String") then
            return false
        end
        return true
    end,
    completion = {
        autocomplete = false,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer", keyword_length = 3 },
    })
})

vim.g.diagnostics_visible = true

vim.keymap.set("n", "<Space><Tab>", function()
    vim.g.diagnostics_visible = not vim.g.diagnostics_visible
    vim.diagnostic.config({
        virtual_text = vim.g.diagnostics_visible,
    })
end, { desc = "Toggle diagnostic virtual text" })
