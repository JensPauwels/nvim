vim.cmd('packadd packer.nvim')
-- vim.cmd('packadd nvim-treesitter')
-- vim.cmd('packadd nvim-lspconfig')

return require('packer').startup(
  function()
    use 'challenger-deep-theme/vim'
    use 'drewtempelmeyer/palenight.vim'
    use 'EdenEast/nightfox.nvim'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'quangnguyen30192/cmp-nvim-ultisnips'

    use 'onsails/lspkind-nvim'
    use 'neovim/nvim-lspconfig'
    use 'folke/lsp-colors.nvim'

    use 'scrooloose/nerdtree'
    use 'machakann/vim-sandwich'
    use 'tpope/vim-commentary'
    use 'SirVer/ultisnips'

    use 'tpope/vim-abolish'
    use 'edkolev/tmuxline.vim'
    use 'maxmellon/vim-jsx-pretty'
    use 'pangloss/vim-javascript'
    use 'ervandew/supertab'
    use 'wbthomason/packer.nvim'
    use 'jiangmiao/auto-pairs'
    use 'mattn/emmet-vim'
    use 'kkoomen/vim-doge'
    use 'nvim-lua/completion-nvim'
    use 'tpope/vim-surround'
    use 'mkitt/tabline.vim'
    use 'norcalli/nvim-colorizer.lua'
    use 'folke/tokyonight.nvim'
    use 'bling/vim-airline'
    use 'vim-airline/vim-airline-themes'
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

    use "hrsh7th/nvim-cmp" --completion
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

  end
)
