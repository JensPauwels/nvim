local cmp = require('cmp')

cmp.setup {
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] ..
      " " .. vim_item.kind
      -- set a name for each source
      vim_item.menu = ({
        ultisnips = "[UltiSnips]",
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        nvim_lua = "[Lua]",
        cmp_tabnine = "[TabNine]",
      })[entry.source.name]
      return vim_item
    end
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping({
      i = function(a, b)
        if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
          return cmp.confirm({ select = true })
        end

        cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
      end
    }),
  },
  snippet = {expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end},
  sources = {
    {name = 'buffer'}, {name = 'nvim_lsp'}, {name = "ultisnips"},
    {name = "nvim_lua"}, {name = "look"}, {name = "path"},
    {name = 'cmp_tabnine'}, {name = "calc"}, {name = "spell"},
  },
  completion = {completeopt = 'menu,menuone,noinsert'},
}


-- TabNine
local tabnine = require('cmp_tabnine.config')
tabnine:setup({max_lines = 1000, max_num_results = 20, sort = true})
