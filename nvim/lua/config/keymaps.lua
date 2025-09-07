local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and quit" })
keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "Quit without saving" })
keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Save" })
keymap.set("n", "gx", ":!open <c-r><c-a><CR>", { desc = "Open URL under cursor" })

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close split window" })
keymap.set("n", "<leader>sj", "<C-w>-", { desc = "Make split window height shorter" })
keymap.set("n", "<leader>sk", "<C-w>+", { desc = "Make split windows height taller" })
keymap.set("n", "<leader>sl", "<C-w>>5", { desc = "Make split windows wi#th bigger " })
keymap.set("n", "<leader>sh", "<C-w><5", { desc = "Make split windows width smaller" })

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open a new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close a tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>", { desc = "Put diff from current to other during diff" })
keymap.set("n", "<leader>cj", ":diffget 1<CR>", { desc = "get diff from left (local) during merge" })
keymap.set("n", "<leader>ck", ":diffget 3<CR>", { desc = "get diff from right (remote) during merge" })
keymap.set("n", "<leader>cn", "]c", { desc = "Next diff hunk" })
keymap.set("n", "<leader>cp", "[c", { desc = "Previous diff hunk" })

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "Open quickfix list" })
keymap.set("n", "<leader>qf", ":cfirst<CR>", { desc = "Jump to first quickfix list item" })
keymap.set("n", "<leader>qn", ":cnext<CR>", { desc = "Jump to next quickfix list item" })
keymap.set("n", "<leader>qp", ":cprev<CR>", { desc = "Jump to prev quickfix list item" })
keymap.set("n", "<leader>ql", ":clast<CR>", { desc = "Jump to last quickfix list item" })
keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = "Close quickfix list" })

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Toggle maximize tab" })

-- Oil.nvim
keymap.set("n", "<leader>e", require('oil').toggle_float, { desc = "Toggle file explorer" })

-- Minifiles
local minifiles_builtin = require('mini.files')
keymap.set("n", "<leader>m", function() minifiles_builtin.open() end, { desc = "Toggle minifiles" })

-- FzfLua
local fzflua_builtin = require('fzf-lua')
keymap.set('n', '<leader>ff', function() fzflua_builtin.files({ fzf_opts = { ['--layout'] = 'reverse-list' } }) end,
  { desc = "Find files" })
keymap.set('n', '<leader>fG', fzflua_builtin.grep, { desc = "Grep" })
keymap.set('n', '<leader>fw', function() fzflua_builtin.grep_cword({ fzf_opts = { ['--layout'] = 'reverse-list' } }) end,
  { desc = "Search cword" })
keymap.set('n', '<leader>fW', function() fzflua_builtin.grep_cWORD({ fzf_opts = { ['--layout'] = 'reverse-list' } }) end,
  { desc = "Search cWORD" })
keymap.set('n', '<leader>fL', function() fzflua_builtin.grep_last({ fzf_opts = { ['--layout'] = 'reverse-list' } }) end,
  { desc = "Grep Last" })
keymap.set('n', '<leader>fl', function() fzflua_builtin.live_grep({ fzf_opts = { ['--layout'] = 'reverse-list' } }) end,
  { desc = "Live Grep" })
keymap.set('n', '<leader>fb', function() fzflua_builtin.buffers({ fzf_opts = { ['--layout'] = 'reverse-list' } }) end,
  { desc = "Find Buffers" })
keymap.set('n', '<leader>fh', fzflua_builtin.tags, { desc = "Help Tags" })
-- keymap.set('n', '<leader>fs', fzflua_builtin.current_buffer_fuzzy_find, {desc = "Current buffer fuzzy finder"})
keymap.set('n', '<leader>fo', fzflua_builtin.lsp_document_symbols, { desc = "LSP document symbols" })
keymap.set('n', '<leader>fi', fzflua_builtin.lsp_incoming_calls, { desc = "LSP incoming calls" })
keymap.set('n', '<leader>fd', fzflua_builtin.lsp_definitions, { desc = "LSP definitions" })
keymap.set('n', '<leader>fm', fzflua_builtin.treesitter, { desc = "Find method" })
keymap.set('n', '<leader>fq', fzflua_builtin.quickfix, { desc = "Quickfix method" })
keymap.set('n', '<leader>fgs', fzflua_builtin.git_status, { desc = "Git status" })
keymap.set('n', '<leader>fgf', fzflua_builtin.git_files, { desc = "Git files" })
keymap.set('n', '<leader>fgb', fzflua_builtin.git_branches, { desc = "Git branches" })

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Toggle git blame" })

-- Harpoon
local harpoon_builtin = require('harpoon.ui')
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Harpoon - Add file" })
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon - Quick menu" })
keymap.set("n", "<leader>h1", function() harpoon_builtin.nav_file(1) end, { desc = "Harpoon navigate file 1" })
keymap.set("n", "<leader>h2", function() harpoon_builtin.nav_file(2) end, { desc = "Harpoon navigate file 2" })
keymap.set("n", "<leader>h3", function() harpoon_builtin.nav_file(3) end, { desc = "Harpoon navigate file 3" })
keymap.set("n", "<leader>h4", function() harpoon_builtin.nav_file(4) end, { desc = "Harpoon navigate file 4" })
keymap.set("n", "<leader>h5", function() harpoon_builtin.nav_file(5) end, { desc = "Harpoon navigate file 5" })
keymap.set("n", "<leader>h6", function() harpoon_builtin.nav_file(6) end, { desc = "Harpoon navigate file 6" })
keymap.set("n", "<leader>h7", function() harpoon_builtin.nav_file(7) end, { desc = "Harpoon navigate file 7" })
keymap.set("n", "<leader>h8", function() harpoon_builtin.nav_file(8) end, { desc = "Harpoon navigate file 8" })
keymap.set("n", "<leader>h9", function() harpoon_builtin.nav_file(9) end, { desc = "Harpoon navigate file 9" })

-- Git Messenger
keymap.set("n", "<leader>gm", function() require("messenger").show() end, { desc = "Git Messenger Show" })

-- NeoGit
keymap.set("n", "<leader>ng", function() require("neogit").open() end, { desc = "NeoGit" })

-- Vim REST Console
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>", { desc = "Run REST query" })

-- LSP
keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = "Hover definition" })
keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = "Goto definition" })
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { desc = "Goto declaration" })
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = "Goto implementation" })
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { desc = "Type definition" })
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = "References" })
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = "Signature help" })
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = "Rename" })
keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', { desc = "Format" })
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = "Code action" })
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "Open float" })
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = "Goto previous" })
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = "Goto next" })
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { desc = "Document symbol" })
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>', { desc = "Completion" })

-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
  { desc = "Breakpoint condition" })
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
  { desc = "Log point message" })
keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Clear breakpoints" })
keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>', { desc = "List breakpoints" })
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue" })
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over" })
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into" })
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step out" })
keymap.set("n", '<leader>dd', function()
  require('dap').disconnect(); require('dapui').close();
end, { desc = "Disconnect" })
keymap.set("n", '<leader>dt', function()
  require('dap').terminate(); require('dapui').close();
end, { desc = "Terminate" })
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Toggle" })
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Run last" })
keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end, { desc = "Widgets" })
keymap.set("n", '<leader>d?',
  function()
    local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
  end, { desc = "Widgets" })
keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>', { desc = "Telescope DAP frames" })
keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>', { desc = "Telescope DAP commands" })
keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({ default_text = ":E:" }) end,
  { desc = "Diagnostics" })
