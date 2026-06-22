-- ==========================================================================
-- 1. Atalhos Globais (Movimentação e Comportamento Nativo)
-- Não precisam de grupo no Which-Key pois rodam direto no Editor
-- ==========================================================================

-- Mover linhas no modo Visual
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover linha para baixo", silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover linha para cima", silent = true })

-- Juntar linhas mantendo o cursor no mesmo lugar
vim.keymap.set("n", "J", "mzJ`z", { desc = "Juntar linha inferior", silent = true })

-- Centralizar a tela ao rolar páginas (Garante o zz automático)
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Rolar meia página abaixo", silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Rolar meia página acima", silent = true })

-- Manter termos buscados sempre no centro da tela
vim.keymap.set("n", "n", "nzzzv", { desc = "Próxima ocorrência (centralizada)", silent = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Ocorrência anterior (centralizada)", silent = true })

-- Selecionar tudo com Ctrl+A
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Selecionar todo o texto" })

-- ==========================================================================
-- 2. Categoria Customizada: <leader>m (Meus Atalhos)
-- Aqui ficam os comandos que você queria categorizar
-- ==========================================================================

-- Deletar para o registrador de vácuo (não polui o clipboard)
vim.keymap.set({ "n", "v" }, "<leader>md", [["_d]], { desc = "Deletar sem copiar" })

-- Buscar e substituir a palavra sob o cursor no arquivo inteiro
vim.keymap.set(
  "n",
  "<leader>ms",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Substituir palavra sob o cursor" }
)
