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
      },
      -- This disables fallback to LSP for all files; you can also do this per-filetype
      lsp_fallback = false,
    },
  },
}
