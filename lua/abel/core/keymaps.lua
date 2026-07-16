vim.g.mapleader = " "
local map = vim.keymap.set

-- Open commands helper
map("n", "<leader>hh", "<cmd>FloatFile ~/.config/nvim/lua/abel/core/helper_commands.lua<cr>")

-- Basic Configuration
map("i", "jk", "<Esc><Esc>")
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<leader>w", "<cmd>w<cr>")
-- map("n", "<leader>rr", "<cmd>source %<cr>")

-- File Browser
map("n", "<leader>e", "<cmd>Explore<cr>")

-- To Navigate between buffer and close buffer
map("n", "<leader>bn", "<cmd>bn<cr>")
map("n", "<leader>bp", "<cmd>bp<cr>")
map("n", "<leader>bd", "<cmd>bd<cr>")

-- mantiene el texto resaltado en el centro del editor
map('n', 'n', 'nzzzv', { desc = "Goes to the next result on the seach and put the cursor in the middle"})
map('n', 'N', 'Nzzzv', { desc = "Goes to the prev result on the seach and put the cursor in the middle"})

-- Move text up and down normal mode
map("n", "<A-j>", "<Esc>:m .+1<CR>==")
map("n", "<A-k>", "<Esc>:m .-2<CR>==")

-- Move text up and down visual mode
map("v", "p", '"_dP')
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")

--Move text up and down visula mode but Indenting
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Open vertical Terminal
map("n", "<C-t>", ":vert:split<CR>:terminal<CR>")
-- quit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Block arrow keys
map("n", "<up>", "<nop>", { silent = true })
map("n", "<down>", "<nop>", { silent = true })
map("n", "<left>", "<nop>", { silent = true })
map("n", "<right>", "<nop>", { silent = true })

-- Resize windows with arrows keys
-- map("n", "<right>", ":vertical resize -5<CR>")
-- map("n", "<left>", ":vertical resize +5<CR>")
-- map("n", "<up>", ":resize -5<CR>")
-- map("n", "<down>", ":resize +5<CR>")

-- Indenting in visual mode
map('v', '>', '>gv', { desc = "after tab in re-select the same"})
map('v', '<', '<gv', { desc = "after tab out re-select the same"})

map('n', 'n', 'nzzzv', { desc = "Goes to the next result on the seach and put the cursor in the middle"})
map('n', 'N', 'Nzzzv', { desc = "Goes to the prev result on the seach and put the cursor in the middle"})

-- Faster Scrolling
map("n", "<leader>j", "10j")
map("n", "<leader>k", "10k")

-- Runner current file
local runners = {
  python = "python3 %",
  javascript = "node %",
  typescript = "bun %",
  sh = "bash %",
  lua = "lua %",
  rust = "cargo run",
  c = "gcc % -o /tmp/nvim_run && /tmp/nvim_run",
  cpp = "g++ % -std=c++20 -o /tmp/nvim_run && /tmp/nvim_run",
  java = "javac % && java %:r",
}

function RunCurrentFile()
  local ft = vim.bo.filetype
  local cmd = runners[ft]

  if not cmd then
    vim.notify("No hay runner para: " .. ft)
    return
  end

  vim.cmd("belowright 15split")
  vim.cmd("terminal " .. cmd)

  -- Entrar al terminal
  vim.cmd("startinsert")

  -- q para cerrar la ventana del terminal
  vim.keymap.set("n", "q", "<cmd>close<CR>", {
    buffer = 0,
    silent = true,
  })
end

vim.keymap.set("n", "<leader><leader>r", RunCurrentFile, {
  desc = "Run current file",
})

-- For multicursor

--Basic usage

--select words with Ctrl-s (like Ctrl-d in Sublime Text/VS Code)
--create cursors vertically with Ctrl-Down/Ctrl-Up
--select one character at a time with Shift-Arrows
--press n/N to get next/previous occurrence
--press [/] to select next/previous cursor
--press q to skip current and get next occurrence
--press Q to remove current cursor/selection

vim.cmd([[
    let g:VM_maps = {}
    let g:VM_maps['Find Under']         = '<C-s>'  " replace C-s
    let g:VM_maps['Find Subword Under'] = '<C-s>'  " replace visual C-s
    let g:VM_mouse_mappings = 1

"autocompletado de parentesis
    inoremap ( ()<esc>i
    inoremap { {}<esc>i
    inoremap [ []<esc>i
    inoremap " ""<esc>i
    inoremap ' ''<esc>i
    inoremap < <><esc>i

]])

-- ReplaceWithRegister:
-- uso yw para copiar la palabra y luego me posiciono en la siguiente palabra
-- y la reemplazo con la anterior palabra usando grw
