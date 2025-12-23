return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          hidden = true, -- Mostra arquivos que começam com "."
          no_ignore = true, -- <--- ADICIONE ISSO (Mostra arquivos listados no .gitignore)
        },
      },
      defaults = {
        tiebreak = function(entry1, entry2, _)
          -- Verifica se o arquivo está aberto em um buffer
          local b1 = vim.fn.bufexists(entry1.path) > 0
          local b2 = vim.fn.bufexists(entry2.path) > 0
          if b1 and not b2 then
            return true
          end
          if not b1 and b2 then
            return false
          end
          -- Se ambos estiverem abertos ou ambos fechados, segue o padrão
          return false
        end,
        -- Essa lista garante que, mesmo com "no_ignore", o lixo continue fora
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          ".venv/",
          "__pycache__/",
          "%.egg-info/",
          "%.pytest_cache/",
        },
      },
    },
  },
}
