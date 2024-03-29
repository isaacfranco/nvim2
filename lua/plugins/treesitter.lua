return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "javascript", "http", "xml", "graphql", "json", "html" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
        vim.keymap.set("n", "<Leader>rr", "<cmd>Rest run<cr>", {})--, "Run request under the cursor");
        vim.keymap.set("n" , "<Leader>rl", "<cmd>Rest run last<cr>", {})--, "Re-run latest request");
    end
}
