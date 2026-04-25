return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitterConfigs = require("nvim-treesitter.configs")
    treesitterConfigs.setup({
      ensure_installed = {
        "lua",
        "vim",
        "html",
        "typescript",
        "javascript",
      },
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
    })
  end,
}
