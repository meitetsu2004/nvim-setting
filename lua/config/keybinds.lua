vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "<leader>jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- theme picker (preview)
keymap.set("n", "<leader>uc", function()
  local ok, builtin = pcall(require, "telescope.builtin")
  if ok then
    builtin.colorscheme({ enable_preview = true })
  end
end, { desc = "Colorscheme picker (preview)" })

-- Opt(Alt) + z で折り返しを切り替え (Normalモード)
keymap.set("n", "<A-z>", "<cmd>set wrap!<CR>", { silent = true, desc = "Toggle Wrap" })
