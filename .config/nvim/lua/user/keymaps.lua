local nnoremap = require("user.keymap_utils").nnoremap
local vnoremap = require("user.keymap_utils").vnoremap
local inoremap = require("user.keymap_utils").inoremap
local tnoremap = require("user.keymap_utils").tnoremap
local xnoremap = require("user.keymap_utils").xnoremap
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
local illuminate = require("illuminate")
local utils = require("user.utils")

local M = {}

-- Normal --
-- Disable Space bar since it'll be used as the leader key
nnoremap("<space>", "<nop>")

-- Better up/down
nnoremap("j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
xnoremap("j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
nnoremap("k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
xnoremap("k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear search with <esc>
inoremap("<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
nnoremap("<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Lazygit
nnoremap("<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open Lazygit" })

-- Better tmux navigation
nnoremap("<C-j>", function()
  if vim.fn.exists(":NvimTmuxNavigateDown") ~= 0 then
    vim.cmd.NvimTmuxNavigateDown()
  else
    vim.cmd.wincmd("j")
  end
end)

nnoremap("<C-k>", function()
  if vim.fn.exists(":NvimTmuxNavigateUp") ~= 0 then
    vim.cmd.NvimTmuxNavigateUp()
  else
    vim.cmd.wincmd("k")
  end
end)

nnoremap("<C-l>", function()
  if vim.fn.exists(":NvimTmuxNavigateRight") ~= 0 then
    vim.cmd.NvimTmuxNavigateRight()
  else
    vim.cmd.wincmd("l")
  end
end)

nnoremap("<C-h>", function()
  if vim.fn.exists(":NvimTmuxNavigateLeft") ~= 0 then
    vim.cmd.NvimTmuxNavigateLeft()
  else
    vim.cmd.wincmd("h")
  end
end)

-- Map Oil to open as float
nnoremap("<leader>e", function()
  require("oil").toggle_float()
end)

-- Center buffer while navigating
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("{", "{zz")
nnoremap("}", "}zz")
nnoremap("N", "Nzz")
nnoremap("n", "nzz")
nnoremap("G", "Gzz")
nnoremap("gg", "ggzz")
nnoremap("<C-i>", "<C-i>zz")
nnoremap("<C-o>", "<C-o>zz")
nnoremap("%", "%zz")
nnoremap("*", "*zz")
nnoremap("#", "#zz")

-- Press 'S' for quick find/replace for the word under the cursor
nnoremap("S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Open Spectre for global find/replace
nnoremap("<leader>S", function()
  require("spectre").toggle()
end)

-- Open Spectre for global find/replace for the word under the cursor in normal mode
nnoremap("<leader>sw", function()
  require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word" })

-- Open Spectre for global find/replace for the word under the cursor in visual mode
vnoremap("<leader>sw", function()
  require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word" })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nnoremap("L", "$")
nnoremap("H", "^")

-- Press 'U' for undo
nnoremap("U", "<C-r>")

-- Turn off highlighted results
nnoremap("<leader>no", "<cmd>noh<cr>")

-- Diagnostics

-- Goto next diagnostic of any severity
nnoremap("]d", function()
  vim.diagnostic.goto_next({})
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous diagnostic of any severity
nnoremap("[d", function()
  vim.diagnostic.goto_prev({})
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next error diagnostic
nnoremap("]e", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous error diagnostic
nnoremap("[e", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next warning diagnostic
nnoremap("]w", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous warning diagnostic
nnoremap("[w", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
  vim.api.nvim_feedkeys("zz", "n", false)
end)

nnoremap("<leader>d", function()
  vim.diagnostic.open_float({
    border = "rounded",
  })
end)

-- Place all dignostics into a qflist
nnoremap("<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix [L]ist [D]iagnostics" })

-- Navigate to next qflist item
nnoremap("<leader>cn", ":cnext<cr>zz")

-- Navigate to previos qflist item
nnoremap("<leader>cp", ":cprevious<cr>zz")

-- Open the qflist
nnoremap("<leader>co", ":copen<cr>zz")

-- Close the qflist
nnoremap("<leader>cc", ":cclose<cr>zz")

-- Resize split windows to be equal size
nnoremap("<leader>=", "<C-w>=")

-- Better split
nnoremap("<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
nnoremap("<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
nnoremap("<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
nnoremap("<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
nnoremap("<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
nnoremap("<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- Press leader f to format
nnoremap("<leader>f", ":Format<cr>")

-- Harpoon keybinds --
-- Open harpoon ui
nnoremap("<C-e>", function()
  harpoon_ui.toggle_quick_menu()
end)

-- Add current file to harpoon
nnoremap("<leader>a", function()
  harpoon_mark.add_file()
end)

-- Quickly jump to harpooned files
nnoremap("<leader>1", function()
  harpoon_ui.nav_file(1)
end)

nnoremap("<leader>2", function()
  harpoon_ui.nav_file(2)
end)

nnoremap("<leader>3", function()
  harpoon_ui.nav_file(3)
end)

nnoremap("<leader>4", function()
  harpoon_ui.nav_file(4)
end)

nnoremap("<leader>5", function()
  harpoon_ui.nav_file(5)
end)

-- Git keymaps --
-- nnoremap("<leader>gb", ":Gitsigns toggle_current_line_blame<cr>")
-- nnoremap("<leader>gf", function()
--   local cmd = {
--     "sort",
--     "-u",
--     "<(git diff --name-only --cached)",
--     "<(git diff --name-only)",
--     "<(git diff --name-only --diff-filter=U)",
--   }
--
--   if not utils.is_git_directory() then
--     vim.notify(
--       "Current project is not a git directory",
--       vim.log.levels.WARN,
--       { title = "Telescope Git Files", git_command = cmd }
--     )
--   else
--     require("telescope.builtin").git_files()
--   end
-- end, { desc = "Search [G]it [F]iles" })

-- Telescope keybinds --
-- nnoremap("<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
-- nnoremap("<leader>sb", require("telescope.builtin").buffers, { desc = "[S]earch Open [B]uffers" })
-- nnoremap("<leader>sf", function()
--   require("telescope.builtin").find_files({ hidden = true })
-- end, { desc = "[S]earch [F]iles" })
-- nnoremap("<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
-- nnoremap("<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
-- nnoremap("<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
-- nnoremap("<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
-- nnoremap("<leader>sd", require("telescope.builtin").git_files, { desc = "[S]earch [D]iagnostics" })

-- nnoremap("<leader>sc", function()
--   require("telescope.builtin").commands(require("telescope.themes").get_dropdown({
--     previewer = false,
--   }))
-- end, { desc = "[S]earch [C]ommands" })

-- nnoremap("<leader>/", function()
--   require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
--     previewer = false,
--   }))
-- end, { desc = "[/] Fuzzily search in current buffer]" })

-- nnoremap("<leader>ss", function()
--   require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
--     previewer = false,
--   }))
-- end, { desc = "[S]earch [S]pelling suggestions" })

-- Vim Illuminate keybinds
nnoremap("<leader>]", function()
  illuminate.goto_next_reference()
  vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Illuminate: Goto next reference" })

nnoremap("<leader>[", function()
  illuminate.goto_prev_reference()
  vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Illuminate: Goto previous reference" })

-- nvim-ufo keybinds
-- nnoremap("zR", require("ufo").openAllFolds)
-- nnoremap("zM", require("ufo").closeAllFolds)

-- Insert --
-- Map jj to <esc>
inoremap("jj", "<esc>")

-- Visual --
-- Disable Space bar since it'll be used as the leader key
vnoremap("<space>", "<nop>")

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vnoremap("L", "$<left>")
vnoremap("H", "^")

-- Paste without losing the contents of the register
xnoremap("<leader>p", '"_dP')

-- Move selected text up/down in visual mode
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

-- Terminal --
-- Enter normal mode while in a terminal
-- tnoremap("<esc>", [[<C-\><C-n>]])
-- tnoremap("jj", [[<C-\><C-n>]])

-- Window navigation from terminal
tnoremap("<C-h>", [[<Cmd>wincmd h<CR>]])
tnoremap("<C-j>", [[<Cmd>wincmd j<CR>]])
tnoremap("<C-k>", [[<Cmd>wincmd k<CR>]])
tnoremap("<C-l>", [[<Cmd>wincmd l<CR>]])

-- Reenable default <space> functionality to prevent input delay
tnoremap("<space>", "<space>")

return M
