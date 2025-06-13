return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {
          capabilities = (function()
            return vim.lsp.protocol.make_client_capabilities()
          end)(),
          filetypes = {
            "html",
            "php",
            "js",
          },
          init_options = {
            html = {
              ["bem.enabled"] = true,
            },
          },
        },
      },
      capabilities = (function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        if cmp_ok then
          capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
        end
        return capabilities
      end)(),
    },
  },
}
