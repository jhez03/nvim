return {
  {
    "neovim/nvim-lspconfig",
    opts = {
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
    },
  },
}
