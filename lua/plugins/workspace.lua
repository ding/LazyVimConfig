-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

    -- Navigate your code with search labels, enhanced character motions and Treesitter integration
    -- https://github.com/folke/flash.nvim
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },

    --{
    --"scrooloose/nerdcommenter",
    --},

    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    -- Comment plugins
    -- gcc: 行注释当前行
    -- gbc: 使用块级别注释来注释当前行
    -- ngcc: 使用行级别注释来注释当前行往后的几行数据
    -- ngbc: 使用块级别注释来注释掉当前行往后的几行数据
    -- 其它
    --    gc2w: 注释掉最近的两个单词
    --    在V模式下，使用gc 来在进行注释
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
        lazy = false,
    },

    -- use mini.starter instead of alpha
    --{ import = "lazyvim.plugins.extras.ui.mini-starter" },

    -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
    --{ import = "lazyvim.plugins.extras.lang.json" },

    --{ import = "lazyvim.plugins.extras.editor.mini-files" },
    -- { "catppuccin/nvim", name = "catppuccin", lazy = true, priority = 1000 },

    -- neotest
    {
        "nvim-neotest/neotest",
        cmd = "Neotest",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-jest",
            "nvim-neotest/neotest-plenary",
        },
        config = function()
            --- @diagnostic disable-next-line: missing-fields
            require("neotest").setup {
                adapters = {
                    require "neotest-plenary",
                },
            }
        end,
    },

    -- { "windwp/nvim-ts-autotag" },
    { "yorumicolors/yorumi.nvim" },

    -- for markdown table
    { "mattn/vim-maketable" },

    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
}
