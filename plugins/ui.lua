return {
  {
    "nvim-tree/nvim-web-devicons",
    enabled = vim.g.icons_enabled,
    opts = {
      override = {
        default_icon = { icon = require("astronvim.utils").get_icon "DefaultFile" },
        deb = { icon = "", name = "Deb" },
        lock = { icon = "󰌾", name = "Lock" },
        mp3 = { icon = "󰎆", name = "Mp3" },
        mp4 = { icon = "", name = "Mp4" },
        out = { icon = "", name = "Out" },
        ["robots.txt"] = { icon = "󰚩", name = "Robots" },
        ttf = { icon = "", name = "TrueTypeFont" },
        rpm = { icon = "", name = "Rpm" },
        woff = { icon = "", name = "WebOpenFontFormat" },
        woff2 = { icon = "", name = "WebOpenFontFormat2" },
        xz = { icon = "", name = "Xz" },
        zip = { icon = "", name = "Zip" },

        ["controller.ts"] = {
          icon = "🌐", -- 󰊰 , 󰊱 , 󰊲 , 󰊳 , 🌐
          name = "Controller",
        },
        ["controller.js"] = {
          icon = "🌐",
          name = "Controller (JS)",
        },
        ["service.ts"] = {
          icon = "󰒪",
          name = "Service",
        },
        ["service.js"] = {
          icon = "󰒪",
          name = "Service (JS)",
        },
        ["module.ts"] = {
          icon = "📦",
          name = "Module",
        },
        ["module.js"] = {
          icon = "📦",
          name = "Module (JS)",
        },
        ["guard.ts"] = {
          icon = "🛡️",
          name = "Guard",
        },
        ["guard.js"] = {
          icon = "🛡️",
          name = "Guard (JS)",
        },
        ["pipe.ts"] = {
          icon = "󱒴",
          name = "Pipe",
        },
        ["pipe.js"] = {
          icon = "󱒴",
          name = "Pipe (JS)",
        },
        ["middleware.ts"] = {
          icon = "󰥏",
          name = "Middleware",
        },
        ["middleware.js"] = {
          icon = "󰥏",
          name = "Middleware (JS)",
        },
        ["decorator.ts"] = {
          icon = "󱄯",
          name = "Decorator",
        },
        ["decorator.js"] = {
          icon = "󱄯",
          name = "Decorator (JS)",
        },
        ["filter.ts"] = {
          icon = "󱒾",
          name = "Filter",
        },
        ["filter.js"] = {
          icon = "󱒾",
          name = "Filter (JS)",
        },
        ["resolver.ts"] = {
          icon = "🧩",
          name = "Resolver",
        },
        ["resolver.js"] = {
          icon = "🧩",
          name = "Resolver (JS)",
        },
        ["entity.ts"] = {
          icon = "󱓜",
          name = "Entity",
        },
        ["entity.js"] = {
          icon = "󱓜",
          name = "Entity (JS)",
        },
        ["dto.ts"] = {
          icon = "󱢹",
          name = "Dto",
        },
        ["dto.js"] = {
          icon = "󱢹",
          name = "Dto (JS)",
        },
      },
    },
  },
  {
    "onsails/lspkind.nvim",
    opts = {
      mode = "symbol",
      symbol_map = {
        Array = "󰅪",
        Boolean = "⊨",
        Class = "󰌗",
        Constructor = "",
        Key = "󰌆",
        Namespace = "󰅪",
        Null = "NULL",
        Number = "#",
        Object = "󰀚",
        Package = "󰏗",
        Property = "",
        Reference = "",
        Snippet = "",
        String = "󰀬",
        TypeParameter = "󰊄",
        Unit = "",
      },
      menu = {},
    },
    enabled = vim.g.icons_enabled,
    config = require "plugins.configs.lspkind",
  },
  {
    "rcarriga/nvim-notify",
    init = function() require("astronvim.utils").load_plugin_with_func("nvim-notify", vim, "notify") end,
    opts = {
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 175 })
        if not vim.g.ui_notifications_enabled then vim.api.nvim_win_close(win, true) end
        if not package.loaded["nvim-treesitter"] then pcall(require, "nvim-treesitter") end
        vim.wo[win].conceallevel = 3
        local buf = vim.api.nvim_win_get_buf(win)
        if not pcall(vim.treesitter.start, buf, "markdown") then vim.bo[buf].syntax = "markdown" end
        vim.wo[win].spell = false
      end,
      render = "compact",
      max_height = 10,
      max_width = 80,
      timeout = 1000,
    },
    config = require "plugins.configs.notify",
  },
  {
    "stevearc/dressing.nvim",
    init = function() require("astronvim.utils").load_plugin_with_func("dressing.nvim", vim.ui, { "input", "select" }) end,
    opts = {
      input = { default_prompt = "➤ " },
      select = { backend = { "telescope", "builtin" } },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "User AstroFile",
    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers" },
    opts = { user_default_options = { names = false } },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User AstroFile",
    opts = {
      buftype_exclude = {
        "nofile",
        "terminal",
      },
      filetype_exclude = {
        "help",
        "startify",
        "aerial",
        "alpha",
        "dashboard",
        "lazy",
        "neogitstatus",
        "NvimTree",
        "neo-tree",
        "Trouble",
      },
      context_patterns = {
        "class",
        "return",
        "function",
        "method",
        "^if",
        "^while",
        "jsx_element",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
        "if_statement",
        "else_clause",
        "jsx_element",
        "jsx_self_closing_element",
        "try_statement",
        "catch_clause",
        "import_statement",
        "operation_type",
      },
      show_trailing_blankline_indent = false,
      use_treesitter = true,
      char = "▏",
      context_char = "▏",
      show_current_context = true,
    },
  },
}
