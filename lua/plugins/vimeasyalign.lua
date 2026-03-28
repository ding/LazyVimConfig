-- 🌻 A Vim alignment plugin
-- " Start interactive EasyAlign in visual mode (e.g. vipga)
-- xmap ga <Plug>(EasyAlign)
--
-- " Start interactive EasyAlign for a motion/text object (e.g. gaip)
-- nmap ga <Plug>(EasyAlign)

return {
    "junegunn/vim-easy-align",
    keys = {
        { "ga", "<Plug>(EasyAlign)", mode = "x", desc = "Easy Align" },
        { "ga", "<Plug>(EasyAlign)", mode = "n", desc = "Easy Align" },
    },
}
