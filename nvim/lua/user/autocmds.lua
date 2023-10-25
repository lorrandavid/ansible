local function augroup(name)
  return vim.api.nvim_create_augroup("autocmds_" .. name, { clear = true })
end

-- Highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  pattern = "*",
  desc = "Highlight selection on yank",
  callback = function()
    vim.highlight.on_yank({ timeout = 200, visual = true })
  end,
})

-- Toggle Diagnostic
vim.api.nvim_create_user_command("ToggleDiagnostics", function()
  if vim.g.diagnostics_enabled == nil then
    vim.g.diagnostics_enabled = false
    vim.diagnostic.disable()
  elseif vim.g.diagnostics_enabled then
    vim.g.diagnostics_enabled = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_enabled = true
    vim.diagnostic.enable()
  end
end, {})

-- Toggle ESLint
-- vim.api.nvim_create_user_command("ToggleESLint", function()
--   require("none_ls").toggle("eslint")
-- end, {})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
