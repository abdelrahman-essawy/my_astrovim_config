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

    -- paste always to new line
    -- ["p"] = { 'o<C-R>"', desc = "Paste to new line" },
    -- ["P"] = { 'O<C-R>"', desc = "Paste to new line" },

    ["c'"] = { "<esc>\"_ci'", desc = "Change inside single quotes" },
    ['c"'] = { '<esc>"_ci"', desc = "Change inside dounle quotes" },
    -- Telescope projects
    ["<leader>fp"] = {
      ":lua require'telescope'.extensions.project.project{}<CR>",
      desc = "Find projects",
    },

    -- window navigation with ctrl + arrow keys
    ["<C-Left>"] = { "<C-w>h", desc = "Navigate left" },
    ["<C-Down>"] = { "<C-w>j", desc = "Navigate down" },
    ["<C-Up>"] = { "<C-w>k", desc = "Navigate up" },
    ["<C-Right>"] = { "<C-w>l", desc = "Navigate right" },

    ["<leader>uo"] = { ":SymbolsOutline<cr>", desc = "Open Outline" },

    -- open nautilus
    ["<leader>n"] = { ":!nautilus .<cr>", desc = "Open Nautilus" },

    -- show select terminal ui
    ["<leader>ts"] = { ":TermSelect<cr>", desc = "Toggle Terminal Select" },

    -- toggle terminal
    ["<leader>tt"] = { ":ToggleTerm<cr>", desc = "Toggle Terminal" },
    -- teminals from 1 to 0
    ["<leader>t1"] = {
      ":TermExec cmd='dev || pnpm start:dev' direction=horizontal<cr><ESC><C-k>",
      desc = "Open dev Terminal",
    },
    ["<leader>t2"] = { ":TermExec <cr>", desc = "Open Terminal 2" },
    ["<leader>t3"] = { ":TermExec <cr>", desc = "Open Terminal 3" },
    ["<leader>t4"] = { ":TermExec <cr>", desc = "Open Terminal 4" },
    ["<leader>t5"] = { ":TermExec <cr>", desc = "Open Terminal 5" },
    ["<leader>t6"] = { ":TermExec <cr>", desc = "Open Terminal 6" },
    ["<leader>t7"] = { ":TermExec <cr>", desc = "Open Terminal 7" },
    ["<leader>t8"] = { ":TermExec <cr>", desc = "Open Terminal 8" },
    ["<leader>t9"] = { ":TermExec <cr>", desc = "Open Terminal 9" },
    ["<leader>t0"] = { ":TermExec <cr>", desc = "Open Terminal 0" },
  },
  t = {
    -- press esc to exit terminal mode
    ["<esc>"] = { "<C-\\><C-n>", desc = "Exit Terminal Mode" },
  },
  i = {
    -- press caps to esc
    -- ["caps"] = { "escape", desc = "Caps to Esc in Insert Mode" },
    ["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" },
    ["<C-a>"] = { "<esc>ggVG", desc = "Select All" },
    ["<C-f>"] = { "<esc><Right>cw", desc = "Change word forward" },
    -- ["<C-'>"] = { "<esc>ci'", desc = "Change inside single quotes" },
    -- ['<C-">'] = { '<esc>ci"', desc = "Change inside dounle quotes" },
    ["<C-b>"] = { '<esc>"_c)"', desc = "Change inside parentheses" },
    ["<C-B>"] = { '<esc>"_c}"', desc = "Change inside parentheses" },
    ["<C-r>"] = { '<esc>"_c]"', desc = "Change inside parentheses" },
    ["<C-]>"] = { "<esc>ci]", desc = "Change inside brackets" },
    ["<C-}>"] = { "<esc>ci}", desc = "Change inside braces" },
    ["<C-d>"] = { "<esc>dd", desc = "Delete line" },
    ["<C-o>"] = { "<esc>o", desc = "insert line" },
    ["<C-u>"] = { "<esc>u", desc = "Undo" },
    -- ["<C-r>"] = { "<esc><C-r>", desc = "Redo" },
    ["<C-c>"] = { '<esc>"_cc', desc = "change line" },
  },
}
