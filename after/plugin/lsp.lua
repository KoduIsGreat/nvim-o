local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "rust_analyzer",
  "gopls",
  "volar",
})

-- Fix Undefined global 'vim'
lsp.configure("lua-language-server", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
-- lsp.configure("vue-language-serverr", {
--   settings = {
--     Vue = {
--       format = {
--         enable = false,
--       },
--     },
--   },
-- })
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})
-- lsp.format_on_save("gq", {
--   format_opts = {
--     async = false,
--     timeout_ms = 10000,
--   },
--   servers = {
--     ["volar"] = { "vue" },
--     ["tsserver"] = { "javascript", "typescript" },
--     ["gopls"] = { "go" },
--     -- ["rust_analyzer"] = { "rust" },
--     -- ['lua_ls'] = {'lua'},
--     -- ['rust_analyzer'] = {'rust'},
--     -- if you have a working setup with null-ls
--     -- you can specify filetypes it can format.
--     -- ['null-ls'] = {'javascript', 'typescript'},
--   },
-- })
lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
})

lsp.on_attach(function(client, bufnr)
  require("navigator.lspclient.mapping").setup({ client = client, bufnr = bufnr }) -- setup navigator keymaps here,
  require("navigator.dochighlight").documentHighlight(bufnr)
  require("navigator.codeAction").code_action_prompt(bufnr)
end)

require("lspconfig").volar.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentFormattingRangeProvider = false
  end,
  on_init = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentFormattingRangeProvider = false
  end,
})

require("lspconfig").tsserver.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentFormattingRangeProvider = false
  end,
  on_init = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentFormattingRangeProvider = false
  end,
})

lsp.setup()
vim.diagnostic.config({
  virtual_text = true,
})
