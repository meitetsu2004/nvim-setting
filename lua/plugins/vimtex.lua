return {
  "lervag/vimtex",
  lazy = false,
  tag = "v2.15",
  init = function()
    vim.g.vimtex_view_method = "skim"

    vim.g.vimtex_compiler_latexmk = {
      options = {
        "-interaction=nonstopmode",
        "-synctex=1",
      },
    } -- ← ★ここで閉じる！

    -- 1. 削除時の確認メッセージ（Y/n）を出さない (== ではなく = を使う)
    vim.g.vimtex_clean_confirm = false

    -- 2. コンパイル停止時（Neovim終了時含む）に自動で削除コマンドを実行
    vim.api.nvim_create_autocmd("User", {
      pattern = "VimtexEventQuit",
      group = vim.api.nvim_create_augroup("VimtexAutoClean", { clear = true }),
      command = "VimtexClean",
    })

    -- 3. 追加削除リスト (ここも == ではなく = を使う)
    vim.g.vimtex_clean_additional_extensions = {
      "dvi",
      "synctex.gz",
      "out",
      "fls",
      "fdb_latexmk",
    }
  end,
}
