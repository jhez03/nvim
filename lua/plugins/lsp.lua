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
        intelephense = {
          filetypes = { "php" },
          init_options = {
            format = {
              enable = false,
            },
          },
        },
      },
      setup = {
        intelephense = function(_, opts)
          local orig_on_attach = opts.on_attach
          opts.on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            if orig_on_attach then
              orig_on_attach(client, bufnr)
            end
          end
        end,
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
