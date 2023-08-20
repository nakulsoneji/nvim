local M =  {
  'hrsh7th/nvim-cmp',
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
    'L3MON4D3/LuaSnip',
  }
}

function M.config()
  local cmp = require('cmp')
  local cmp_action = require('lsp-zero').cmp_action()
  local lspkind = require('lspkind')
  local luasnip = require("luasnip")
  require('luasnip.loaders.from_vscode').lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    formatting = {
      format = lspkind.cmp_format({
        maxwidth = 30,
        mode = "symbol_text",
        ellipses_char = "...",
      }),
    },
    window = {
      documentation = cmp.config.window.bordered(),
      completion = cmp.config.window.bordered(),
    },
    sources = {
      {name = 'nvim_lsp'},
      {name = "path"},
      {name = "buffer"},
      {name = 'luasnip'},
    },
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({select = false}),
      ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    }
  })
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    },
    {
      {
        name = 'cmdline',
        option = {
          ignore_cmds = { 'Man', '!' }
        }
      }
    })
  })
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

end

return M
