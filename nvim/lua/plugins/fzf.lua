return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},
  config = function()
    local fzf_lua = require("fzf-lua")
    fzf_lua.setup({
      winopts = {
        height = 0.85,
        width = 0.85,
        backdrop = 60,
        preview = {
          default = "bat",
          layout = "horizontal",
          horizontal = "right:60%",
          border = "sharp",
        },
      },
      fzf_opts = {
        -- options are sent as `<left>=<right>`
        -- set to `false` to remove a flag
        -- set to `true` for a no-value flag
        -- for raw args use `fzf_args` instead
        ["--ansi"]           = true,
        ["--info"]           = "inline-right", -- fzf < v0.42 = "inline"
        ["--height"]         = "100%",
        ["--layout"]         = "reverse",
        ["--border"]         = "none",
        ["--highlight-line"] = true,
      },
      actions = {
        -- Below are the default actions, setting any value in these tables will override
        -- the defaults, to inherit from the defaults change [1] from `false` to `true`
        files = {
          -- true,        -- uncomment to inherit all the below in your custom config
          -- Pickers inheriting these actions:
          --   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
          --   tags, btags, args, buffers, tabs, lines, blines
          -- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
          -- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
          -- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
          ["enter"]       = fzf_lua.actions.file_edit_or_qf,
          ["ctrl-s"]      = fzf_lua.actions.file_split,
          ["ctrl-v"]      = fzf_lua.actions.file_vsplit,
          ["ctrl-t"]      = fzf_lua.actions.file_tabedit,
          ["alt-q"]       = fzf_lua.actions.file_sel_to_qf,
          ["alt-Q"]       = fzf_lua.actions.file_sel_to_ll,
          ["alt-i"]       = fzf_lua.actions.toggle_ignore,
          ["alt-h"]       = fzf_lua.actions.toggle_hidden,
          ["alt-f"]       = fzf_lua.actions.toggle_follow,
        },
      }

    })
  end,
}
