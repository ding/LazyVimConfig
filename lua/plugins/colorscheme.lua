-- lua/plugins/colorscheme.lua
-- if true then return {} end

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

      -- 创建一个本地变量存储主题配置
      local theme_config = {
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
          mason = true,
          telescope = true,
          which_key = true,
        },
      }

      -- 设置主题配置
      catppuccin.setup(theme_config)

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

      -- -- 添加主题切换功能
      -- vim.keymap.set("n", "<leader>tt", function()
      --   local themes = { "catppuccin", "default" }
      --   local current = vim.g.colors_name
      --   local next_theme = current == themes[1] and themes[2] or themes[1]
      --   vim.cmd.colorscheme(next_theme)
      --   vim.notify("Switched to theme: " .. next_theme)
      -- end, { desc = "Toggle theme" })
      --
      -- -- 添加透明度切换功能
      -- vim.keymap.set("n", "<leader>tb", function()
      --   -- 切换透明度设置
      --   theme_config.transparent_background = not theme_config.transparent_background
      --   -- 重新应用主题配置
      --   catppuccin.setup(theme_config)
      --   -- 重新加载主题以应用更改
      --   vim.cmd.colorscheme("catppuccin")
      --   -- 通知用户当前状态
      --   vim.notify("Background transparency: " .. (theme_config.transparent_background and "ON" or "OFF"))
      -- end, { desc = "Toggle background transparency" })
    end,
  },

  -- Tokyonight 主题
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm", -- storm, moon, night, day
        transparent = false,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
        on_colors = function(colors)
          colors.hint = colors.orange
          colors.error = "#ff0000"
        end,
        on_highlights = function(hl, c)
          local prompt = "#2d3149"
          hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
        end,
      })
    end,
  },

  -- Gruvbox 主题
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        transparent_mode = false,
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
          emphasis = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
      })
    end,
  },
}
