return {
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'j-hui/fidget.nvim',   opts = {} },
  { 'hrsh7th/nvim-cmp' },
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      -- Reserve a space in the gutter
      vim.opt.signcolumn = 'yes'

      -- Enhance LSP capabilities with cmp_nvim_lsp
      local lspconfig_defaults = require('lspconfig').util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )
      -- LSP keymaps on attach
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'x' }, '<leader>fm', function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'ge', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '<leader>gq', vim.diagnostic.setloclist, opts)
          vim.keymap.set('n', 'g]', vim.diagnostic.get_next, opts)
          vim.keymap.set('n', 'g[', vim.diagnostic.get_prev, opts)
        end,
      })

      -- Set up Mason and LSP servers
      require('mason').setup()
      require('mason-lspconfig').setup({
        automatic_installation = true,
        ensure_installed = { 'lua_ls', 'rust_analyzer' },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        },
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.HINT] = '⚑',
            [vim.diagnostic.severity.INFO] = '»',
          },
        },
      })
      -- Set up nvim-cmp
      local cmp = require('cmp')
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
        },
        snippet = {
          expand = function(args)
            -- Make sure you're using Neovim 0.10+ for vim.snippet
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<Cr>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item({ select = true }),

          ['<S-Tab>'] = cmp.mapping.select_prev_item({ select = true }),
        }),
      })
    end
  },
}
