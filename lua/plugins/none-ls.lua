return {
    -- none-ls (fork of null-ls) enables non-lsp tools to behave like lsps whn using nvim
    "nvimtools/none-ls.lua.nvim",
    config = function()
        local null_ls = require("null-ls")
        -- see more buitins on https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua
            }
        })
    end
}
