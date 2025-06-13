return {
  {
    "mfussenegger/nvim-lint",
    event = "BufReadPost",
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        yaml = { "yamllint" },
      },
    },
  },
}
