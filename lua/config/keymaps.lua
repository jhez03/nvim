vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- undo
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle Undo Tree" })
-- File explorer
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

-- Format code (uses LSP)
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

-- Go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

-- Show hover doc
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- greatest remap ever
-- paste without losing current register
vim.keymap.set({ "n", "v" }, "<leader>p", '"_dP', { desc = "Paste without losing current register" })

-- open current working directory of a buffer --
vim.keymap.set("n", ";b", function()
  local buf_dir = vim.fn.expand("%:p:h")
  if buf_dir == "" then
    buf_dir = vim.loop.cwd()
  end
  require("lazyvim.util").terminal(nil, { cwd = buf_dir })
end, { desc = "Terminal (Buffer Dir)" })

-- telescope file browser
vim.keymap.set("n", "<leader>fd", function()
  require("telescope").extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = vim.fn.expand("%:p:h"),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 },
  })
end, { desc = "Telescope File Browser" })

-- indent keymap
vim.api.nvim_set_keymap("n", "<leader>i", "gg=G``", { noremap = true, silent = true })
