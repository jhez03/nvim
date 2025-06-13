-- File: lua/keymaps/harpoon.lua

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Set keymaps
vim.keymap.set("n", "<leader>H", function()
  mark.add_file()
end, { desc = "Harpoon File" })

vim.keymap.set("n", "<leader>h", function()
  ui.toggle_quick_menu()
end, { desc = "Harpoon Quick Menu" })

for i = 1, 5 do
  vim.keymap.set("n", "<leader>" .. i, function()
    ui.nav_file(i)
  end, { desc = "Harpoon to File " .. i })
end

