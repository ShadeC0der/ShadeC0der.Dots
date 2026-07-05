-- Configure Node.js before loading plugins
vim.env.PATH = vim.fn.expand("~/.cargo/bin") .. ":" .. (vim.env.PATH or "")
vim.g.rustaceanvim = {
  tools = {
    enable_clippy = true,
  },
  server = {
    status_notify_level = "error",
    on_attach = function(_, bufnr)
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map("K", function()
        vim.cmd.RustLsp({ "hover", "actions" })
      end, "Rust Hover Actions")
      map("<leader>ra", function()
        vim.cmd.RustLsp("codeAction")
      end, "Rust Code Action")
      map("<leader>rr", function()
        vim.cmd.RustLsp("runnables")
      end, "Rust Runnables")
      map("<leader>rd", function()
        vim.cmd.RustLsp("debuggables")
      end, "Rust Debuggables")
      map("<leader>re", function()
        vim.cmd.RustLsp("explainError")
      end, "Rust Explain Error")
      map("<leader>ro", function()
        vim.cmd.RustLsp("openCargo")
      end, "Open Cargo.toml")
    end,
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        check = {
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        checkOnSave = true,
        procMacro = {
          enable = true,
        },
      },
    },
  },
}
require("config.nodejs").setup({ silent = true })

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
