-- lua/plugins/colorscheme.lua
return {
  -- 禁用 LazyVim 默认主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = nil,
    },
  },

  -- 添加你想使用的主题，这里以 catppuccin 为例
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- 确保在其他插件之前加载
    lazy = false, -- 确保立即加载
    config = function()
      -- 错误处理
      local status_ok, catppuccin = pcall(require, "catppuccin")
      if not status_ok then
        vim.notify("catppuccin not found!", vim.log.levels.ERROR)
        return
      end

      catppuccin.setup({
        flavour = "mocha", -- 可选: latte, frappe, macchiato, mocha
        background = { -- 自定义背景色
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- 透明背景选项
        styles = { -- 自定义样式
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        integrations = { -- 添加集成支持
          -- lazy = true,
          mason = true,
          telescope = true,
          which_key = true,
          -- 添加其他你使用的插件集成
        },
      })

      -- 确保在设置主题之前设置背景选项
      vim.opt.background = "dark" -- 或 "light"

      -- 在配置完成后立即设置为当前主题
      local theme_ok, _ = pcall(vim.cmd.colorscheme, "catppuccin")
      if not theme_ok then
        vim.notify("Failed to load catppuccin theme", vim.log.levels.WARN)
        -- 可以设置一个后备主题
        vim.cmd.colorscheme("default")
      end

      -- 可以添加其他配置，比如特定的高亮组
      -- vim.api.nvim_set_hl(0, "Comment", { italic = true })
    end,
  },

  -- Tokyo Night
  {
    "folke/tokyonight.nvim",
    -- lazy = false,
    priority = 999,
    opts = {
      style = "storm",
      transparent = false,
    },
  },
}
