-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    local ok, snacks = pcall(require, "snacks")
    if not ok then
      return
    end

    vim.ui.input = snacks.input.input
    vim.ui.select = snacks.picker.select
  end,
})
