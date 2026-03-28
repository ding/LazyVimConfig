return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = { "html", "css", "vim", "lua", "javascript", "typescript", "tsx" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                node_decremental = "<BS>",
                scope_incremental = "<TAB>",
            },
        },
        indent = {
            enable = true,
        },
    },
    config = function(_, opts)
        require("nvim-treesitter").setup(opts)
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldlevel = 99
    end,
}
