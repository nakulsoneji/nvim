local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" }
    },
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
  },
}

function M.config()
  local cmp = require('cmp')
  local cmp_action = require('lsp-zero').cmp_action()
  local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

  require('luasnip.loaders.from_vscode').lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    --[[formatting = {
      format = function(entry, item)
        item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          path = "[Path]",
        })[entry.source.name]

        return item
      end,
    },]]--
    window = {
      completion = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
      },
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
      }
    },
    experimental = {
      ghost_text = true,
    },
    formatting = {
      fields = {"abbr", "menu", "kind"},
      format = require('lspkind').cmp_format({
        mode = 'symbol_text', -- show only symbol and text annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters
        preset = "codicons",
        symbol_map = { Copilot = " " },
        ellipsis_char = '...',-- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead })
      }),
    },
    mapping = {
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      ['<C-y>'] = cmp.mapping.confirm({select = true}),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
      ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
      ['<C-p>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item(cmp_select_opts)
        else
          cmp.complete()
        end
      end),
      ['<C-n>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_next_item(cmp_select_opts)
        else
          cmp.complete()
        end
      end),
    },
    sources = {
      {name = 'nvim_lsp'},
      {name = 'luasnip'},
      {name = 'path'},
      {name = 'buffer'},
    }
  })
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      {
        name = 'cmdline',
        option = {
          ignore_cmds = { 'Man', '!' }
        }
      }
    })
  })
end

return M
