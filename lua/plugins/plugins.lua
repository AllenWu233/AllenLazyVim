return {
  -- override nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        documentation = {
          border = "rounded",
          -- scrollbar = '║',
        },
        completion = {
          border = "rounded",
          -- scrollbar = '║',
        },
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      --   mapping = {
      --     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
      --     ["<C-Space>"] = cmp.mapping.complete(),
      --     ["<C-e>"] = cmp.mapping.abort(), -- 取消补全，esc也可以退出
      --     ["<CR>"] = cmp.mapping.confirm({ select = true }),
      --
      --     ["<Tab>"] = cmp.mapping(function(fallback)
      --       if cmp.visible() then
      --         cmp.select_next_item()
      --       elseif luasnip.expandable() then
      --         luasnip.expand()
      --       elseif luasnip.expand_or_jumpable() then
      --         luasnip.expand_or_jump()
      --       elseif check_backspace() then
      --         fallback()
      --       else
      --         fallback()
      --       end
      --     end, {
      --       "i",
      --       "s",
      --     }),
      --
      --     ["<S-Tab>"] = cmp.mapping(function(fallback)
      --       if cmp.visible() then
      --         cmp.select_prev_item()
      --       elseif luasnip.jumpable(-1) then
      --         luasnip.jump(-1)
      --       else
      --         fallback()
      --       end
      --     end, {
      --       "i",
      --       "s",
      --     }),
      --   },
    },
  },
}
