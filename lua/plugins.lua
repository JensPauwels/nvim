vim.cmd('packadd packer.nvim')
-- vim.cmd('packadd nvim-treesitter')
-- vim.cmd('packadd nvim-lspconfig')

return require('packer').startup(
  function()

    -- themes
    use 'challenger-deep-theme/vim'
    use 'drewtempelmeyer/palenight.vim'
    use 'EdenEast/nightfox.nvim'

    -- highlighting
    use 'folke/lsp-colors.nvim'
    use 'ap/vim-css-color'
    use 'maxmellon/vim-jsx-pretty'
    use 'folke/tokyonight.nvim'
    use 'nvim-treesitter/nvim-treesitter'

    -- cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

    -- lsp
    use 'williamboman/nvim-lsp-installer'

    -- completion
    use 'tpope/vim-abolish'
    use 'jiangmiao/auto-pairs'
    use 'mattn/emmet-vim'
    use 'ervandew/supertab'
    use 'tpope/vim-surround'

    -- tmux
    use 'edkolev/tmuxline.vim'

    -- lsp
    use 'onsails/lspkind-nvim'
    use 'neovim/nvim-lspconfig'

    -- commentary
    use 'tpope/vim-commentary'
    use 'kkoomen/vim-doge'

    -- navigation
    use 'scrooloose/nerdtree'

    -- snippets
    use 'SirVer/ultisnips' 

    -- package manager
    use 'wbthomason/packer.nvim'

    use 'mkitt/tabline.vim'
    
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
