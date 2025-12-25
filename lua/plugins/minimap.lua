return {
  "echasnovski/mini.nvim",
  config = function()
    local map = require("mini.map")
    map.setup({
      integrations = {
        map.gen_integration.builtin_search(),
        map.gen_integration.diff(),
        map.gen_integration.diagnostic(),
      },
      symbols = {
        scroll_line = "▶",
      },
    })
    vim.keymap.set("n", "mmf", map.toggle_focus, { desc = "MiniMap.toggle_focus" })
    vim.keymap.set("n", "mms", map.toggle_side, { desc = "MiniMap.toggle_side" })
    vim.keymap.set("n", "mmt", map.toggle, { desc = "MiniMap.toggle" })
  end,
}
