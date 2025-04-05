-- solved Fzf-lua 'fzf' is not a valid executable error
-- work fine!
--
return {
  "junegunn/fzf.vim",
  dependencies = { "junegunn/fzf", "vijaymarupudi/nvim-fzf" },
  config = function()
    -- local fuzzy = require("fuzzy")
    vim.g.fzf_buffers_jump = true
    vim.g.fzf_layout = { window = { width = 0.8, height = 0.4, yoffset = 0.2 } }
  end,
  event = "VeryLazy",
}
