local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
 if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
     "git",
     "clone",
     "--filter=blob:none",
     "--single-branch",
     "https://github.com/folke/lazy.nvim.git",
     lazypath,
   })
 end
 vim.opt.runtimepath:prepend(lazypath)

require('lazysettings')
require('coqsettings')
require('opts')
require('tokyonightsettings')
require('style')
require('lsp')
require('treesitter')
require('autopairs')
require('maps')
require('supertab')
require('statusline')
require('plugins')
