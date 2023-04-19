local M = {}
local lspconfig = require('lspconfig')

-- 根据官方的提示, 这里我们使用 on_attach 表示当前缓冲加载服务端完成之后调, 用用于在 Language Server Protocol (LSP) 客户端与语言服务器建立连接时进行一些自定义设置
function M._attach(client, bufnr)
  -- 设置 LSP 客户端的补全功能, 即 <C-x><C-o>
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'
  -- 禁用语义令牌功能
  client.server_capabilities.semanticTokensProvider = nil
end

lspconfig.gopls.setup({
  cmd = { 'gopls', 'serve' },
  on_attach = function (client, _)
    local orignal = vim.notify
    local mynotify = function(msg, level, opts)
      if msg == 'No code actions available' then
        return
      end
      orignal(msg, level, opts)
    end

    vim.notify = mynotify
    M._attach(client)
  end,
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
  on_attach = M._attach,
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
  on_attach = M._attach,
  cmd = {
    'clangd',
    '--background-index',
    '--suggest-missing-includes',
    '--clang-tidy',
    '--header-insertion=iwyu',
  }
})

lspconfig.rust_analyzer.setup({
  on_attach = M._attach,
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
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = M._attach,
  })
end

-- 请求workspace/diagnostic/refresh从服务器发送到客户端. 手动刷新当前缓冲区的诊断信息.
vim.lsp.handlers['workspace/diagnostic/refresh'] = function(_, _, ctx)
  local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
  -- 获取当前缓冲区的编号
  local bufnr = vim.api.nvim_get_current_buf()
  vim.diagnostic.reset(ns, bufnr)
  return true
end

return M
