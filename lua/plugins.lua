vim.cmd('packadd packer.nvim')
return require('packer').startup(
  function()
    -- themes
    use 'challenger-deep-theme/vim'
    use 'drewtempelmeyer/palenight.vim'
    use 'EdenEast/nightfox.nvim'
    use 'folke/tokyonight.nvim'
    use 'mhartington/oceanic-next'
    use 'trevordmiller/nova-vim'
    use 'bluz71/vim-nightfly-guicolors'

    -- highlighting
    use 'folke/lsp-colors.nvim'
    use 'ap/vim-css-color'
    use 'maxmellon/vim-jsx-pretty'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'quangnguyen30192/cmp-nvim-ultisnips'

    -- Golang
    use 'fatih/vim-go'


    -- lsp
    use 'onsails/lspkind-nvim'
    use 'neovim/nvim-lspconfig'

    -- completion
    use 'tpope/vim-abolish'
    use 'jiangmiao/auto-pairs'
    use 'mattn/emmet-vim'
    use 'ervandew/supertab'
    use 'tpope/vim-surround'

    -- FZF is required for my custom plugins
    use 'vijaymarupudi/nvim-fzf'


    -- commentary
    use 'tpope/vim-commentary'
    use 'kkoomen/vim-doge'

    -- navigation
    use 'scrooloose/nerdtree'

    -- snippets
    use 'SirVer/ultisnips' 

    -- package manager
    use 'wbthomason/packer.nvim'

    -- tabline
    use 'mkitt/tabline.vim'
    
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
        }
      end
    }

    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
  end
)
