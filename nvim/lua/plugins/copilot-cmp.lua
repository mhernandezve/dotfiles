return {
  "zbirenbaum/copilot-cmp",
  config = function()
    require("copilot_cmp").setup()
  end,
  dependencies = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end,
 },
}
