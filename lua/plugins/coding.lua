return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap.preset = "none"
      opts.keymap["<Tab>"] = { "accept" }
      opts.keymap["<CR>"] = { "fallback" }
      opts.keymap["<C-n>"] = { "select_next" } -- Ctrl-n moves down
      opts.keymap["<C-p>"] = { "select_prev" } -- Ctrl-p moves up
      return opts
    end,
  },
  -- copilot
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          accept_word = "<M-l>",
          accept_line = "<M-S-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        markdown = true,
        help = true,
        ["*"] = true,
      },
    },
  },
}
