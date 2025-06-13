return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "InsertEnter" },
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        json = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        yml = { "prettierd" },
        yaml = { "prettierd" },
        php = {},
      },
      -- Completely disable fallback to LSP
      lsp_fallback = false,

      -- Disable Conform's internal LSP formatter
      formatters = {
        lsp = {
          condition = function()
            return false
          end,
        },
      },
    },
  },
}

