-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    -- Select all
    ["<C-a>"] = { "ggVG", desc = "Select All" },
    -- reload config
    ["<leader>rc"] = { ":luafile ~/.config/nvim/init.lua<cr>", desc = "Reload Config" },

    -- TypeScript formatting
    ["<leader>tf"] = {
      function()
        vim.cmd "TypescriptRemoveUnused"
        vim.cmd "TypescriptAddMissingImports"
        vim.cmd "TypescriptOrganizeImports"
        vim.cmd "Format"
      end,
      desc = "Format TypeScript",
    },
    ["yp"] = { "yyp", desc = "Yank link and paste it below" },
    ["yP"] = { "yyp", desc = "Yank link and paste it above" },

    -- cut
    ["xx"] = { "dd", desc = "Cut with copying to clipboard" },
    ["X"] = { "D", desc = "Cut with copying to clipboard" },

    -- change without copying to clipboard
    ["cc"] = { '"_cc', desc = "Change line" },
    ["C"] = { '"_C', desc = "Change to the end of line" },

    -- Telescope projects
    ["<leader>fp"] = {
      ":lua require'telescope'.extensions.project.project{}<CR>",
      desc = "Find projects",
    },
  },
  t = {
    -- press <esc> to hide the terminal
  },
  i = {
    ["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" },
    ["<C-a>"] = { "<esc>ggVG", desc = "Select All" },
    ["<C-f>"] = { "<esc><Right>cw", desc = "Change word forward" },
    -- ["<C-c>'"] = { "<esc>ci'", desc = "Change inside single quotes" },
    -- ['<C-c>"'] = { '<esc>ci"', desc = "Change inside dounle quotes" },
    ["<C-0>"] = { "<esc>ci)", desc = "Change inside parentheses" },
    ["<C-]>"] = { "<esc>ci]", desc = "Change inside brackets" },
    ["<C-}>"] = { "<esc>ci}", desc = "Change inside braces" },
    ["<C-d>"] = { "<esc>dd", desc = "Delete line" },
    ["<C-o>"] = { "<esc>o", desc = "insert line" },
    ["<C-u>"] = { "<esc>u", desc = "Undo" },
    ["<C-r>"] = { "<esc><C-r>", desc = "Redo" },
    ["<C-c>"] = { "<esc>cc", desc = "change line" },
  },
}
