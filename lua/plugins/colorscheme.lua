-- lua/plugins/colorscheme.lua
-- if true then return {} end

return {
  -- 禁用 LazyVim 默认主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = nil, -- 只修改 colorscheme,其它配置保持默认
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

      -- 可以添加其他配置，比如特定的高亮组
      -- vim.api.nvim_set_hl(0, "Comment", { italic = true })
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

  -- Kanagawa theme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 900,
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave", -- Load "wave" theme , dragon, lotus
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      })
    end,
  },

  -- 设置具体主题(已经确认不会覆盖LazyVim其它默认配置)
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      local function set_colorscheme(theme)
        local status_ok, _ = pcall(vim.cmd.colorscheme, theme)
        if status_ok then
          opts.colorscheme = theme
        else
          vim.notify("Failed to load colorscheme" .. theme, vim.log.levels.WARN)
          -- 可以设置一个后备主题
          opts.colorscheme = "vim"
        end
      end

      -- NOTE: 实际主题在这边进行设置
      -- set_colorscheme("catppuccin")
      set_colorscheme("kanagawa")
    end,
  },
}
