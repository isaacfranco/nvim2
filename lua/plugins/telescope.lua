return {
    {
        "nvim-telescope/telescope.nvim", tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

            require("telescope").load_extension("rest")
            -- then use it, you can also use the `:Telescope rest select_env` command
            --require("telescope").extensions.rest.select_env()
        end
    },
    {
        -- extension to telescope show a better picker for options menu, like
        -- code actions
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
              extensions = {
                ["ui-select"] = {
                  require("telescope.themes").get_dropdown {
                  }
                }
              }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
