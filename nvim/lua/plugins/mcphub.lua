-- lua/plugins/mcphub.lua
return {
  "ravitemer/mcphub.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  build = "npm install -g mcp-hub@latest",
  config = function()
    require("mcphub").setup({
      config = vim.fn.expand("~/.config/mcphub/servers.json"),
      port = 37373,
      shutdown_delay = 5 * 60 * 1000, -- 5 min (antes lo tenías en 0ms)
      use_bundled_binary = false,
      mcp_request_timeout = 60000,
      workspace = {
        enabled = true,
        look_for = { ".mcphub/servers.json", ".vscode/mcp.json", ".cursor/mcp.json" },
        reload_on_dir_changed = true,
        port_range = { min = 40000, max = 41000 },
      },
    })
  end,
}
