return {
  "zbirenbaum/copilot.lua",
  optional = true,
  opts = {
    suggestion = {
      enabled = false,
    },
    panel = {
      enabled = false,
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
  end,
}
