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

    use 'onsails/lspkind-nvim'
    use 'neovim/nvim-lspconfig'
    use 'folke/lsp-colors.nvim'

    use 'scrooloose/nerdtree'
    use 'machakann/vim-sandwich'
    use 'tpope/vim-commentary'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use {
      'SirVer/ultisnips',
      requires = {{'honza/vim-snippets', rtp = '.'}},
      config = function()      
        vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'      
        vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
        vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
        vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end
    }

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

    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

  end
)
