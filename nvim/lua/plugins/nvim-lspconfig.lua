-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- LSP Management
    -- https://github.com/mason-org/mason.nvim
    { 'mason-org/mason.nvim' },
    -- https://github.com/mason-org/mason-lspconfig.nvim
    { 'mason-org/mason-lspconfig.nvim' },
    -- Useful status updates for LSP
    -- https://github.com/j-hui/fidget.nvim
    { 'j-hui/fidget.nvim', opts = {} },
    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/neodev.nvim
    { 'folke/lazydev.nvim', opts = {} },
    { 'ray-x/lsp_signature.nvim' },
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup {
      automatic_enable = true,
      -- Install these LSPs automatically
      ensure_installed = {
        -- 'bashls', -- requires npm to be installed
        -- 'cssls', -- requires npm to be installed
        -- 'html', -- requires npm to be installed
        'lua_ls',
        -- 'jsonls', -- requires npm to be installed
        'lemminx',
        'marksman',
        'quick_lint_js',
        'ts_ls',
        'tflint',
        -- 'tsserver', -- requires npm to be installed
        -- 'yamlls', -- requires npm to be installed
      }
    }

    -- Lua LSP settings
    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    }

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      return open_floating_preview(contents, syntax, opts, ...)
    end

  end
}

