return {
  'stevearc/oil.nvim',
  dependencies = {
    { "echasnovski/mini.icons", opts = {} },
  },
  config = function()
    require("oil").setup({
      columns = {
        "icon",
      },
      buf_options = {
        buflisted = true,
        bufhidden = "hide",
      },
      -- win_options = {
      --   signcolumn = "yes:2",
      -- },
      view_options = {
        show_hidden = true,
      },
      preview_split = "auto",
    })
  end,
  lazy = false,
}
