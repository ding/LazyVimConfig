-- 🌻 A Vim alignment plugin
-- " Start interactive EasyAlign in visual mode (e.g. vipga)
-- xmap ga <Plug>(EasyAlign)
--
-- " Start interactive EasyAlign for a motion/text object (e.g. gaip)
-- nmap ga <Plug>(EasyAlign)

return {
  "junegunn/vim-easy-align",
  keys = { "<Plug>(EasyAlign)" },
  setup = function()
    vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
    vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
  end,
}
