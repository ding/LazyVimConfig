return {
  "junegunn/vim-easy-align",
  keys = { "<Plug>(EasyAlign)" },
  setup = function()
    vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
    vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
  end,
}
