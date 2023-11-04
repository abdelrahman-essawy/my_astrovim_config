local height = 18
local namespace = vim.api.nvim_create_namespace "GlancePlaceHolder"
local place_holder = {}
for _ = 1, height, 1 do
  place_holder[#place_holder + 1] = { { "", "Error" } }
end
local id = 0

local function before_open(results, open)
  local lnum = vim.api.nvim_win_get_cursor(0)[1]
  id = vim.api.nvim_buf_set_extmark(0, namespace, lnum - 1, 0, { virt_lines = place_holder })
  open(results)
end

local function after_close() vim.api.nvim_buf_del_extmark(0, namespace, id) end

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
  -- {
  --   dir = "~/development/personal/npm-scripts.nvim",
  --   dev = true,
  --   event = "VeryLazy",
  --   config = function() require("npm-scripts").setup {} end,
  -- },
  {
    "dmmulroy/tsc.nvim",
    event = "VeryLazy",
    config = function()
      require("tsc").setup {
        -- on_attach = function(client) client.resolved_capabilities.document_formatting = false end,
      }
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "VeryLazy",
    build = function() require("telescope").load_extension "project" end,
  },

  {
    "abdelrahman-essawy/npm-scripts.nvim",
    config = function() require("npm-scripts").setup {} end,
    event = "VeryLazy",
  },
  -- {
  --   "VidocqH/lsp-lens.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp-lens").setup() end,
  -- },
  {
    "dnlhc/glance.nvim",
    config = function()
      require("glance").setup {
        height = height,
        hooks = { before_open = before_open, after_close = after_close },
      }
      vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
      vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
      vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
      vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")
    end,
    event = "BufRead",
  },
  -- {
  --   "IMOKURI/line-number-interval.nvim",
  --   event = "BufRead",
  --   build = function()
  --     -- set global values
  --     vim.g.line_number_interval_enable_at_startup = true
  --     vim.g.line_number_interval_start = 5
  --     vim.g.line_number_interval = 5
  --     vim.g.line_number_interval_highlight = "LineNr"
  --     vim.g.line_number_interval_highlight_bg = "Normal"
  --     vim.g.line_number_interval_highlight_fg = "Comment"
  --     vim.g.line_number_interval_highlight_style = "bold"
  --   end,
  -- },
  --
  {
    "LeonHeidelbach/trailblazer.nvim",
    event = "BufRead",
    config = function()
      require("trailblazer").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "onsails/diaglist.nvim",
    event = "BufRead",
  },
  {
    "folke/flash.nvim",
    event = "BufRead",
    opts = {
      -- incremental = true,
      -- mode = "fuzzy",
      modes = { char = { enabled = false } },
    },
    keys = {
      { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "mattkubej/jest.nvim",
    event = "BufRead",
  },
}
