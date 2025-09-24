return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "html", "javascript", "lua" }, -- add the languages you need
      highlight = {
        enable = true,
      },
    },
  },
}

