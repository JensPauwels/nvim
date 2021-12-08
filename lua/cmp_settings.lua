local cmp = require('cmp')
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

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
        look = "[Look]",
        path = "[Path]",
        spell = "[Spell]",
        calc = "[Calc]",
        emoji = "[Emoji]"
      })[entry.source.name]
      return vim_item
    end
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      cmp_ultisnips_mappings.jump_backwards(fallback)
    end, { "i", "s" })
  },
  snippet = {expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end},
  sources = {
    {name = 'buffer'}, {name = 'nvim_lsp'}, {name = "ultisnips"},
    {name = "nvim_lua"}, {name = "look"}, {name = "path"},
    {name = 'cmp_tabnine'}, {name = "calc"}, {name = "spell"},
    {name = "emoji"}
  },
  completion = {completeopt = 'menu,menuone'},
  preselect = false
}


-- TabNine
local tabnine = require('cmp_tabnine.config')
tabnine:setup({max_lines = 1000, max_num_results = 20, sort = true})

-- Database completion
vim.api.nvim_exec([[
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
]], false)
