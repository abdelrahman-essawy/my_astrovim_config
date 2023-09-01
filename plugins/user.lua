return {
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
  },
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      vim.g.copilot_filetypes = {
        ["*"] = false,
        python = true,
        lua = true,
        go = true,
        rust = true,
        html = true,
        c = true,
        cpp = true,
        java = true,
        javascript = true,
        typescript = true,
        javascriptreact = true,
        typescriptreact = true,
        terraform = true,
      }
    end,
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },
  {
    dir = "~/development/personal/npm-scripts.nvim",
    dev = true,
    event = "VeryLazy",
    config = function() require("npm-scripts").setup {} end,
  },

  -- {
  --   "abdelrahman-essawy/npm-scripts.nvim",
  --   config = function() require("npm-scripts").setup {} end,
  --   event = "VeryLazy",
  -- },
}
