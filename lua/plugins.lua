vim.cmd('packadd packer.nvim')
-- vim.cmd('packadd nvim-treesitter')
-- vim.cmd('packadd nvim-lspconfig')

return require('packer').startup(
  function()
    use 'challenger-deep-theme/vim'
    use 'drewtempelmeyer/palenight.vim'
    use 'scrooloose/nerdtree'
    use 'machakann/vim-sandwich'
    use 'tpope/vim-commentary'
    use 'SirVer/ultisnips'
    use 'edkolev/tmuxline.vim'
    use 'maxmellon/vim-jsx-pretty'
    use 'pangloss/vim-javascript'
    use 'ervandew/supertab'
    use 'wbthomason/packer.nvim'
    use 'jiangmiao/auto-pairs'
    use 'mattn/emmet-vim'
    use 'tweekmonster/startuptime.vim'
    use 'hrsh7th/nvim-compe'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'tpope/vim-surround'
    use 'mkitt/tabline.vim'
    use 'norcalli/nvim-colorizer.lua'
    use 'folke/tokyonight.nvim'
    use 'folke/lsp-colors.nvim'
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    use {
      'glepnir/galaxyline.nvim',
      branch = 'main',
      -- your statusline
      -- some optional icons
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
  end
)
