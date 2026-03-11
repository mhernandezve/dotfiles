return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
    "ravitemer/mcphub.nvim",
  },

  config = function(_, opts)
    require("codecompanion").setup(opts)
  end,

  opts = {
    adapters = {},

    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_tools = true,
          show_server_tools_in_chat = true,
          add_mcp_prefix_to_tool_names = false,
          show_result_in_chat = true,
          make_vars = false,
          make_slash_commands = true,
        },
      },

      history = {
        enabled = true,
        opts = {
          keymap = "gh",
          auto_save = true,
          expiration_days = 0,
          picker = "fzf-lua",
          dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
          picker_keymaps = {
            rename = { n = "r", i = "<M-r>" },
            delete = { n = "d", i = "<M-d>" },
            duplicate = { n = "<C-y>", i = "<C-y>" },
          },
          auto_generate_title = true,
          summary = {
            create_summary_keymap = "gcs",
            browse_summaries_keymap = "gbs",
            generation_opts = {
              context_size = 90000,
              include_references = true,
              include_tool_outputs = true,
            },
          },
          memory = {
            auto_create_memories_on_summary_generation = true,
            vectorcode_exe = "vectorcode",
            tool_opts = { default_num = 10 },
            notify = true,
            index_on_startup = false,
          },
        },
      },
    },
  },
}
