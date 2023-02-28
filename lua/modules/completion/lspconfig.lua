local lspconfig = require('lspconfig')

local signs = {
  Error = ' ',
  Warn = ' ',
  Info = ' ',
  Hint = ' ',
}
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  signs = true,
  update_in_insert = true,
  severity_sort = true,
  virtual_text = {
    prefix = '🔥',
    source = true,
  },
})

-- 根据官方的提示，这里我们使用 on_attach 表示当前缓冲加载服务端完成之后调用
local function _attach(client, _)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'
  client.server_capabilities.semanticTokensProvider = nil
end

lspconfig.gopls.setup({
  cmd = { 'gopls', 'serve' },
  on_attach = _attach,
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
  },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

lspconfig.lua_ls.setup({
  on_attach = _attach,
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { 'vim' },
      },
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
          vim.env.HOME .. '/.local/share/nvim/lazy/emmylua-nvim',
        },
        checkThirdParty = false,
      },
      completion = {
        callSnippet = 'Replace',
      },
    },
  },
})

lspconfig.clangd.setup({
  on_attach = _attach,
  cmd = {
    'clangd',
    '--background-index',
    '--suggest-missing-includes',
    '--clang-tidy',
    '--header-insertion=iwyu',
  },
})

lspconfig.rust_analyzer.setup({
  on_attach = _attach,
  settings = {
    ['rust-analyzer'] = {
      imports = {
        granularity = {
          group = 'module',
        },
        prefix = 'self',
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

local servers = {
  'dockerls',
  'pyright',
  'bashls',
  'jsonls',
  'tsserver',
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({})
end

-- 请求workspace/diagnostic/refresh从服务器发送到客户端。服务器可以使用它来要求客户端刷新所有需要的文档和工作区诊断。
vim.lsp.handlers['workspace/diagnostic/refresh'] = function(_, _, ctx)
  local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
  local bufnr = vim.api.nvim_get_current_buf()
  vim.diagnostic.reset(ns, bufnr)
  return true
end
