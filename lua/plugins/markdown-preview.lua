return {
  -- Install markdown preview, use npx if available.
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function(plugin)
    if vim.fn.executable "npx" then
      vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
    else
      vim.cmd [[Lazy load markdown-preview.nvim]]
      vim.fn["mkdp#util#install"]()
    end
  end,
  init = function()
    if vim.fn.executable "npx" then vim.g.mkdp_filetypes = { "markdown" } end
  end,
  config = function()
    vim.keymap.set("n", "<Leader>mp", "<Plug>MarkdownPreview", { desc = "Markdown Preview" })
    vim.keymap.set("n", "<Leader>mt", "<Plug>MarkdownPreviewToggle", { desc = "Markdown Preview Toggle" })
    vim.keymap.set("n", "<Leader>ms", "<Plug>MarkdownPreviewStop", { desc = "Markdown Preview Stop" })
  end,
}
