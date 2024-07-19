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
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
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

  -- {
  --   "lunarvim/bigfile.nvim",
  --   config = function()
  --     require("bigfile").setup()
  --   end,
  --   event = { "FileReadPre", "BufReadPre", "User FileOpened" },
  -- },

  -- For productivity metrics, goals, leaderboards, and automatic time tracking
  { "wakatime/vim-wakatime", lazy = false },

  {
    "echasnovski/mini.pairs",
    opts = {
      mappings = {
        ["'"] = {},
      },
    },
  },
}
