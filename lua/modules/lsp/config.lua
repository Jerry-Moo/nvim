local config = {}

function config.lspsaga()
  require('lspsaga').setup({
    symbol_in_winbar = {
      ignore_patterns = { '%w_spec' },
    },
  })
end

function config.mason()
  require('mason').setup({
    ui = {
      -- Whether to automatically check for new versions when opening the :Mason window.
      check_outdated_packages_on_open = true,
      width = 0.5,
      height = 0.8,
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })
end

function config.nvim_cmp()
  local cmp = require('cmp')

  cmp.setup({
    preselect = cmp.PreselectMode.Item,
    formatting = {
      fields = { 'abbr', 'kind', 'menu' },
      format = require('lspkind').cmp_format({
        mode = "symbol_text",
        menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          path = "[Path]",
          buffer = "[Buffer]",
        }),
      }),
    },
    -- You can set mappings if you want
    mapping = cmp.mapping.preset.insert({
      ['Up'] = cmp.mapping.select_prev_item( { behavior = cmp.SelectBehavior.Insert }),
      ['Down'] = cmp.mapping.select_next_item( { behavior = cmp.SelectBehavior.Insert }),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<TAB>'] = cmp.mapping(function(fallback)
        local ok, luasnip = pcall(require, 'luasnip')
        local luasnip_status = false
        if ok then
          luasnip_status = luasnip.expand_or_jumpable()
        end

        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip_status then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's'} ),
      ['<S-TAB>'] = cmp.mapping(function(fallback)
        local _, luasnip = pcall(require, 'luasnip')

        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' },
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  })
end

return config
