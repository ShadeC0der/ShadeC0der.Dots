local o = vim.opt_local

o.wrap = true
o.linebreak = true
o.breakindent = true
o.spell = true
o.textwidth = 80
o.colorcolumn = "81"
o.conceallevel = 2
o.concealcursor = "nc"
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true
o.formatoptions:append("croqn")

vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", {
  buffer = true,
  desc = "Toggle markdown preview",
})

vim.keymap.set("n", "<leader>mw", function()
  vim.opt_local.wrap = not vim.opt_local.wrap:get()
end, { buffer = true, desc = "Toggle markdown wrap" })

vim.keymap.set("n", "<leader>ms", function()
  vim.opt_local.spell = not vim.opt_local.spell:get()
end, { buffer = true, desc = "Toggle markdown spell" })
