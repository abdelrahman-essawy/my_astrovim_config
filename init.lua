return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "astrodark",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.g.nvim_lsp_code_lens =
    --   1,
    -- Define a command to trigger code lens display
    -- vim.cmd [[command! -nargs=0 ShowCodeLens lua require('my_module').show_code_lens()]]

    -- -- Define a function to show code lens
    -- local function show_code_lens()
    --   local bufnr = vim.api.nvim_get_current_buf()
    --   local client_id = vim.lsp.get_active_clients()[1].id -- Assuming you have an active LSP client
    --
    --   -- Create your code lens actions (replace this with actual actions)
    --   local code_lens_actions = {
    --     -- Define your code lens actions here
    --   }
    --
    --   -- Display the code lens actions
    --   vim.lsp.codelens.display(code_lens_actions, bufnr, client_id)
    -- end

    -- Export the function
    -- vim.api.nvim_set_var("my_module", { show_code_lens = show_code_lens })
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    --
    --
    -- if File_watchers == nil then File_watchers = {} end
    -- local watch_file_augroup = "watch_file_augroup"
    -- vim.api.nvim_create_augroup(watch_file_augroup, { clear = true })
    -- vim.api.nvim_create_autocmd("VimLeave", {
    --   group = watch_file_augroup,
    --   callback = function()
    --     for _, watcher in pairs(File_watchers) do
    --       watcher:stop()
    --     end
    --   end,
    -- })
    -- local function watch_file(fname, cb, time)
    --   if File_watchers[fname] then
    --     File_watchers[fname]:stop()
    --     File_watchers[fname] = nil
    --   end
    --
    --   File_watchers[fname] = vim.loop.new_fs_poll()
    --   File_watchers[fname]:start(fname, time, vim.schedule_wrap(cb))
    -- end
    --
    -- local init_lua = vim.fn.stdpath "/lua/**"
    -- watch_file(init_lua, function()
    --   dofile(init_lua)
    --   vim.notify("Reloaded init.lua", vim.diagnostic.severity.INFO)
    -- end, 500)
  end,
}
