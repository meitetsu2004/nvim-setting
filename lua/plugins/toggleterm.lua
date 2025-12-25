return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
        open_mapping = [[<c-`>]],
        terminal_mappings = false,
        direction = "horizontal",
        size = function() return math.floor(vim.o.lines * 0.45) end,
        open_mapping = [[<c-`>]],
        start_in_insert = true,
    })
  end,
}
