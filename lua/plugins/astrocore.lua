-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        scrolloff = 20, -- is one of my fav
        sidescrolloff = 20,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
        ------------
        -- quick save
        ["<leader>q"] = { "", desc = "Quit" },
        ["<leader>qq"] = { "<cmd>confirm q<cr>", desc = "Quit" },

        ["<leader>le"] = { "<cmd>!eslint --fix %<cr>", desc = "Eslint fix" },
        ["gh"] = { "<cmd>UndotreeToggle<cr>", desc = "History" },
        -- Navigate buffers
        ["<Tab>"] = { "<cmd>bnext<CR>", desc = "Next Buffer" },
        ["<S-Tab>"] = { "<cmd>bprevious<CR>", desc = "Prev buffer" },
        ["gs"] = { "<Cmd>Sort<CR>", desc = "Sort" },
        ["<A-j>"] = { ":m .+1<CR>==", desc = "Move down" },
        ["<A-k>"] = { ":m .-2<CR>==", desc = "Move up" },
        ["<c-C>"] = { ':let @+ = expand("%:.") .. ":" .. line(".") <cr>', desc = "copy path" },

        ["ge"] = { function() vim.diagnostic.goto_next() end, desc = "next error" },
        ["gE"] = { function() vim.diagnostic.goto_prev() end, desc = "prev error" },
        ["<leader>hc"] = { function() require("console_log").console() end, desc = "console log" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },

      i = {
        ["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" }, -- change description but the same command
        ["<A-j>"] = { ":m '>+1<CR>gv=gv", desc = "Move down" },
        ["<A-k>"] = { ":m '<-2<CR>gv=gv", desc = "Move up" },
        ["<C-S-c>"] = { ':let @+ = "Line: " .. line(".") .. ", File: " .. expand("%:.") <cr>', desc = "copy path" },
      },
      v = {
        ["gs"] = { "<Esc><Cmd>Sort<CR>", desc = "Sort" },
        ["<A-j>"] = { ":m '>+1<CR>gv=gv", desc = "Move down" },
        ["<A-k>"] = { ":m '<-2<CR>gv=gv", desc = "Move up" },
        ["p"] = { '"_dP', desc = "" },
        ["<C-S-c>"] = { ':let @+ = "Line: " .. line(".") .. ", File: " .. expand("%:.") <cr>', desc = "copy path" },
        ["<s-j>"] = { "j", desc = "" },
        ["<s-l>"] = { "l", desc = "" },
        ["<s-h>"] = { "h", desc = "" },
        ["<s-k>"] = { "k", desc = "" },
      },
    },
  },
}
