return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    -- Set OpenAI as the default provider
    provider = "geai",
    providers = {
      provider = "openai", -- Default provider is OpenAI
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt5-mini",
        max_tokens = 8192,
      },
      ---@type AvanteProvider
      ["geai"] = {
        __inherited_from = 'openai',
        endpoint = "GEAI_ENDPOINT",
        model = "saia:assistant:test",
        max_tokens = 4096,
        api_key_name = "GEAI_API_KEY",
      },
    },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",       -- for file_selector provider mini.pick
    "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",            -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",      -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        instructions_file = "avante.md",
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = false,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
