-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("config.plugins.lualine-config").setup()
  end,
  -- opts = function(_, opts)
  --   local LazyVim = require("lazyvim.util")
  --   opts.sections.lualine_c[4] = {
  --     LazyVim.lualine.pretty_path({
  --       length = 0,
  --       relative = "cwd",
  --       modified_hl = "MatchParen",
  --       directory_hl = "",
  --       filename_hl = "Bold",
  --       modified_sign = "",
  --       readonly_icon = " 󰌾 ",
  --     }),
  --   }
  -- end,
}
