return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
  keys = {
    {
      -- Mudou de <leader>D para <leader>mb (Meus -> Banco de Dados)
      "<leader>mb",
      "<cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>",
      desc = "Interface do Banco de Dados",
    },
  },
}
