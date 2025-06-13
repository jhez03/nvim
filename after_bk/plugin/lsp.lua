-- setup lsp servers
local lspconfig = require('lspconfig')
local servers = {
  'intelephense', -- PHP
  'tsserver', -- TypeScript/JavaScript
  'emmetls', -- HTML
  'cssls',    -- CSS
  'jsonls',   -- JSON
}
-- default capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

--PHP lsp setup
lspconfig.intelephense.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Disable formatting for PHP
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

-- auto completion setup
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
        require("lunar.snip").lsp_expand(args.body) -- For luasnip users
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
  },
})
