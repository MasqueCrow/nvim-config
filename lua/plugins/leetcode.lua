return {
  {
    "kawre/leetcode.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    branch = "disable-x-requested-with-header",
    build = nil,  -- optional if you use treesitter html parser
    cmd = "Leet",
    opts = {
      lang = "python3",     -- default language
      plugins = {
        non_standalone = true,  -- allow :Leet anytime
      },
      picker = { provider = "telescope" },
      logging = true,
    },
  }
}

