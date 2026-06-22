return {
  -- 1. Configuração dos Servidores LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
        -- O ruff aceita configurações nativas aqui.
        -- Desabilitamos o hover diretamente nas capacidades dele, sem precisar de ganchos (hooks).
        ruff = {
          on_init = function(client)
            if client.name == "ruff" then
              -- Desabilita o hover do ruff para priorizar o pyright
              client.server_capabilities.hoverProvider = false
            end
          end,
        },
      },
    },
  },

  -- 2. Configuração do Formatador
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format" },
      },
    },
  },
}
