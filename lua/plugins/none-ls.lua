return {
    -- none-ls (fork of null-ls) enables non-lsp tools to behave like lsps whn using nvim
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        -- see more buitins on https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
        -- some sources are on none-ls-extas and should be required intead of using through builtins
        null_ls.setup({
            sources = {
--                require("none-ls.diagnostics.eslint_d"),
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.rubocop,
                null_ls.builtins.formatting.rubocop,
                null_ls.builtins.formatting.prettier,
            },
        })
    end,
}
