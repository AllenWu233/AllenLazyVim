-- ----- Change Settings ----- --

-- Use for "mfussenegger/nvim-dap"
-- Return pure folder name of the path
-- Example: "/home/user/project" -> "project"
local function get_workspace_folder_name(path)
  local ts = string.reverse(path)
  local _, i = string.find(ts, "/")
  local m = string.len(ts) - i + 1 -- last '/'
  return string.sub(path, m + 1)
end

return {
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  -- Disable virtual text in lines
  -- To show diagnostics, move cursor to the line to show a floating window
  -- See `autocmds.lua` to get more
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
    },
  },

  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false, -- Set false to auto cd worksapce folder
    },
  },

  -- Set indent width of LSP formatter for c/cpp
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["cpp"] = { "clang_format" },
        ["c"] = { "clang_format" },
      },
      formatters = {
        clang_format = {
          prepend_args = { "-style={ IndentWidth: 4 }" },
        },
      },
    },
  },

  -- {
  --   "folke/which-key.nvim",
  --   opts = {
  --     defaults = {
  --       ["<leader>d"] = { name = "+debug" },
  --     },
  --   },
  -- },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      -- Ensure C/C++ debugger is installed
      "williamboman/mason.nvim",
      optional = true,
      opts = function(_, opts)
        if type(opts.ensure_installed) == "table" then
          vim.list_extend(opts.ensure_installed, { "codelldb" })
        end
      end,
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters["codelldb"] then
        require("dap").adapters["codelldb"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "codelldb",
            args = {
              "--port",
              "${port}",
            },
          },
        }
      end
      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = {
          {
            type = "codelldb",
            request = "launch",
            name = "Launch file",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bin/program", "file")
            end,
            cwd = "${workspaceFolder}",
          },
          {
            type = "codelldb",
            request = "attach",
            name = "Attach to process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
      dap.configurations.rust = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            -- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bin/program", "file")
            return vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. "/target/debug/" .. get_workspace_folder_name(vim.fn.getcwd()),
              "file"
            )
          end,
          cwd = "${workspaceFolder}",
        },
      }
    end,
  },

  {
    "folke/noice.nvim",
    opts = {
      routes = {
        -- Disable compile SUCCESS/FAILURE notification for compiler.nvim
        {
          filter = {
            event = "notify",
            kind = "info",
            any = {
              -- { event = "compiler.nvim" },
              -- { find = "compiler" },
              { find = "SUCCESS" },
              { find = "FAILURE" },
            },
          },
          opts = { skip = true },
        },
      },
    },
  },
}
