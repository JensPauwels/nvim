vim.cmd('packadd packer.nvim')
return require('packer').startup(
  function()
    -- Spell checking
    use 'kamykn/spelunker.vim'

    -- Themes
    use 'challenger-deep-theme/vim'
    use 'rebelot/kanagawa.nvim'
    use 'yunlingz/equinusocio-material.vim'
    use 'Shatur/neovim-ayu'
    use 'catppuccin/nvim'

    -- Highlighting
    -- use 'folke/lsp-colors.nvim'
    use 'ap/vim-css-color'
    use 'maxmellon/vim-jsx-pretty'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Statusline
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Completion
    use {
      'ms-jpq/coq_nvim', 
      branch = 'coq'
    } 

    -- Svelte
    use 'evanleck/vim-svelte'
    use 'HerringtonDarkholme/yats.vim'

    -- Golang
    use 'fatih/vim-go'
    use 'sebdah/vim-delve'

    -- Lsp
    use 'onsails/lspkind-nvim'
    use 'neovim/nvim-lspconfig'

    -- Completion
    use 'tpope/vim-abolish'
    use 'mattn/emmet-vim'
    use 'ervandew/supertab'
    use 'tpope/vim-surround'
    use 'windwp/nvim-autopairs'

    -- FZF is required for my custom plugins
    use 'vijaymarupudi/nvim-fzf'

    -- easy motion
    use 'easymotion/vim-easymotion'

    -- Commentary
    use 'tpope/vim-commentary'

    -- Navigation
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require'nvim-tree'.setup {} end
    }

    -- snippets
    use 'SirVer/ultisnips' 

    -- package manager
    use 'wbthomason/packer.nvim'

    -- tabline
    use 'mkitt/tabline.vim'
    
    -- use {
    --   "folke/trouble.nvim",
    --   requires = "kyazdani42/nvim-web-devicons",
    --   config = function()
    --     require("trouble").setup {
    --     }
    --   end
    -- }

    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
  end
)
