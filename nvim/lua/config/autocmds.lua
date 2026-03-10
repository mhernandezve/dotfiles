local function augroup(name)
  return vim.api.nvim_create_augroup("nvim-starter" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("man_unlisted"),
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "codecompanion",
    "fugitive",
    "git",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- Auto format
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = augroup('LspFormatting'),
--   callback = function(args)
--     local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--     if client.server_capabilities.documentFormattingProvider then
--       vim.api.nvim_create_autocmd('BufWritePre', {
--         buffer = args.buf,
--         callback = function()
--           vim.lsp.buf.format({ async = false, id = client.id })
--         end,
--       })
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("User", {
  pattern = "OilEnter",
  callback = vim.schedule_wrap(function(args)
    local oil = require("oil")
    if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
      oil.open_preview()
    end
  end),
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("TerraformFmt"),
  pattern = { "*.tf", "*.tfvars" },
  callback = function(args)
    local buf = args.buf

    -- guarda vista (cursor/scroll) para que no “salte”
    local view = vim.fn.winsaveview()

    -- contenido actual del buffer
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

    -- temp file con extensión correcta (ayuda a terraform fmt)
    local tmp = vim.fn.tempname() .. ".tf"
    vim.fn.writefile(lines, tmp)

    -- fmt sobre el temporal
    local out = vim.fn.system({ "terraform", "fmt", tmp })
    if vim.v.shell_error ~= 0 then
      vim.notify("terraform fmt failed:\n" .. out, vim.log.levels.ERROR)
      pcall(vim.fn.delete, tmp)
      return
    end

    -- leer resultado y reemplazar buffer
    local formatted = vim.fn.readfile(tmp)
    pcall(vim.fn.delete, tmp)

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, formatted)

    -- restaurar vista
    vim.fn.winrestview(view)
  end,
})
