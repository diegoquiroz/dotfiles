-- Python

return {
  -- Jupyter Notebooks
  {
    'hkupty/iron.nvim',
    config = function()
      require('iron.core').setup {
        config = {
          preferred = {
            python = "ipython"
          }
        }
      }
    end
  },

  'goerz/jupytext.vim',
  -- 'kana/vim-textobj-user',
  -- 'GCBallesteros/vim-textobj-hydrogen',
  --use 'bfredl/nvim-ipy'

}
