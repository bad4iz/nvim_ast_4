return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-emoji" },
    },
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the sources part of the options table
      opts.sources = cmp.config.sources {
        { name = "cmp_tabnine", priority = 1010 },
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
        { name = "emoji", priority = 700 }, -- add new source
      }

      -- modify the mapping part of the table
      -- opts.mapping["<C-j>"] = cmp.mapping.select_next_item()
      -- opts.mapping["<C-Space>"] = cmp.mapping.complete()
      -- opts.mapping["<C-m>"] = cmp.mapping.complete()

      -- return the nw table to be used
      return opts
    end,
    lazy = false,
  },
}
