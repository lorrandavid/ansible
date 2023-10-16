-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Better navigation for Tmux
map("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<cr>")
map("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<cr>")
map("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<cr>")
map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<cr>")
map("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<cr>")
map("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNext<cr>")

-- Toggle term
map("i", [[<C-\>]], '<cmd>exe v:count1 . "ToggleTerm"<CR>')
map("n", [[<C-\>]], '<cmd>exe v:count1 . "ToggleTerm"<CR>')

function _G.set_terminal_keymaps()
  local opts = { buffer = 0, noremap = true }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n><C-w>l]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
