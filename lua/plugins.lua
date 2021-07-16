vim.cmd('packadd packer.nvim')
-- vim.cmd('packadd nvim-treesitter')
-- vim.cmd('packadd nvim-lspconfig')

return require('packer').startup(
  function()
    use 'challenger-deep-theme/vim'
    use 'scrooloose/nerdtree'
    use 'machakann/vim-sandwich'
    use 'lifepillar/vim-gruvbox8'
    use 'tpope/vim-commentary'
    use 'SirVer/ultisnips'
    use 'edkolev/tmuxline.vim'
    use 'maxmellon/vim-jsx-pretty'
    use 'pangloss/vim-javascript'
    use 'ervandew/supertab'
    use 'jiangmiao/auto-pairs'
    use 'mattn/emmet-vim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'tweekmonster/startuptime.vim'
    use 'wbthomason/packer.nvim'
    use 'hrsh7th/nvim-compe'
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
  end
)
