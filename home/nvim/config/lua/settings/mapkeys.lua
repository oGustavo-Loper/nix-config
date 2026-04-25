local keymap = require("utils.keymap")

-- { "n", "v" }

-- Selecionar tudo
keymap("n", "<C-a>", "ggvG$", "Seleciona Todo o arquivo")

-- ir para a linha
keymap("n", "<C-g>", ":", "Ir para a linha")

--[[
Movendo a linha selecionada ↑↓
    Alt - j Move a linha do cursor pra cima
    Alt - k Move a linha do cursor pra baixo
Também é possivel mover as linhas selecionadas
]]--

keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("n", "<A-Down>", ":m .+1<CR>==")

keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")

keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv")

keymap("x", "<A-j>", ":m'>+<CR>gv=gv")
keymap("x", "<A-Down>", ":m'>+<CR>gv=gv")

keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("n", "<A-Up>", ":m .-2<CR>==")

keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")

keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv")

keymap("x", "<A-Up>", ":m-2<CR>gv=gv")
keymap("x", "<A-k>", ":m-2<CR>gv=gv")

keymap("n", "<C-j>", ":lua require('kulala').run()<CR>")


-- lua/settings/mapkeys.lua

-- Atalhos para dividir a tela
keymap('n', '<leader>sh', ':split<CR>')
keymap('n', '<leader>sv', ':vsplit<CR>')

-- Atalhos para navegar entre as janelas
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')
