return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      -- Registra um grupo global para as suas ferramentas customizadas
      { "<leader>m", group = "Meus Atalhos", mode = { "n", "v" } },
    },
  },
}
