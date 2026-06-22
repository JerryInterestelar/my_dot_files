return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Garante que carrega antes de qualquer outro elemento visual
    opts = {
      transparent_background = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        mason = true,
        neotree = true,
        snacks = true, -- Integração explícita com o novo core do LazyVim
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim", -- Mudança crucial para ignorar o upstream builtin
    },
  },
}
