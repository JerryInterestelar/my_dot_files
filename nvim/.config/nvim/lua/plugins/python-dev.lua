return {
  -- 1. Configuração dos Servidores LSP (Inteligência de Código)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- PYRIGHT: Foca na análise de tipos e definições
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic", -- "off", "basic" ou "strict"
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },

        -- RUFF: Foca em Linter (Erros de estilo) e correções rápidas
        ruff = {
          -- O ruff lsp geralmente não precisa de configs extras aqui.
          -- Ele vai ler seu arquivo 'pyproject.toml' ou 'ruff.toml' se existir.
          -- Caso não exista config no projeto, ele usa os padrões (PEP8).
        },
      },
    },
  },

  -- 2. Configuração do Formatador (Para formatar ao salvar)
  -- O LazyVim usa o plugin 'conform.nvim' para formatação.
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Define que arquivos Python devem ser formatados pelo Ruff
        python = {
          "ruff_format",
          -- "ruff_fix" -- Não quero deletar nada
        },
      },
    },
  },
}
