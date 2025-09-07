return {
  'nvim-mini/mini.files',
  config = function()
    require('mini.files').setup({
      lazy = false,
      opts = {
        options = {
          use_as_default_explorer = true,
          go_in = false,
        },
      },
      windows = {
        max_number = math.huge,
        preview = true,
        width_preview = 50,
        width_with_focus = 25,
      },
      mappings = {
        -- Map 't' to open the selected file in a new tab
        -- ['t'] = 'open.tab',
        ['<C-t>'] = function(fs_entry)
          vim.cmd('tabnew ' .. fs_entry.path)
        end,
        go_in = 'L',
        go_in_plus = 'l',
      },
    })
  end,
}
