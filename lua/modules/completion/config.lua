local config = {}


-- config server in this function
function config.nvim_lsp()
  require('modules.completion.lspconfig')
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

function config.lspsaga()
  require('lspsaga').setup({})
end

return config
