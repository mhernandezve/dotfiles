return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  event = "VeryLazy",
  opts = {
    -- opts = {
    --   log_level = 'DEBUG',
    -- },
    strategies = {
      chat = {
        adapter = 'geai',
        inline = 'geai',
      },
    },
    adapters = {
      http = {
        geai = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            formatted_name = "GEAI",
            env = {
              url = "GEAI_ENDPOINT",
              api_key = "GEAI_API_KEY",
              chat_url = "/chat/completions",
              models_endpoint = "/models",

            },
            schema = {
              model = {
                default = "saia:assistant:test",
                choices = {
                  "saia:assistant:test", -- Assistant
                  "saia:search:test",    -- RAG Assistant
                  "saia:agent:test"      -- Agents
                },
              },
            },
            opts = {
              temperature = 0.5,
              max_tokens = 8192,
            },
          })
        end,
        display = {
          diff = {
            enabled = true,
            close_chat_at = 240,
            layout = 'vertical',
            opts = {
              "internal",
              "filler",
              "closeoff",
              "algorithm:patience",
              "followwrap",
              "linematch:120"
            },
            provider = "geai",
          },
        },
      },
    },
  },
}
