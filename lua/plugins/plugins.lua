-- ----- Add Plugins ----- --

return {
  {
    "h-hg/fcitx.nvim", -- better input method
    event = { "FileReadPre", "BufReadPre", "User FileOpened" },
  },

  {
    "norcalli/nvim-colorizer.lua", -- color highlight
    cmd = { "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffer", "ColorizerToggle" },
  },

  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim" },
    opts = {},
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },

  {
    "lunarvim/bigfile.nvim",
    config = function()
      require("bigfile").setup()
    end,
    event = { "FileReadPre", "BufReadPre", "User FileOpened" },
  },

  -- {
  --   "https://git.sr.ht/~swaits/zellij-nav.nvim",
  --   event = "VeryLazy",
  --   keys = {
  --     { "<M-h>", "<cmd>ZellijNavigateLeft<cr>", { silent = true, desc = "Navigate Left" } },
  --     { "<M-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "Navigate Down" } },
  --     { "<M-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "Navigate Up" } },
  --     { "<M-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "Navigate Right" } },
  --   },
  --   opts = {},
  -- },
}
